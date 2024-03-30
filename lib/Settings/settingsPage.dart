
import 'package:adminor/AdeversitingPages/MyAdvertisingPage.dart';
import 'package:adminor/LoginPages/LoginPage.dart';
import 'package:adminor/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../AdeversitingPages/AdvertisingPage.dart';
import '../AdeversitingPages/NewAdversitingPage.dart';
import '../FavoritePage.dart';
import '../chat/displayChatPage.dart';
class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier activated=ValueNotifier(false);
    var w=MediaQuery.of(context).size.width;
    var h=MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: bottomMenu(context),
        body: SingleChildScrollView(
          child: Stack(children: [
            Image.asset(width: w,height: h+50,'assets/images/setting.jpg',fit: BoxFit.cover,),
            Column(children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textDirection:TextDirection.rtl,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.settings,color: Colors.black54,),
                    ),
                    const Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Text('تنظیمات',style: TextStyle(decoration: TextDecoration.none,color: Colors.black,fontSize: 17,fontFamily: 'Shabnam'),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(onPressed: (){Navigator.pop(context);},icon: const Icon(Icons.arrow_forward_rounded)),
                    ),
                  ],),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                textDirection: TextDirection.rtl,children: [
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: ClipRRect(borderRadius: BorderRadius.circular(50),child: Image.asset('assets/images/UserRandom.png',width: 70,height: 70,)),
                ),
                const Column(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('اصغر عباسی',style: TextStyle(decoration: TextDecoration.none,color: Colors.black,fontSize: 20,fontFamily: 'Shabnam')),
                    Text('تهران',style: TextStyle(decoration: TextDecoration.none,color: Colors.grey,fontSize: 16,fontFamily: 'Shabnam'))],)
              ],),
              Column(children: [
                Container(width: MediaQuery.of(context).size.width,decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3)))),),
                option(context, 'پروفایل من',Icons.account_circle_outlined,Colors.green, const Profile()),
                Container(width: MediaQuery.of(context).size.width,decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3)))),),
                option(context, 'نشان شده ها',Icons.star_rounded,Colors.yellow ,const Favorite()),
                Container(width: MediaQuery.of(context).size.width,decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3)))),),
                InkWell(
                  onTap: (){
                    showDialog(context: context, builder: (context) =>  AlertDialog(
                      title: const Text('تماس با ما',style: TextStyle(fontFamily: 'Shabnam',fontWeight: FontWeight.w200),),
                      content: SingleChildScrollView(
                        child: SizedBox(height:305,width:300,child: Column(children: [
                          const Text('پاسخگوی شما هستیم در 24 ساعت روز',style: TextStyle(fontFamily: 'Vazir'),),
                          const Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text('09217123169',style: TextStyle(fontFamily: 'Vazir'),),Icon(Icons.call,color: Colors.blue,)],),
                          const SizedBox(height: 15,),
                          StatefulBuilder(builder: (BuildContext context, StateSetter setState)=>
                              TextField(
                                onChanged: (value) {
                                  if(value.isNotEmpty){
                                    activated.value=true;
                                  }
                                  else{
                                    activated.value=false;
                                  }
                                },
                                keyboardType: TextInputType.multiline,
                                maxLength: 256,
                                maxLines: 3,
                                style:const TextStyle(fontFamily: 'Vazir',color: Colors.black,fontWeight: FontWeight.w100),
                                decoration: const InputDecoration(prefixIcon:Icon(Icons.message_outlined),prefixIconColor: Colors.green,
                                    label:Text('ارسال پیام',style: TextStyle(fontFamily: 'Shabnam'),),
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1)),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2))),),
                          ),
                          StatefulBuilder(builder: (BuildContext context, StateSetter setState)=>
                              ValueListenableBuilder(valueListenable: activated,
                                builder: (context, value, child) => TextButton(onPressed: () {
                                  if(activated.value==true){
                                    Navigator.pop(context);activated.value=false;
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        shape: const StadiumBorder(),
                                        elevation: 0,
                                        backgroundColor: Colors.blue.withOpacity(0.7),
                                        width: 300,
                                        content: const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('پیام شما با موفقیت ارسال شد',style: TextStyle(color: Colors.white),),Icon(Icons.info,color: Colors.white,)],)));
                                  }},style: ButtonStyle(backgroundColor: activated.value==true?MaterialStateProperty.all(CupertinoColors.activeGreen):MaterialStateProperty.all(Colors.grey.withOpacity(0.3))),
                                  child: const Text('ارسال',style: TextStyle(color: Colors.white),),),
                              ),
                          )
                        ])),
                      ),
                    ));
                    },
                  child: SizedBox(width:MediaQuery.of(context).size.width,height: 80,child:Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children:[
                    const Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Icon(CupertinoIcons.checkmark_shield_fill,size: 40,color: Colors.blue,),
                    ),  const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top:0.0,right: 5),
                        child: Text('تماس با پشتیبانی',style: TextStyle(fontFamily: 'Shabnam'),),
                      ),),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.forward) ),
                    )
                  ],)),
                ),
                Container(width: MediaQuery.of(context).size.width,decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3)))),),
                option(context, 'آگهی های من',Icons.sticky_note_2_outlined,Colors.orangeAccent, const MyAdvertisingPage()),
                Container(width: MediaQuery.of(context).size.width,decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3)))),),
                InkWell(
                  onTap: (){
                    showDialog(context: context, builder: (context) =>  AlertDialog(
                        actions: [
                          TextButton(style:ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.red.withOpacity(0.1))) ,onPressed: (){Navigator.of(context).pop();}, child: const Text('انصراف',style: TextStyle(fontFamily: 'Vazir',fontSize: 15,color: Colors.red),)),
                          TextButton(style:ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.green.withOpacity(0.1))),onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login()));},
                              child: const Text('تایید',style: TextStyle(fontFamily: 'Vazir',fontSize: 15,color: Colors.green),))
                        ],
                        title:const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          Text('آیا از خروج مطمعن هستید؟',style: TextStyle(fontFamily: 'Vazir',fontSize: 15),),
                          Icon(Icons.warning,color: Colors.red,)],)
                    ),);
                    },
                  child: SizedBox(width:MediaQuery.of(context).size.width,height: 80,child:Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children:[
                    const Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Icon(Icons.warning_amber_outlined,size: 40,color: Colors.red,),
                    ),  const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top:0.0,right: 5),
                        child: Text('خروج از حساب کاربری',style: TextStyle(fontFamily: 'Shabnam',color: Colors.red),),
                      ),),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.forward) ),
                    )
                  ],)),
                ),

             
              ],)
            ]
            ),

          ],),
        )
      ),
    );
  }
}
Widget option(context,String text,IconData icon,Color color,Widget page,){
  return InkWell(
                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));},
                 child: SizedBox(width:MediaQuery.of(context).size.width,height: 80,child:Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children:[
                   Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Icon(icon,size: 40,color: color,),
                  ),  Expanded(
                   child: Padding(
                     padding: const EdgeInsets.only(top:0.0,right: 5),
                     child: Text(text,style: const TextStyle(fontFamily: 'Shabnam'),),
                   ),),
                   Padding(
                     padding: const EdgeInsets.only(top: 10.0),
                     child: IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));}, icon: const Icon(CupertinoIcons.forward) ),
                   )
                 ],)),
               );
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
            IconButton(onPressed: () {},
                icon: const Icon(
                  Icons.manage_accounts_sharp, color: Colors.white,))
          ]),
    ),

  );

}
