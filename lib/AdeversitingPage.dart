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
                                    Icon(Icons.location_on,color: Colors.grey[350],),
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
    body: GestureDetector(
        onTap: (){
      FocusScope.of(context).requestFocus(FocusNode());
    },
    child: Stack(children: [
      Align(alignment: Alignment.bottomCenter,child: Image.asset('assets/images/splash-bottom-page-image.png')),
      Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          'assets/images/splash-bottom-page-image-sun.png',
          opacity: const AlwaysStoppedAnimation(.3),
        ),
      ),
      GridView.builder(
        itemCount: 12,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder:(context, index) {
          return cart(context);
        },

      ),
      ]),),
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
Widget cart(context){
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 250,
        width: 200,
        decoration: BoxDecoration(color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3),blurRadius: 10,spreadRadius: 0)],
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1,)),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){}, icon:  Icon(Icons.favorite_border,color: Colors.black.withOpacity(0.5),size: 25,)),
          )],),
          Expanded(child: Image.asset('assets/images/splash-bottom-page-image.png',height: 150,width: 150,)),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
              padding: EdgeInsets.only(right: 20.0,top: 5,),
              child: Text('محسن لرستانی',style: TextStyle(fontFamily: 'Vazir',fontSize: 16,),),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text('گلستان'),Text('دقایقی پیش'),],)
          ],),
          const SizedBox(height: 20,),

        ],),
      ),
    ),
  );
}
