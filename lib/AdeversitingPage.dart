import 'package:flutter/material.dart';
class AdvertisingPage extends StatefulWidget {
  const AdvertisingPage({Key? key}) : super(key: key);

  @override
  State<AdvertisingPage> createState() => _AdvertisingPageState();
}

class _AdvertisingPageState extends State<AdvertisingPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchBoxController=TextEditingController();
    return Scaffold(
      appBar:
      AppBar(
        backgroundColor: Colors.green,
        toolbarHeight: 130,
        flexibleSpace:Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30,),
                const Text('Adminor',style: TextStyle(fontFamily: 'Vazir',fontWeight: FontWeight.w300,fontSize: 24,color: Colors.white),),
                const SizedBox(height: 10,),
                Container(width:300,height:50,decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(25)),child: TextField(textDirection: TextDirection.rtl,controller: searchBoxController,decoration: const InputDecoration(border: UnderlineInputBorder(borderSide: BorderSide.none),prefixIcon: Icon(Icons.search),prefixIconColor: Colors.grey),))
              ],)
          ],
        ),
      ),
          floatingActionButton:Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.green,),
            width: MediaQuery.of(context).size.width-60,
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){}, icon: const Icon(Icons.home,color: Colors.white,)),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.chat,color: Colors.white)),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.add_circle,color: Colors.white)),
                      ],),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.manage_accounts_sharp,color: Colors.white,))
                  ]),
            ),
          ) ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
