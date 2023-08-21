
import 'package:adminor/AdeversitingPage.dart';
import 'package:flutter/material.dart';
import 'AdeversitingPages/NewAdeversitingPage.dart';
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
      appBar: AppBar(backgroundColor:Colors.white,elevation:0,actions:[IconButton(onPressed: (){
        setState(() {
        changeState=!changeState;
        });
        }, icon: const Icon(Icons.settings,color:Colors.grey,size: 30,))],automaticallyImplyLeading: false,title: const Text('گفتگو ها',style: TextStyle(fontSize: 20,fontFamily: 'Vazir',color: Colors.black),)),
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
                IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const AdvertisingPage(),));},
                    icon: const Icon(Icons.home, color: Colors.white,)),
                IconButton(onPressed: () {},
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
      child: ListView.builder(itemCount: 10,itemBuilder: (context, index) {
      return InkWell(
        onTap: () {},
        child: Container(padding:const EdgeInsets.only(bottom: 0,top: 10),decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black,width: 1))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Row(children: [Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(borderRadius: BorderRadius.circular(50),child: Image.asset('assets/images/UserRandom.png',width: 60,height: 60,)),
            ),
            const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('اصغر عباسی',style: TextStyle(fontFamily: 'Vazir',fontSize: 22),),
            Text('میخواهم یک سایت را به شما بسپارم',style: TextStyle(fontFamily: 'Vazir',fontSize: 14),),
            ],
            ),],),
               Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Row(textDirection: TextDirection.rtl,mainAxisAlignment: MainAxisAlignment.spaceAround,children: [const Icon(Icons.done_all,color: Colors.green,),const SizedBox(width: 5,), Padding(
                       padding: EdgeInsets.only(left: index%2==0?3:3),
                       child: const Text('پنجشنبه'),
                     )],),
                     index%2==0?ElevatedButton(onPressed: (){},style: ButtonStyle(elevation:MaterialStateProperty.all(1),backgroundColor: MaterialStateProperty.all(Colors.white),minimumSize: MaterialStateProperty.all(const Size(15,35))), child: const Icon(Icons.arrow_forward_rounded,color: Colors.black,),)
                         :const SizedBox(height: 50,width: 50,)
                  ],),
              ),
            ],
          ),
        ),
      );
    },),);
  }
}

