import 'package:adminor/AdeversitingPages/AdvertisingDetailPage.dart';
import 'package:adminor/AdeversitingPages/AdvertisingPage.dart';
import 'package:adminor/structure.dart';
import 'package:flutter/material.dart';

import 'AdeversitingPages/NewAdversitingPage.dart';
import 'Settings/settingsPage.dart';
import 'api/Functions.dart';
import 'chat/displayChatPage.dart';
class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
/*    var h=MediaQuery.of(context).size.height;*/
    return Scaffold(
      floatingActionButton: bottomMenu(context),
      appBar: AppBar(title: const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text('نشان شده ها ',style: TextStyle(fontFamily: 'vazir'),),
      Icon(Icons.star,color: Colors.yellow,)
      ],
    ),backgroundColor: Colors.green,),
    body: Center(child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(itemCount: users.length,itemBuilder: (context, index) {
        return InkWell(
          onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  AdvertisingDetail(index: index),));},
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),width: w,height: 100,
                child:Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: ClipRRect(borderRadius:BorderRadius.circular(50) ,
                      child: Image.asset(url[index],width: 70,height: 70,),),
                  ),const SizedBox(width:15),
                    Expanded(
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,children: [
                      Text(users[index].name,style: const TextStyle(fontFamily: 'Shabnam'),),
                      const SizedBox(height: 5,),
                      Text('قیمت ${users[index].price} تومان',style: const TextStyle(fontFamily: 'Shabnam'),),
                  ],),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                        onPressed: () {
                          showDialog(context: context, builder: (context) =>  AlertDialog(
                            actions: [
                              TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),onPressed: (){Navigator.of(context).pop();}, child: const Text('انصراف',style: TextStyle(fontFamily: 'Vazir',fontSize: 15,color: Colors.white),)),
                              TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),onPressed: (){Navigator.of(context).pop();ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  shape: const StadiumBorder(),
                                  elevation: 0,
                                  backgroundColor: Colors.red.withOpacity(0.7),
                                  width: 300,
                                  content: const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('مورد با موفقیت حذف شد',style: TextStyle(color: Colors.white),),Icon(Icons.delete_outline_rounded,color: Colors.white,)])));},
                                  child: const Text('تایید',style: TextStyle(fontFamily: 'Vazir',fontSize: 15,color: Colors.white),))
                            ],
                              title:const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                Text('آیا مطمعن هستید؟',style: TextStyle(fontFamily: 'Vazir',fontSize: 15),),
                                Icon(Icons.error,color: Colors.blue,)],)
                          ),);
                        }, child: const Row(
                      children: [
                        Text('حذف نشان',style: TextStyle(color: Colors.black),),
                        Icon(Icons.star_border_purple500_outlined,color: Colors.yellow ,),
                      ],
                    )),
                  ),
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

