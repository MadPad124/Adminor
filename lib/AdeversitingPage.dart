
import 'package:flutter/material.dart';
//import 'package:flutter/scheduler.dart';
class AdvertisingPage extends StatefulWidget {
  const AdvertisingPage({Key? key}) : super(key: key);

  @override
  State<AdvertisingPage> createState() => _AdvertisingPageState();
}

class _AdvertisingPageState extends State<AdvertisingPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchBoxController=TextEditingController();
    GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldState,
      drawer: Drawer(
        child:
        ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
             DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const Icon(Icons.account_circle_rounded,size: 80,color: Colors.white,),
                    SizedBox(width: 150,child:
                    ListTile(
                      title: const Text('حسین کریمیان',style: TextStyle(fontFamily: 'vazir',fontSize: 16,color: Colors.white),),
                      subtitle: const Text('تهران',style: TextStyle(fontFamily: 'vazir',color: Colors.white),),
                      onTap: (){},
                    )
                    ),
                  ],
                  ),
                  const SizedBox(height: 7,),
                  Container(width:300,decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white,width: 2))),),
                  TextButton(onPressed: (){}, child:const Text('خروج',style: TextStyle(fontFamily: 'vazir',color: Colors.red,fontSize: 15) ), )
                ],
              ),

            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        toolbarHeight: 120,
        flexibleSpace:Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 30,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Adminor',style: TextStyle(fontFamily: 'Vazir',fontWeight: FontWeight.w300,fontSize: 24,color: Colors.white),),
                ),
                Container(width:MediaQuery.of(context).size.width-50,height:50,
                    decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){_scaffoldState.currentState!.openDrawer();}, icon:const Icon(Icons.menu)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width-200,
                            child:
                        TextField(
                          onTap: (){},

                          onChanged: (value) => searchBoxController.text = value,
                          style: const TextStyle(fontFamily: 'Vazir',color: Colors.black),
                          textDirection: TextDirection.rtl,
                          decoration: const InputDecoration(
                            hintText: 'جستجو...',
                              border: UnderlineInputBorder(borderSide: BorderSide.none),
                              /*prefixIcon : Icon(Icons.search),prefixIconColor: Colors.grey*/),)),
                               InkWell(
                                onTap: (){
                                  showDialog(context: context, builder: (context) => AlertDialog(contentPadding: const EdgeInsets.only(top:10),title:const Text('انتخاب استان',style: TextStyle(fontFamily: 'Vazir',color: Colors.black,fontSize: 20),),
                                  content: SingleChildScrollView(
                                    child: Center(
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width,
                                              child: const Padding(
                                                padding: EdgeInsets.only(bottom: 15.0,right: 25),
                                                child: Text('حداقل یک شهر را انتخاب کنید',style: TextStyle(fontFamily: 'vazir',fontSize: 16),),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 60,
                                                    //decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.grey,width: 1)),
                                                    width: MediaQuery.of(context).size.width-130,
                                                    child:
                                                    TextField(
                                                      onChanged: (value) => searchBoxController.text = value,
                                                      style: const TextStyle(fontFamily: 'Vazir',color: Colors.black),
                                                      textDirection: TextDirection.rtl,
                                                      decoration:  InputDecoration(
                                                        enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.grey,width: 1),borderRadius: BorderRadius.circular(8)),
                                                        hintText: 'استان را وارد کنید',
                                                        hintStyle: const TextStyle(fontSize: 16),
                                                        suffixIcon: const Icon(Icons.search),
                                                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(width:1,color: Colors.teal)),
                                                        border: const UnderlineInputBorder(borderSide: BorderSide.none),
                                                      ),)),


                                              ],
                                            ),
                                            Center(
                                              child: SizedBox(
                                                height: 240,
                                                width: MediaQuery.of(context).size.width-130,
                                                child: ListView.builder(itemCount: 12,itemBuilder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 8.0),
                                                        child: SizedBox(
                                                          height:60,
                                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              const Expanded(child: Padding(
                                                              padding: EdgeInsets.only(right: 8.0),
                                                              child: Text('تهران',style: TextStyle(fontSize: 16,fontFamily: 'Vazir'),),
                                                            )),IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_new,size: 18,)),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Container(height: 1,width: MediaQuery.of(context).size.width-140,decoration:  BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.4),width: 1,))),)
                                                    ],
                                                  );
                                                },),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),);
                                },
                                child:Row(
                                  textDirection: TextDirection.ltr,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Icon(Icons.location_on,color: Colors.grey[350],),
                                    ),
                                     Container(padding: const EdgeInsets.only(right: 8),decoration:const BoxDecoration(border: Border(right: BorderSide(color: Colors.grey,width: 2))),child: Text('تهران',style: TextStyle(fontFamily: 'Vazir',fontSize: 14,color: Colors.grey[600]),))],),
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
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: GridView.count(
          physics: const BouncingScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio:(3/4),
          padding: const EdgeInsets.all(10),
          children:List.generate(6, (index) => cart(context))

        ),
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
        decoration: BoxDecoration(color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3),blurRadius: 10,spreadRadius: 0)],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1,)),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){}, icon:  Icon(Icons.favorite_border,color: Colors.black.withOpacity(0.5),size: 25,)),
          )],),
          Image.asset('assets/images/splash-bottom-page-image.png',),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
              padding: EdgeInsets.only(right: 20.0,top: 10,bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('محسن لرستانی',style: TextStyle(fontFamily: 'Vazir',fontSize: 16,),),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Icon(Icons.message_rounded,color: Colors.blue,),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.0,left: 7,right: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('گلستان'),Text('دقایقی پیش'),],),
            )
          ],),

        ],),
      ),
    ),
  );
}
