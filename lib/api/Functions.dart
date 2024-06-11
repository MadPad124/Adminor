import 'dart:convert' as convert;
import 'package:adminor/AdeversitingPages/AdvertisingDetailPage.dart';
import 'package:adminor/structure.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:image_picker/image_picker.dart';
var userResponse;
List<UserStructure> users=[];
List<UserStructure> myUsers=[];
List<FavoriteHolder> favorites=[];
List<HistoryHolder> history=[];
List<int>favoriteIndex=[];
var date=DateTime.now();
var baseUrl='https://192.168.23.35/adminor';

void loginUser(String mobile) async{
  var url = Uri.parse('$baseUrl/?action=adduser');
  var response=await http.post(url, body: {'phone': mobile});
  final cache=GetStorage();
  cache.write('telephone', mobile);
/*  if(response.body=='no user foundNew user created successfully'){
    cache.write('city', 'تهران');
  }
  else{
    var city=convert.jsonDecode(response.body);
    print('${city[0]['city'].toString()} here is city');
    cache.write('city', city[0]['city']);
  }*/
  print(response.body);
  //کاربر در صورت وجود وارد برنامه میشود در صورت نبود با متد پست در پایگاه داده ذخیره میشود
}
//Login Page
void getUsers() async {
    print('user fetching...');
    users = [];
    var url = Uri.parse('$baseUrl/gettAllUsers.php?action=getAllUsers');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      userResponse=[];
      userResponse = convert.jsonDecode(response.body);

      for (var i in userResponse) {
        var userItem = UserStructure(
            int.parse(i['id']),
            i['phone'],
            i['adminPhone'],
            i['name'],
            i['price'],
            i['type'],
            i['image'],
            i['city'],
            i['dealType'],
            i['payment_Method'],
            i['startTime'],
            i['endTime'],
            i['special_Conditions'],
            i['history'],
            i['email_1'],
            i['email_2'],
            i['status'],
            int.parse(i['score']));
      //  if (cache.read('city') == i['city']) {
          users.add(userItem);
          int j=0;
          if(int.parse(i['id'])>users[j].id||int.parse(i['id'])>users[j].id){
            cache.write('bigId', i['id']);
          }
       // }
        if ('0${i['adminPhone']}' == cache.read('telephone')) {
          myUsers.add(userItem);
        }
      }
      print('big id is ${cache.read('bigId')}');
    }
  }
//First Page
  void getFavorites() async {
    var url = Uri.parse('$baseUrl/gettAllUsers.php?action=getfavorite');
    var response = await http.post(url, body: {'phone': cache.read('telephone').toString().substring(1,11)});
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      if (jsonResponse != null) {
        for (var i in jsonResponse) {
          var item = FavoriteHolder(i['id'], i['phone'], i['adminphone'], i['indexUser']);
          favorites.add(item);
        }
        for (int u = 0; u < users.length; u++) {
          for (int f = 0; f < favorites.length; f++) {
            if ("0${favorites[f].adminPhone}" == users[u].phone_number &&
                '0${favorites[f].phone}' == cache.read('telephone')) {
              cache.write(users[u].phone_number, true);
              favoriteIndex.add(int.parse(favorites[f].index));
            }
            else{
              for (int u = 0; u < users.length; u++) {
                for (int f = 0; f < favorites.length; f++) {
              cache.write(users[u].phone_number, false);
            }
            }
            }
          }
        }
      }
      else if (jsonResponse.length == 0) {
        for (int k = 0; k < users.length; k++) {
          cache.write(users[k].phone_number, false);
        }
      }
    }
  }
  void addFavorite(var adminPhone, int index) async {
    final cache = GetStorage();
    var url = Uri.parse('$baseUrl/?action=addfavorite');
    var response = await http.post(url, body: {
      'phone': cache.read('telephone'),
      'adminPhone': adminPhone,
      'index': index.toString()
    });
    print(response.body);
    if (favoriteIndex.contains(index) == false) {
      favoriteIndex.add(index);
    }
    else {
      favoriteIndex.remove(index);
    }
  }
