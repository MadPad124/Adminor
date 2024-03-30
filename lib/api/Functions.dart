
import 'package:http/http.dart' as http;
import 'dart:convert'as convert;

void loginUser(String mobile) async{
  var url = Uri.parse('https://192.168.1.106/adminor/?action=adduser');
/*http.post(url,body: {'phone':mobile}).then((response) {
  print(response.body);
});*/
  var response = await http.post(url, body: {'phone': mobile, 'email_2': 'blue'});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  //کاربر در صورت وجود وارد برنامه میشود در صورت نبود با متد پست در پایگاه داده ذخیره میشود
}
//Login Page
void getUsers() async{
/*  var url =
  Uri.parse('https://192.168.1.106/adminor/');
  var response = await http.get(url);
  if(response.statusCode==200){

    var jsonResponse=convert.jsonDecode(response.body);
    print(jsonResponse[0]['history']);
    print(jsonResponse[0]['email_1']);
  }*/
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

}
void addFavorite()async{

}
void suggestionSystem(){

}
void submitRating(){

}
//Favorites
void addAdmin()async{

}
//Add Admin
void fetchMyAdmins() async{

}
//Get Admins
void deleteMyAdmin() async{

}
//Delete Admins
void checkRating(){

}
//Pro user or Basic