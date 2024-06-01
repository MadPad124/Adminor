import 'dart:io';
import 'package:adminor/api/Functions.dart';
import 'package:adminor/structure.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'AdeversitingPages/AdvertisingPage.dart';
import 'AdeversitingPages/NewAdversitingPage.dart';
import 'Settings/settingsPage.dart';
import 'chat/displayChatPage.dart';
import 'cities.dart';
final cache = GetStorage();
TextEditingController nameController=TextEditingController(text: cache.read('name'));
TextEditingController emailController=TextEditingController(text: cache.read('email'));
TextEditingController phoneController=TextEditingController(text:cache.read('telephone'));
TextEditingController searchBoxController2=TextEditingController();
TextEditingController locationController=TextEditingController(text:cache.read('city'));
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
    var hasImage=cache.read('profile_image')!=null?true:false;
    List<String> filteredCities=[];
    ValueNotifier<String> stateNotifier=ValueNotifier('notAllChecked');
    var w=MediaQuery.of(context).size.width;

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
                            hasImage=false;
                            setState((){});
                          }
                          else{
                            hasImage=false;
                          image=null;print(image!.path);
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
                            ):ClipRRect(borderRadius:BorderRadius.circular(50),child: hasImage==true?Image.network(cache.read('profile_image'),width: 50,height: 50,): Image.asset('assets/images/adminorUser.jpeg',width: 50,height: 50,))),



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
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2)),
                    ),
                    onTap: (){
                      showDialog(context: context, builder: (context) => AlertDialog(contentPadding: const EdgeInsets.only(top:10),
                          content: SingleChildScrollView(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  SizedBox(
                                    width:MediaQuery.of(context).size.width,
                                    child: const Padding(
                                      padding: EdgeInsets.only(bottom: 15.0,right: 25,left: 25),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          height: 60,
                                          width: MediaQuery.of(context).size.width-130,
                                          child:
                                          TextField(
                                            controller: searchBoxController2,
                                            onChanged: (value) {
                                              if(searchBoxController2.text.isEmpty){
                                                stateNotifier.value='nothing';
                                              }
                                              else{
                                                stateNotifier.value=searchBoxController2.text;
                                              }
                                            },
                                            style: const TextStyle(fontFamily: 'Vazir',color: Colors.black),
                                            textDirection: TextDirection.rtl,
                                            decoration:  InputDecoration(
                                              enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.grey,width: 1),borderRadius: BorderRadius.circular(8)),
                                              hintText: 'اینجا بنویسید',
                                              hintStyle: const TextStyle(fontSize: 16),
                                              suffixIcon: const Icon(Icons.search),
                                              focusedBorder: const OutlineInputBorder(borderSide: BorderSide(width:1,color: Colors.teal)),
                                              border: const UnderlineInputBorder(borderSide: BorderSide.none),
                                            ),)),
                                    ],
                                  ),
                                      Center(
                                      child: SizedBox(
                                          height: 240,
                                          width: MediaQuery.of(context).size.width-130,
                                          child:ValueListenableBuilder<String>(
                                            valueListenable: stateNotifier,
                                            builder: (context, value, child) {
                                              if(searchBoxController2.text.isNotEmpty){
                                                if(checkedList.length==31){
                                                  filteredCities=[];
                                                }
                                                else{
                                                  filteredCities=[];
                                                }
                                                cities.forEach((key, value) {
                                                  if(key.contains(searchBoxController2.text)){
                                                    filteredCities.add(key);
                                                  }
                                                });
                                              }
                                              else{
                                                if(checkedList.length==31){
                                                  filteredCities=[];
                                                  filteredCities.addAll(cities.keys);
                                                  //print('object1');
                                                }
                                                else{
                                                  filteredCities=[];
                                                  filteredCities.addAll(cities.keys);}

                                              }
                                              return StatefulBuilder(builder: (BuildContext context, StateSetter setState){
                                                return filteredCities.isNotEmpty?
                                                 ListView.builder(itemCount: filteredCities.length>1?filteredCities.length:1, itemBuilder: (context, index) {
                                                return Column(
                                                  children: [
                                                     Padding(
                                                      padding: const EdgeInsets.only(top: 8.0),
                                                      child: SizedBox(
                                                        height: 60,
                                                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Expanded(child: Padding(
                                                              padding: const EdgeInsets.only(right: 8.0),
                                                              child:
                                                              InkWell(
                                                                onTap: () {
                                                                  locationController.text=filteredCities[index].toString();
                                                                  print(locationController.text.toString());
                                                                  filteredCities=[];
                                                                  filteredCities.addAll(cities.keys);
                                                                  Navigator.of(context).pop();
                                                                },
                                                                child: Row(
                                                                  children: [
                                                                  SizedBox(width:20,child: Text(filteredCities[index].substring(0,1),style:const TextStyle(fontSize: 16, fontFamily: 'Vazir',color: Colors.lightBlue))),
                                                                  Expanded(
                                                                    child: Center(
                                                                      child: Text(filteredCities[index],style:const TextStyle(fontSize: 16, fontFamily: 'Vazir')),
                                                                    ),
                                                                  ),
                                                                    const SizedBox(width: 20,child: Icon(Icons.location_city_rounded,color: Colors.green,),)
                                                                ],),
                                                              )
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(height: 1,
                                                      width: MediaQuery
                                                          .of(context)
                                                          .size
                                                          .width - 140,
                                                      decoration: BoxDecoration(border: Border(bottom: BorderSide(
                                                        color: Colors.grey.withOpacity(0.4), width: 1,))),)
                                                  ],
                                                );
                                              }):
                                                const Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Center(child: Text('موردی یافت نشد',style:TextStyle(fontSize: 16, fontFamily: 'Vazir',color: Colors.red))),
                                                    Icon(Icons.error,color: Colors.redAccent,),
                                                  ],
                                                );});


                                            },
                                          )
                                      )
                                  ),
                                  /*Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(width: 10,),
                                        TextButton(onPressed: (){Navigator.of(context).pop();},style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size(80, 30)),backgroundColor:MaterialStateProperty.all(Colors.green),padding: MaterialStateProperty.all(const EdgeInsets.all(15))), child: const Text('تایید',style: TextStyle(color: Colors.white,fontFamily: 'Shabnam'),)),
                                        const SizedBox(width: 5,),
                                        TextButton(onPressed: (){Navigator.of(context).pop();},style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red),padding: MaterialStateProperty.all(const EdgeInsets.all(15))), child: const Text('انصراف',style: TextStyle(color: Colors.white,fontFamily: 'Shabnam'),)),
                                        const SizedBox(width: 5,),
                                      ],
                                    ),
                                  ),*/
                                ],
                              ),

                            ),
                          )));
                    },
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: (){


                    showDialog(context: context, builder: (context) =>  AlertDialog(
                        actions: [
                          TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),onPressed: (){Navigator.of(context).pop();}, child: const Text('انصراف',style: TextStyle(fontFamily: 'Vazir',fontSize: 15,color: Colors.white),)),
                          TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),onPressed: (){
                           cache.write('name', nameController.text);
                           image==null?cache.write('profile_image','$baseUrl/uploads/adminorUser.jpeg' ):cache.write('profile_image', '$baseUrl/uploads/${image!.name}',);
                           cache.write('email', emailController.text);
                           updateUserInfo(nameController.text, emailController.text,locationController.text,image==null?null:image);

                           if(checkedList.contains(locationController.text)==false){
                             checkedList.add(locationController.text);
                             cities.update(locationController.text, (value) => true);
                           }
                           if(checkedList.length>2){
                             users=[];
                             for(var i in userResponse){
                               for(int j=0;j<checkedList.length;j++){
                                 if(checkedList[j]==i['city']){
                                   var userItem=UserStructure(int.parse(i['id']), i['phone'], i['adminPhone'],i['name'], i['price'], i['type'], i['image'], i['city'], i['dealType'], i['payment_Method'], i['startTime'], i['endTime'], i['special_Conditions'], i['history'], i['email_1'], i['email_2'],i['status'],int.parse(i['score']));
                                   users.add(userItem);
                                 }
                               }}
                             setState(() {

                             });
                           }

                           submitHistory(cache.read('telephone'), 'profile',users[0]);
                           cache.write('city', locationController.text);
                           //checkedList
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
