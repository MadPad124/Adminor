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
/*List<userInfoHolder> userInfo=[];*/
List<int>favoriteIndex=[];
var baseUrl='https://192.168.1.104/adminor';

void loginUser(String mobile) async{
  var url = Uri.parse('$baseUrl/?action=adduser');
  await http.post(url, body: {'phone': mobile});
  final cache=GetStorage();
  cache.write('telephone', mobile);

  //کاربر در صورت وجود وارد برنامه میشود در صورت نبود با متد پست در پایگاه داده ذخیره میشود
}
//Login Page
void getUsers() async{
  print('user fetching...');
  users=[];
  var url = Uri.parse('$baseUrl/gettAllUsers.php?action=getAllUsers');
  var response = await http.get(url);
  if(response.statusCode==200){
     userResponse=convert.jsonDecode(response.body);

    for(var i in userResponse){
      var userItem=UserStructure(int.parse(i['id']), i['phone'], i['adminPhone'],i['name'], i['price'], i['type'], i['image'], i['city'], i['dealType'], i['payment_Method'], i['startTime'], i['endTime'], i['special_Conditions'], i['history'], i['email_1'], i['email_2'],i['status']);
      users.add(userItem);
      if('0${i['adminPhone']}'==cache.read('telephone')){
        myUsers.add(userItem);
      }


    }
  }
}
void filter(){

  }
void search(){

}
//First Page
void fetchChats()async{
  //لیست کاربران موجو که با آنها چت شده است را دریافت میکند
}
void fetchChatsText()async{
  //لیست پیام های موجود که با آنها چت شده است را دریافت میکند
}
//Chats
void updateProfile() async{

}
//Profile
void getFavorites() async{
  var url = Uri.parse('$baseUrl/gettAllUsers.php?action=getfavorite');
  var response = await http.post(url, body: {'phone': cache.read('telephone')});
  if(response.statusCode==200){
    print(response.body);
    var jsonResponse=convert.jsonDecode(response.body);
    if(jsonResponse!=null){
      for(var i in jsonResponse){
        var item=FavoriteHolder(i['id'], i['phone'], i['adminphone'],i['indexUser']);
        favorites.add(item);
      }

      for(int u=0;u<users.length;u++){
        for(int f=0;f<favorites.length;f++){
          if("0${favorites[f].adminPhone}"==users[u].phone_number && '0${favorites[f].phone}'==cache.read('telephone')){
            cache.write(users[u].phone_number, true);
            favoriteIndex.add(int.parse(favorites[f].index));
          }
        }}
    }
  else if(jsonResponse.length==0){
    for(int k=0;k<users.length;k++){
      cache.write(users[k].phone_number, false);
    }
  }

  }

}
void addFavorite(var adminPhone,int index)async{
  final cache=GetStorage();
  var url = Uri.parse('$baseUrl/?action=addfavorite');
 var response= await http.post(url, body: {'phone': cache.read('telephone'),'adminPhone':adminPhone,'index':index.toString()});
print(response.body);
if(favoriteIndex.contains(index)==false){
  favoriteIndex.add(index);
}
else{
  favoriteIndex.remove(index);
}
}
void suggestionSystem(){

}
// ignore: non_constant_identifier_names
void submitRating(double Rating,String phone) async{
  var url = Uri.parse('$baseUrl/?action=rating');
  var response = await http.post(url, body: {'rating': Rating.toString(),'phone':cache.read('telephone'),'adminphone':phone});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}
