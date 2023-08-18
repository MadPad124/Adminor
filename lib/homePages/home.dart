import 'package:adminor/AdeversitingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: bottomMenu(context),
      body:SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 10.0,top: 10),
              child: Icon(CupertinoIcons.add_circled_solid,color: Colors.cyan,),
            ),
           Directionality(textDirection: TextDirection.rtl,child: Padding(
             padding: EdgeInsets.only(top: 15.0,bottom: 5,right: 5),
             child: Text("افزودن تصویر",style: TextStyle(fontFamily: 'Vazir',fontSize: 18),),
           )),
          ],),
          const Directionality(textDirection: TextDirection.rtl,child: Padding(
            padding: EdgeInsets.only(top: 15.0,bottom: 15,right: 5),
            child: Text("چند تصویر مرتبط با آگهی درج کنید",style: TextStyle(fontFamily: 'Vazir',fontSize: 14,color: Colors.grey),),
          )),
            SizedBox(
              height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(width:100,height:100,decoration:  BoxDecoration(
                        border: const DashedBorder.fromBorderSide(side: BorderSide(color: Colors.green), dashLength: 10),
                        borderRadius: BorderRadius.circular(5),),
                      child:const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Icon(CupertinoIcons.camera),
                        Text('افزودن تصویر')

                      ],)
                      /*ListTile(title: Text('افزودن تصویر'),leading: Icon(CupertinoIcons.add)),*/
                    ),
                  ),))
        ],),
      )
    );
  }
}
Widget bottomMenu(context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25), color: Colors.green,),
    width: MediaQuery.of(context).size.width - 20,
    child: Padding(
      padding: const EdgeInsets.all(7.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const AdvertisingPage(),));},
                    icon: const Icon(Icons.home, color: Colors.white,)),
                IconButton(onPressed: () {},
                    icon: const Icon(Icons.chat, color: Colors.white)),
                IconButton(onPressed: () {},
                    icon: const Icon(Icons.add_circle, color: Colors.white)),
              ],),
            IconButton(onPressed: () {},
                icon: const Icon(
                  Icons.manage_accounts_sharp, color: Colors.white,))
          ]),
    ),

  );
}