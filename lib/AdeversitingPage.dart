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
                Container(width:300,height:50,
                    decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width-200,
                            child:
                        TextField(
                          onChanged: (value) => searchBoxController.text = value,
                          style: const TextStyle(fontFamily: 'Vazir',color: Colors.black),
                          textDirection: TextDirection.rtl,
                          decoration: const InputDecoration(
                            hintText: 'جستجو...',
                              border: UnderlineInputBorder(borderSide: BorderSide.none),
                              prefixIcon : Icon(Icons.search),prefixIconColor: Colors.grey),)),
                               InkWell(
                                onTap: (){
                                },
                                child:Row(
                                  textDirection: TextDirection.ltr,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon( Icons.location_on,color: Colors.grey[350],),
                                     Text('تهران',style: TextStyle(fontFamily: 'Vazir',fontSize: 14,color: Colors.grey[600]),)],),
                              )

                      ],
                    ))
              ],)
          ],
        ),
      ),
          floatingActionButton:
          bottomMenu(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    body: GestureDetector(onTap: (){
      FocusScope.of(context).requestFocus(FocusNode());
    }),
    );
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
                  IconButton(onPressed: () {},
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
}
