
import 'package:adminor/AdeversitingPages/AdvertisingPage.dart';
import 'package:adminor/chat/ChatPage.dart';
import 'package:adminor/structure.dart';
import 'package:flutter/material.dart';
import '../AdeversitingPages/NewAdversitingPage.dart';
import '../Settings/settingsPage.dart';
class DisplayChat extends StatefulWidget {
  const DisplayChat({Key? key}) : super(key: key);

  @override
  State<DisplayChat> createState() => _DisplayChatState();
}

class _DisplayChatState extends State<DisplayChat> {
  bool changeState=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:Colors.white,elevation:0,actions:[
        IconButton(onPressed: (){
        setState(() {
        changeState=!changeState;
        });
        }, icon: const Icon(Icons.settings,color:Colors.grey,size: 30,))],
          automaticallyImplyLeading: false,
          title: const Text('گفتگو ها',style: TextStyle(fontSize: 20,fontFamily: 'Vazir',color: Colors.black),)),
      floatingActionButton: bottomMenu(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: changeState==false?const EmptyState():const HaveState()

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
class EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

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
  const HaveState({Key? key}) : super(key: key);

  @override
  State<HaveState> createState() => _HaveStateState();
}
class _HaveStateState extends State<HaveState> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(itemCount: name.length,itemBuilder: (context, index) {
      return InkWell(
        onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Chat(index: index,),));},
        child: Container(padding:const EdgeInsets.only(bottom: 0,top: 10),decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black,width: 0.1))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Row(children: [Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(borderRadius: BorderRadius.circular(50),child: Image.asset(url[index],width: 60,height: 60,)),
            ),
             Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(name[index],style: const TextStyle(fontFamily: 'Shabnam',fontSize: 14),),
            Text('به یک ${job[index]} نیازمند هستم',style: const TextStyle(fontFamily: 'shabnam',fontSize: 14),),
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
                    Padding(
                      padding: EdgeInsets.only(left: 0,bottom:5),
                      child: Text('پنجشنبه'),
                    ),

                  ],),
              ),
            ],
          ),
        ),
      );
    },),);
  }
}

