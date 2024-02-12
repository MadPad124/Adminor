
import 'package:adminor/AdeversitingPages/AdeversitingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //debugShowCheckedModeBanner: false,
        body: Container(color: Colors.white,
          child:Column(children: [
             SizedBox(
               height: 50,
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                textDirection:TextDirection.ltr,
                children: [
                  IconButton(onPressed: (){Navigator.pop(context);},icon: const Icon(Icons.arrow_forward_rounded)),
                  const Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Text('تنظیمات',style: TextStyle(decoration: TextDecoration.none,color: Colors.black,fontSize: 17,fontFamily: 'Vazir'),),
                  ),
                ],),
             ),
            Container(decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),width: MediaQuery.of(context).size.width,height: 1,),
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
                  Text('اصغر عباسی',style: TextStyle(decoration: TextDecoration.none,color: Colors.black,fontSize: 20,fontFamily: 'Vazir')),
                  Text('تهران',style: TextStyle(decoration: TextDecoration.none,color: Colors.grey,fontSize: 16,fontFamily: 'Vazir'))],)
            ],)
          ]),),
      ),
    );
  }
}
