import 'package:adminor/AdeversitingPages/AdvertisingDetailPage.dart';
import 'package:adminor/structure.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'as convert;

import 'package:image_picker/image_picker.dart';

List<UserStructure> users=[];
List<FavoriteHolder> favorites=[];
var baseUrl='https://192.168.1.106/adminor';

void loginUser(String mobile) async{
  var url = Uri.parse('$baseUrl/?action=adduser');
  var response = await http.post(url, body: {'phone': mobile});
  final cache=GetStorage();
  cache.write('telephone', mobile);
  /*  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');*/
  //print(cache.getString('phone'));
  //کاربر در صورت وجود وارد برنامه میشود در صورت نبود با متد پست در پایگاه داده ذخیره میشود
}
//Login Page
void getUsers() async{
  var url = Uri.parse('$baseUrl/gettAllUsers.php?action=getAllUsers');
  var response = await http.get(url);
  if(response.statusCode==200){
    var jsonResponse=convert.jsonDecode(response.body);
    for(var i in jsonResponse){
      var userItem=UserStructure(i['id'], i['phone'], i['name'], i['price'], i['type'], i['image'], i['city'], i['dealType'], i['payment_Method'], i['startTime'], i['endTime'], i['special_Conditions'], i['history'], i['email_1'], i['email_2'],i['status']);
      users.add(userItem);

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
    var jsonResponse=convert.jsonDecode(response.body);
    if(jsonResponse.length>1){
      for(var i in jsonResponse){
        var item=FavoriteHolder(i['id'], i['phone'], i['adminphone'], i['status']);
        favorites.add(item);
      }
      for(int i=0;i<jsonResponse.length;i++){
        if("0${favorites[i].adminPhone}"==users[i].phone_number && '0${favorites[i].phone}'==cache.read('telephone')){
          cache.write(users[i].phone_number, true);
          print('object2');
        }
      }
    }
  else if(jsonResponse.length==0){
    for(int k=0;k<users.length;k++){
      cache.write(users[k].phone_number, false);
    }
  }

  }
}
void addFavorite(var adminPhone)async{
  final cache=GetStorage();
  var url = Uri.parse('$baseUrl/?action=addfavorite');
  await http.post(url, body: {'phone': cache.read('telephone'),'adminPhone':adminPhone});
}
void suggestionSystem(){

}
// ignore: non_constant_identifier_names
void submitRating(double Rating,String phone) async{
  var url = Uri.parse('$baseUrl/adminor/?action=rating');
  var response = await http.post(url, body: {'rating': Rating.toString(),'phone':cache.read('telephone'),'adminphone':phone});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}
void checkRating() async{
  var url = Uri.parse('$baseUrl/adminor/?action=checkrating');
  var response = await http.post(url, body: {'phone': cache.read('telephone')});
  if(response.statusCode==200){
    var jsonResponse=convert.jsonDecode(response.body);
    if(jsonResponse.length>1){
      for(int i=0;i<jsonResponse.length;i++){
        if("0${jsonResponse['adminphone']}"==users[i].phone_number && '0${jsonResponse['phone']}'==cache.read('telephone')){
          cache.write('${users[i].phone_number}rated', true);
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
    int startTime,int endTime,String specialConditions,var history,var status,XFile image) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('https://192.168.1.106/adminor/upload.php'));
  request.files.add(await http.MultipartFile.fromPath('image', image!.path));
  var response = await request.send();
  if (response.statusCode == 200) {
    print('Image uploaded successfully');
  } else {
    print('Failed to upload image');
  }
  var url = Uri.parse('$baseUrl/?action=addAdmin');
  var registerResponse = await http.post(url, body: {'registerPhone':cache.read('telephone'),'phone': phone,'name':name,'adminType':adminType,'email':email,'email2':email2,'price':price,'city':city,
    'dealType':dealType,'paymentMethod':paymentMethod,'startTime':startTime.toString(),'endTime':endTime.toString(),'specialConditions':specialConditions==null?'':specialConditions,'history':history,'status':status,'image':image.name});
  if(registerResponse.statusCode==200){
    print('new admin added');
    getUsers();
  }
}
//Add Admin
void fetchMyAdmins() async{

}
//Get Admins
void deleteMyAdmin() async{

}
//Delete Admins
//Pro user or Basic