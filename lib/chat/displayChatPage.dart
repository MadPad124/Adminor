
import 'package:adminor/AdeversitingPages/AdvertisingPage.dart';
import 'package:adminor/api/Functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../AdeversitingPages/NewAdversitingPage.dart';
import '../Settings/settingsPage.dart';
class DisplayChat extends StatefulWidget {
  const DisplayChat({super.key});

  @override
  State<DisplayChat> createState() => _DisplayChatState();
}

class _DisplayChatState extends State<DisplayChat> {
  bool state=history.isEmpty?false:true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(CupertinoIcons.mail),
          backgroundColor:Colors.white,elevation:0,
          title: const Text('پیام ها',style: TextStyle(fontSize: 18,fontFamily: 'Shabnam',color: Colors.black),)),
      floatingActionButton: bottomMenu(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: state==false?const EmptyState():const HaveState()

    );
  }
}
class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/message icon.png',width: MediaQuery.of(context).size.width, height: 100,),
          const Text('هنوز هیچ پیامی ندارید',style: TextStyle(fontFamily: 'Vazir',fontSize: 20),)
        ],
      ),
    );
  }
}
class HaveState extends StatefulWidget {
  const HaveState({super.key});

  @override
  State<HaveState> createState() => _HaveStateState();
}
class _HaveStateState extends State<HaveState> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(shrinkWrap: true,reverse:true,itemCount:history.length,itemBuilder: (context, index) {
      return Container(padding:const EdgeInsets.only(bottom: 0,top: 10),decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black,width: 0.1))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Row(children: [Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(borderRadius: BorderRadius.circular(50),child: Image.asset('assets/images/adminorChat.jpeg',width: 60,height: 60,)),
          ),
          Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(history[index].messageTitle,style: const TextStyle(fontFamily: 'Shabnam',fontSize: 14),),
          Text(history[index].messageText,maxLines: 3,style: const TextStyle(fontFamily: 'shabnam',fontSize: 12),),
          ],
          ),],),
             const Padding(
              padding: EdgeInsets.only(left:8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                    Row(textDirection: TextDirection.rtl,mainAxisAlignment: MainAxisAlignment.spaceAround,crossAxisAlignment: CrossAxisAlignment.center,children: [
      
                      SizedBox(width: 5,),Icon(Icons.done_all,color: Colors.green,),
                      SizedBox(width: 8,)
                     ],),
      
                ],),
            ),
          ],
        ),
      );
    },),);
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Advertising(),));},
                    icon: const Icon(Icons.home, color: Colors.white,)),
                IconButton(onPressed: () {},
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