void checkRating() async{
  var url = Uri.parse('$baseUrl/?action=checkrating');
  var response = await http.post(url, body: {'phone': cache.read('telephone')});
  if(response.statusCode==200){
    var jsonResponse=convert.jsonDecode(response.body);
    if(jsonResponse.length>1){
      for(int i=0;i<jsonResponse.length;i++){
        if('0${jsonResponse['adminphone']}'==users[i].phone_number && '0${jsonResponse['phone']}'==cache.read('telephone')){
          cache.write('${users[i].phone_number}rated', true);
          print('ok');
        }
      }
    }
    else if(jsonResponse.length==0){
      for(int k=0;k<users.length;k++){
        cache.write('${users[k].phone_number}rated', false);
      }
    }
  }

}
//Favorites
//Add Admin
Future<void> addNewAdmin(String name,String phone,String adminType,String email,String email2,String price,String city,String dealType,String paymentMethod,
    int startTime,int endTime,String specialConditions,var history,var status,[XFile? image]) async {
  if(image!=null){
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/upload.php'));
    request.files.add(await http.MultipartFile.fromPath('image', image!.path));
    var response = await request.send();
    if (response.statusCode == 200) {
      print('Image uploaded successfully');
      var url = Uri.parse('$baseUrl/?action=addAdmin');
      var registerResponse = await http.post(url, body: {'registerPhone':cache.read('telephone'),'phone': phone,'name':name,'adminType':adminType,'email':email,'email2':email2,'price':price,'city':city,
        'dealType':dealType,'paymentMethod':paymentMethod,'startTime':startTime.toString(),'endTime':endTime.toString(),'specialConditions':specialConditions==null?'':specialConditions,'history':history,'status':status,'image':image!.name});
      if(registerResponse.statusCode==200){
        print('new admin added');
        print(registerResponse.body);
      }
      else{
        print('failed to add new admin');
      }
    }
    else {
      print('Failed to upload image');
    }
  }
  else{
    var url = Uri.parse('$baseUrl/?action=addAdmin');
    var registerResponse = await http.post(url, body: {'registerPhone':cache.read('telephone'),'phone': phone,'name':name,'adminType':adminType,'email':email,'email2':email2,'price':price,'city':city,
      'dealType':dealType,'paymentMethod':paymentMethod,'startTime':startTime.toString(),'endTime':endTime.toString(),'specialConditions':specialConditions==null?'':specialConditions,'history':history,'status':status,'image':'useravatar.png'});
    if(registerResponse.statusCode==200){
      print('new admin added');

    }
    else{
      print('failed to add new admin');
    }
  }
}
//Add Admin
void deleteMyAdmin(int id) async{
  var url = Uri.parse('$baseUrl/?action=deleteAdmin');
  var response=await http.post(url, body: {'id': id.toString()});
  if(response.statusCode==200){
    print(response.body);
  }
  else{
    print('there is problem in connection');
  }
}
//Delete Admins
void sendMessage() async{

}
void getInfo(var mobile) async{
    var url = Uri.parse('$baseUrl/gettAllUsers.php?action=getInfo');
    var response=await http.post(url, body: {'phone': mobile});
    if(response.statusCode==200){
      var jsonResponse=convert.jsonDecode(response.body);
      if(jsonResponse.length>0){
        final cache=GetStorage();
          cache.write('name', jsonResponse[0]['name']);
          cache.write('profile_image', jsonResponse[0]['profile_image']);
          cache.write('email', jsonResponse[0]['email']);
          cache.write('city', jsonResponse[0]['city']);
          print('User info has recived ');
      }
    }

}
void updateUserInfo(String name,String email,String city,[XFile? file]) async{
  if(file!=null){
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/upload.php'));
    request.files.add(await http.MultipartFile.fromPath('image', file!.path));
    var response = await request.send();
    if (response.statusCode == 200) {
      print('Image uploaded successfully');

    }
    else {
      print('Failed to upload image');
    }
  }
  var url = Uri.parse('$baseUrl/?action=updateUser');
  var registerResponse = await http.post(url, body: {'name':name,'profile_image': file!=null?file.name:'useravatar.png','email':email,'city':city,'email':email,'tell':cache.read('telephone')});
  if(registerResponse.statusCode==200){
    print(registerResponse.body);
  }
  else{
    print('failed to update user');
  }

}
//Pro user or Basic