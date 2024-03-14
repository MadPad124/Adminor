import 'package:adminor/AdeversitingPages/AdvertisingPage.dart';
import 'package:adminor/people.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../chat/displayChatPage.dart';
import 'package:adminor/Settings/settingsPage.dart';
import 'NewAdversitingPage.dart';
class MyAdvertisingPage extends StatelessWidget {
  const MyAdvertisingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
/*    var h=MediaQuery.of(context).size.height;*/
    return Scaffold(
      floatingActionButton: bottomMenu(context),
      appBar: AppBar(title:const Row(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('آگهی های من ',style: TextStyle(fontFamily: 'Vazir'),),
          Icon(Icons.notes,color: Colors.orange,),
          Expanded(child: SizedBox()),

        ],
      ),backgroundColor: Colors.green,),
      body: Center(child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(itemCount: name.length,itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),width: w,height: 100,
                  child:Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: ClipRRect(borderRadius:BorderRadius.circular(50) ,
                        child: Image.asset(url[index],width: 70,height: 140,),),
                    ),const SizedBox(width:15),
                      Expanded(
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,children: [
                          Text(job[index],style: const TextStyle(fontFamily: 'Shabnam'),),
                          const SizedBox(height: 5,),
                          Text('قیمت ${price[index]} تومان',style: const TextStyle(fontFamily: 'Shabnam'),),
                        ],),
                      ),
                     Column(crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text('وضعیت :',style: TextStyle(fontSize: 13),),
                         // Text('حذف شده',style: TextStyle(fontSize: 13,color: Colors.red)),
                          Text('در حال نمایش',style: TextStyle(fontSize: 13,color: Colors.green)),

                        ],),
                         Padding(
                           padding: const EdgeInsets.only(left: 15.0),
                           child: ElevatedButton(
                               style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                               onPressed: () {} , child: const Row(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Icon(Icons.timelapse,color: Colors.white ,size: 15,),
                               Text('مدیریت آگهی',style: TextStyle(color: Colors.white,fontSize: 12),),
                             ],
                           )),
                         ),
                       ],
                     )
                    ],)
              ),
            ),
          );
        },),
      )),
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

