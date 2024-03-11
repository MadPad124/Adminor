
import 'package:adminor/loginPages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../AdeversitingPages/AdeversitingPage.dart';
import '../AdeversitingPages/NewAdeversitingPage.dart';
import '../chat/displayChatPage.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: bottomMenu(context),
        body: Container(color: Colors.white,
          child:Column(children: [
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
              option(context, 'پروفایل من',Icons.account_circle_outlined,Colors.green, const AdvertisingPage()),
              Container(width: MediaQuery.of(context).size.width,decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3)))),),
              option(context, 'نشان شده ها',Icons.star_rounded,Colors.yellow ,const AdvertisingPage()),
              Container(width: MediaQuery.of(context).size.width,decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3)))),),
              option(context, 'تماس با پشتیبانی',CupertinoIcons.checkmark_shield_fill,Colors.blue,const AdvertisingPage()),
              Container(width: MediaQuery.of(context).size.width,decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3)))),),
              option(context, 'آگهی های من',Icons.sticky_note_2_outlined,Colors.orangeAccent, const AdvertisingPage()),
              Container(width: MediaQuery.of(context).size.width,decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3)))),),
              InkWell(
                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));},
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
               )
            ],)
          ]
          ),),
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
                IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const AdvertisingPage(),));},
                    icon: const Icon(Icons.home, color: Colors.white,)),
                IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const DisplayChat(),));},
                    icon: const Icon(Icons.chat, color: Colors.white)),
                IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));},
                    icon: const Icon(Icons.add_circle, color: Colors.white)),
              ],),
            IconButton(onPressed: () {},
                icon: const Icon(
                  Icons.manage_accounts_sharp, color: Colors.white,))
          ]),
    ),

  );

}
