import 'dart:io';

import 'package:adminor/AdeversitingPages/AdvertisingDetailPage.dart';
import 'package:adminor/api/Functions.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'AdeversitingPages/AdvertisingPage.dart';
import 'AdeversitingPages/NewAdversitingPage.dart';
import 'Settings/settingsPage.dart';
import 'chat/displayChatPage.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  XFile? image;
  final ImagePicker picker = ImagePicker();
  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    if(img!=null){
      setState(() {
        image = img;
      });
    }
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('لطفا یک گذینه را انتخاب کنید',style: TextStyle(fontFamily: 'Shabnam',fontSize: 16),),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6+5,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.image,color: Colors.blue,),
                        SizedBox(width: 5,),
                        Text('گالری',style: TextStyle(fontFamily: 'Shabnam',fontSize: 12),),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5,),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.camera,color: Colors.purple,),
                        SizedBox(width: 5,),
                        Text('دوربین',style: TextStyle(fontFamily: 'Shabnam',fontSize: 12),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;

    TextEditingController nameController=TextEditingController(text: cache.read('name'));
    TextEditingController emailController=TextEditingController(text: cache.read('email'));
    TextEditingController phoneController=TextEditingController(text:cache.read('telephone'));
    TextEditingController locationController=TextEditingController(text:'تهران');
    return SafeArea(
      child: Scaffold(
        body:  Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0,bottom: 100),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StatefulBuilder(builder: (BuildContext context, StateSetter setState)=>
                      InkWell(
                        onTap: () {
                          if(image==null){
                            myAlert();
                            cache.write('profile_image', 'https://192.168.1.104/adminor/uploads/useravatar.png');
                            setState((){});
                          }
                          else{
                          image=null;print(image!.path);
                            cache.write('profile_image', 'https://192.168.1.104/adminor/uploads/useravatar.png');
                          setState((){});
                          }
                          }
                         ,
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              border:  const DashedBorder.fromBorderSide(side: BorderSide(color: Colors.green), dashLength: 6),
                              borderRadius: BorderRadius.circular(50)),
                            child: image!=null?ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.file(
                                //to show image, you type like this.
                                File(image!.path),
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                              ),
                            ):ClipRRect(borderRadius:BorderRadius.circular(50),child: Image.network(cache.read('profile_image'),width: 50,height: 50,))),



                          /*Center(child:ClipRRect(borderRadius: BorderRadius.circular(50),child: Image.network(cache.read('profile_image')))),*/
                        ),
                      ),

                  const SizedBox(height: 50),
                  SizedBox(
                    width: w-50,
                    child: TextField(keyboardType: TextInputType.name,controller: nameController,style:const TextStyle(fontFamily: 'Shabnam',fontSize: 16),
                      decoration: const InputDecoration(suffixIcon:Icon(Icons.account_circle_rounded),label:Text('نام',style: TextStyle(fontFamily: 'Shabnam'),),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2))
                      ,
                    ),),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: w-50,
                    child: TextField(style:const TextStyle(fontFamily: 'Vazir'),controller: emailController,keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(suffixIcon:Icon(Icons.mail),label:Text('ایمیل',style: TextStyle(fontFamily: 'Shabnam'),),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2))
                      ,
                    ),),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: w-50,
                    child: TextField(style:const TextStyle(fontFamily: 'Vazir',color: Colors.grey),controller:phoneController,readOnly: true,keyboardType: TextInputType.number,
                      decoration: const InputDecoration(suffixIcon:Icon(Icons.phone_android),label:Text('تلفن همراه',style: TextStyle(fontFamily: 'Shabnam'),),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1)),labelStyle: TextStyle(color: Colors.grey)
                      ,
                    ),),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: w-50,
                    child: TextField(style:const TextStyle(fontFamily: 'Vazir'),controller:locationController,readOnly: true,keyboardType: TextInputType.number,
                      decoration: const InputDecoration(suffixIcon:Icon(Icons.location_city),label:Text('مکان',style: TextStyle(fontFamily: 'Shabnam'),),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2))
                      ,
                    ),),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: (){


                    showDialog(context: context, builder: (context) =>  AlertDialog(
                        actions: [
                          TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),onPressed: (){Navigator.of(context).pop();}, child: const Text('انصراف',style: TextStyle(fontFamily: 'Vazir',fontSize: 15,color: Colors.white),)),
                          TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),onPressed: (){
                           cache.write('name', nameController.text);
                           image==null?null:cache.write('profile_image', 'https://192.168.1.106/adminor/uploads/${image!.path.substring(78)}',);
                           cache.write('email', emailController.text);
                           cache.write('city', 'تهران');
                           updateUserInfo(nameController.text, emailController.text,'تهران',image==null?null:image);
                           setState(() {

                           });
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Settings(),));
                            setState(() {

                            });
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              shape: StadiumBorder(),
                              elevation: 0,
                              backgroundColor: Colors.green,
                              width: 300,
                              content: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('اطلاعات کاربر با موفقیت آپدیت شد',style: TextStyle(color: Colors.white,fontFamily: 'Shabnam'),),Icon(Icons.delete_outline_rounded,color: Colors.white,)])));

                            },
                              child: const Text('تایید',style: TextStyle(fontFamily: 'Vazir',fontSize: 15,color: Colors.white),))
                        ],
                        title:const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          Text('آیا مطمعن هستید؟',style: TextStyle(fontFamily: 'Vazir',fontSize: 15),),
                          Icon(Icons.error,color: Colors.blue,)],)
                    ),);



                  },style: ButtonStyle(fixedSize: MaterialStateProperty.all(const Size(150, 40)),backgroundColor: MaterialStateProperty.all(Colors.green)), child: const Text('ثبت تغییرات',style: TextStyle(fontFamily: 'Shabnam',fontSize: 16,color: Colors.white),),)
                ]),
          ),
        ),
          ),
        floatingActionButton:bottomMenu(context) ,
      ),
    );
  }
}
Widget bottomMenu(context) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: const [BoxShadow(color: Colors.grey,blurRadius: 5)],
      borderRadius: BorderRadius.circular(25), color: Colors.green,),
    width: MediaQuery.of(context).size.width - 20,
    child: Padding(
      padding: const EdgeInsets.all(7.0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Advertising(),));},
                    icon: const Icon(Icons.home, color: Colors.white,)),
                IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const DisplayChat(),));},
                    icon: const Icon(Icons.chat, color: Colors.white)),
                IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const NewAdvertising(),));},
                    icon: const Icon(Icons.add_circle, color: Colors.white)),
              ],),
            IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>const Settings(),));},
                icon: const Icon(
                  Icons.manage_accounts_sharp, color: Colors.white,))
          ]),
    ),

  );

}