// ignore: non_constant_identifier_names
  void submitRating(double Rating, String phone) async {
    var url = Uri.parse('$baseUrl/?action=rating');
    var response = await http.post(url, body: {
      'rating': Rating.toString(),
      'phone': cache.read('telephone'),
      'adminphone': phone
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
  void checkRating() async {
    var url = Uri.parse('$baseUrl/?action=checkrating');
    var response = await http.post(
        url, body: {'phone': cache.read('telephone')});
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var jsonResponse = convert.jsonDecode(response.body);
        if (jsonResponse.length > 1) {
          for (int i = 0; i < jsonResponse.length; i++) {
            if ('0${jsonResponse[i]['adminphone']}' == users[i].phone_number &&
                '0${jsonResponse[i]['phone']}' == cache.read('telephone')) {
              cache.write('${users[i].phone_number}rated', true);

              print('check rated is done');
            }
            else {
              cache.write('${users[i].phone_number}rated', false);
            }
          }
        }
        else if (jsonResponse.length == 0) {
          for (int k = 0; k < users.length; k++) {
            cache.write('${users[k].phone_number}rated', false);
          }
        }
      }
    }
  }
//Favorites
//Add Admin
  Future<void> addNewAdmin(String name, String phone, String adminType,
      String email, String phone2, String price, String city, String dealType,
      String paymentMethod,
      int startTime, int endTime, String specialConditions, var history,
      var status, [XFile? image]) async {
    if (image != null) {
      var request = http.MultipartRequest(
          'POST', Uri.parse('$baseUrl/upload.php'));
      request.files.add(
          await http.MultipartFile.fromPath('image', image.path));
      var response = await request.send();
      if (response.statusCode == 200) {
        print('Image uploaded successfully');
        var url = Uri.parse('$baseUrl/?action=addAdmin');
        var registerResponse = await http.post(url, body: {
          'registerPhone': cache.read('telephone'),
          'phone': phone,
          'name': name,
          'adminType': adminType,
          'email': email,
          'phone2': phone2,
          'price': price,
          'city': city,
          'dealType': dealType,
          'paymentMethod': paymentMethod,
          'startTime': startTime.toString(),
          'endTime': endTime.toString(),
          'specialConditions': specialConditions == null?'' : specialConditions,
          'history': history,
          'status': status,
          'image': image.name
        });
        if (registerResponse.statusCode == 200) {
          print('new admin added');
          print(registerResponse.body);
          sendOtp(phone2.toString(), 'message',name);
        }
        else {
          print('failed to add new admin');
        }
      }
      else {
        print('Failed to upload image');
      }
    }
    else {
      var url = Uri.parse('$baseUrl/?action=addAdmin');
      var registerResponse = await http.post(url, body: {
        'registerPhone': cache.read('telephone'),
        'phone': phone,
        'name': name,
        'adminType': adminType,
        'email': email,
        'phone2': phone2,
        'price': price,
        'city': city,
        'dealType': dealType,
        'paymentMethod': paymentMethod,
        'startTime': startTime.toString(),
        'endTime': endTime.toString(),
        'specialConditions': specialConditions == null ? '' : specialConditions,
        'history': history,
        'status': status,
        'image': 'adminorUser.jpeg'
      });
      if (registerResponse.statusCode == 200) {
        print('new admin added');
        sendOtp(phone2.toString(), 'message',name);
      }
      else {
        print('failed to add new admin');
      }
    }
  }
//Add Admin
  void deleteMyAdmin(var phone) async {
    var url = Uri.parse('$baseUrl/?action=deleteAdmin');
    var response = await http.post(url, body: {'phone': phone.toString().substring(1,11)});
    if (response.statusCode == 200) {
      print(response.body);
    }
    else {
      print('there is problem in connection');
    }
  }
//Delete Admins
  void getInfo(var mobile) async {
    var url = Uri.parse('$baseUrl/gettAllUsers.php?action=getInfo');
    var response = await http.post(url, body: {'phone': mobile});
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      if (jsonResponse.length > 0) {
        final cache = GetStorage();
        cache.write('name', jsonResponse[0]['name']);
        cache.write('profile_image',
            '$baseUrl/uploads/${jsonResponse[0]['profile_image']}');
        cache.write('email', jsonResponse[0]['email']);
        cache.write('city', jsonResponse[0]['city']);
        //history.add(HistoryHolder(0, cache.read('telephone'), DateTime.parse('dd/MM/yy').toString(), 'ورود به ادمینور', 'کاربر گرامی شما در تاریخ ${DateTime.parse('dd/MM/yy').toString()} وارد برنامه شدید'));
        print('User info has Recived ');
      }
      else {
        cache.write('name', 'کاربر');
        cache.write('profile_image', '$baseUrl/uploads/adminorUser.jpeg');
        cache.write('email', 'adminor@gmail.com');
        cache.write('city', 'تهران');
        //history.add(HistoryHolder(0, cache.read('telephone'), DateTime.parse('dd/MM/yy').toString(), 'ثبت نام در ادمینور', 'کاربر گرامی شما در تاریخ ${DateTime.parse('dd/MM/yy').toString()} ثبت نام کردید'));
        print('new user added');
      }
    }
  }
  void updateUserInfo(String name, String email, String city,
      [XFile? file]) async {
    if (file != null) {
      var request = http.MultipartRequest(
          'POST', Uri.parse('$baseUrl/upload.php'));
      request.files.add(await http.MultipartFile.fromPath('image', file.path));
      var response = await request.send();
      if (response.statusCode == 200) {
        print('Image uploaded successfully');
      }
      else {
        print('Failed to upload image');
      }
    }
    var url = Uri.parse('$baseUrl/?action=updateUser');
    var registerResponse = await http.post(url, body: {
      'name': name,
      'profile_image': file != null ? file.name : 'adminorUser.jpeg',
      'email': email,
      'city': city,
      'tell': cache.read('telephone')
    });
    if (registerResponse.statusCode == 200) {
      print(registerResponse.body);
    }
    else {
      print('failed to update user');
    }
  }
  submitScore(int id, int score) async {
    var url = Uri.parse('$baseUrl/?action=scoreFunction');
    try {
      var response = await http.post(
          url, body: {'id': id.toString(), 'score': score.toString()});
      if (response.statusCode == 200) {
        print(response.body);
      }
      else {
        print('failed to update user');
      }
    }
    catch (e) {
      print(e);
    }
  }

  void getHistory(var mobile) async {
    var url = Uri.parse('$baseUrl/gettAllUsers.php?action=getHistory');
    var response = await http.post(url, body: {'phone': mobile});
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var i in jsonResponse) {
        var userItem = HistoryHolder(
            int.parse(i['id']), i['tell'], i['date'], i['messageTitle'],
            i['messageText']);
        history.add(userItem);
      }

      print('history Received');
    }
  }

  submitHistory(var mobile, String type, UserStructure user) async {
  print(type);
    var url = Uri.parse('$baseUrl/index.php?action=addHistory');
    var response = await http.post(url, body: {
      'mobile': mobile,
      'type': type,
      'name':user.name
    });
    if (response.statusCode == 200) {
      if (response.body == 'history added') {
        switch (type) {
          case 'register':
            var item = HistoryHolder(1224, cache.read('telephone'),
                '${date.year.toString()}-${date.month.toString()}-${date.day
                    .toString()}', 'ثبت نام در ادمینور',
                'کاربر گرامی شما در تاریخ ${date.day.toString()}-${date.month
                    .toString()}-${date.year
                    .toString()} در ادمینور ثبت نام کردید');
            history.add(item);
            break;
          case 'login':
            var item = HistoryHolder(1229, cache.read('telephone'),
                '${date.year.toString()}-${date.month.toString()}-${date.day
                    .toString()}', 'ورود به ادمینور',
                'کاربر گرامی شما در تاریخ ${date.day.toString()}-${date.month
                    .toString()}-${date.year.toString()} وارد ادمینور شدید');
            history.add(item);
            break;
          case 'profile':
            var item = HistoryHolder(1223, cache.read('telephone'),
                '${date.year.toString()}-${date.month.toString()}-${date.day
                    .toString()}', 'بروزرسانی پروفایل',
                'کاربر گرامی شما در تاریخ ${date.day.toString()}-${date.month
                    .toString()}-${date.year
                    .toString()} پروفایل خود را بروزرسانی کردید');
            history.add(item);
            break;
          case 'add':
            var item = HistoryHolder(1225, cache.read('telephone'),
                '${date.year.toString()}-${date.month.toString()}-${date.day
                    .toString()}', 'افزودن ادمین',
                'کاربر گرامی شما در تاریخ ${date.day.toString()}-${date.month
                    .toString()}-${date.year
                    .toString()} یک ادمین جدید اضافه کردید');
            history.add(item);
            break;
          case 'remove':
            var item = HistoryHolder(1226, cache.read('telephone'),
                '${date.year.toString()}-${date.month.toString()}-${date.day
                    .toString()}', 'حذف ادمین',
                'کاربر گرامی در تاریخ ${date.day.toString()}-${date.month
                    .toString()}-${date.year.toString()} ادمین ${user
                    .name} را حذف کردید');
            history.add(item);
            break;
          case 'rating':
            var item = HistoryHolder(1227, user.phone_number,
                '${date.year.toString()}-${date.month.toString()}-${date.day
                    .toString()}', 'امتیاز دهی',
                'کاربر گرامی در تاریخ ${date.day.toString()}-${date.month
                    .toString()}-${date.year.toString()}  به ${user
                    .name} امتیاز دادید');
            history.add(item);
            break;
          case 'call':
            var item = HistoryHolder(250, cache.read('telephone'),
                '${date.year.toString()}-${date.month.toString()}-${date.day
                    .toString()}', 'تماس با ادمینور',
                'کاربر عزیز پیام شما با موفقیت ارسال شد در اسرع وقت به پیام شما پاسخ خواهیم داد');
            history.add(item);
            break;
          case 'alarm':
            print('0${user.adminPhone}');
            if('0${user.adminPhone}'==cache.read('telephone')) {
              var item = HistoryHolder(255550, cache.read('telephone'),
                  '${date.year.toString()}-${date.month.toString()}-${date.day
                      .toString()}', 'هشدار حذف ادمین',
                  'امتیاز کاربر ${user.name}  به کمتر از حد مجاز رسیده است ');
              history.add(item);
              break;
            }
        }
        print('new history added');
      }
      else {
        print('there is problem to add history');
        print(response.body);
      }
    }
    else {
      print('there is problem to connection');
    }
  }
void sendOtp(var tell,var type,String user)async{
  var url=Uri.parse('$baseUrl/sendMessage.php?action=$type');
  var response=await http.post(url,body: {'tell':tell,'user':user});
  if(response.statusCode==200){
    if(response.body.isNotEmpty){
    var code=convert.jsonDecode(response.body);
    cache.write('otp',code.toString().substring(7,13));
    print(response.body);
  }}
}
//Pro user or Basic
/*
signingWithPhone() async{
  FirebaseAuth auth=FirebaseAuth.instance;
  try{
    await auth.verifyPhoneNumber(verificationCompleted: (PhoneAuthCredential credential) async{},
        verificationFailed: (e){
      throw Exception(e.toString());
        }, codeSent: ((String verificationId,int? resendToken) async{
          await Future.delayed(Duration(seconds: 2));
        }), codeAutoRetrievalTimeout: (String verificationId){});
  } on FirebaseAuthException catch(e){
    print(e.toString());

  };
}*/
