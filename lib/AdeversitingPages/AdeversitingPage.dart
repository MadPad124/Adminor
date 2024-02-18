import 'package:adminor/Settings/settingsPage.dart';
import 'package:adminor/chat/ChatPage.dart';
import 'package:adminor/chat/displayChatPage.dart';
import 'package:get_storage/get_storage.dart';

import 'NewAdeversitingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adminor/cities.dart';
//import 'package:flutter/scheduler.dart';
bool liked=false;
List<String> filteredCities=[];
List<bool> isChecked=[];
List checkedList=[];
ValueNotifier<String> valueNotifier=ValueNotifier('');
ValueNotifier<bool> valueNotifier2=ValueNotifier(false);
class AdvertisingPage extends StatefulWidget {
  const AdvertisingPage({Key? key}) : super(key: key);

  @override
  State<AdvertisingPage> createState() => _AdvertisingPageState();
}
class _AdvertisingPageState extends State<AdvertisingPage> {
  @override
  void initState() {
    isChecked = List<bool>.filled(cities.length, false);
    checkedList=[];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    TextEditingController searchBoxController=TextEditingController();
    return Scaffold(
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
                              prefixIcon : Icon(Icons.search),prefixIconColor: Colors.grey),)),
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
                                              child: Padding(
                                                padding: const EdgeInsets.only(bottom: 15.0,right: 25),
                                                child:  ValueListenableBuilder<bool>(valueListenable: valueNotifier2,builder: (context, value, child) => Text(checkedList.isEmpty?'حداقل یک شهر را انتخاب کنید':checkedList.toString(),style: const TextStyle(fontFamily: 'vazir',fontSize: 16) ,)),
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
                                                      controller: searchBoxController,
                                                      onChanged: (value) {
                                                        if(searchBoxController.text.isEmpty){
                                                          valueNotifier.value='nothing';
                                                        }
                                                        else{
                                                          valueNotifier.value=searchBoxController.text;
                                                        }
                                                        },
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
                                                child:


                                                ValueListenableBuilder<String>(
                                                  valueListenable: valueNotifier,
                                                  builder: (context, value, child) {
                                                    if(searchBoxController.text.isNotEmpty){
                                                      filteredCities=[];
                                                      cities.forEach((key, value) {

                                                        var keyword='$key';
                                                        if(keyword.contains(searchBoxController.text)){
                                                          filteredCities.add('$key');
                                                        }
                                                      });
                                                    }
                                                    else{
                                                      filteredCities=[];
                                                      filteredCities.addAll(cities.keys);
                                                    }
                                                   return ListView.builder(itemCount: filteredCities.length, itemBuilder: (context, index) {
                                                      return Column(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(top: 8.0),
                                                            child: SizedBox(
                                                              height: 60,
                                                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Expanded(child: Padding(
                                                                    padding: const EdgeInsets.only(right: 8.0),
                                                                    child: StatefulBuilder(builder: (BuildContext context, StateSetter setState){
                                                                        return CheckboxListTile(
                                                                          title: Text(filteredCities[index],style:const TextStyle(fontSize: 16, fontFamily: 'Vazir')),
                                                                          value:/*checkedList.isEmpty?checkedList[index]:*/isChecked[index ],
                                                                          onChanged: (value) {
                                                                      setState(
                                                                      () {

                                                    /*                  isChecked[index] = value!;
                                                                      if(value){
                                                                        setState((){
                                                                        checkedList.add(filteredCities[index]);
                                                                       print( filteredCities[index]);
                                                                        valueNotifier2.value=true;
                                                                        valueNotifier2.value=false;
                                                                        });
                                                                       // print(checkedList[index]);

                                                                      }
                                                                      else{
                                                                          if(checkedList.isEmpty){
                                                                            valueNotifier2.value=true ;
                                                                            valueNotifier2.value=false ;

                                                                          }
                                                                          else{
                                                                            checkedList.removeWhere((element) => element==filteredCities[index]);
                                                                            valueNotifier2.value=true;
                                                                            valueNotifier2.value=false;

                                                                          }

                                                                      }*/
                                                                      },
                                                                      );
                                                                      },
                                                                      secondary: const Icon(CupertinoIcons.circle_grid_hex),
                                                                      );
                                                                      })
                                                                    ,
                                                                  )),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(height: 1,
                                                            width: MediaQuery
                                                                .of(context)
                                                                .size
                                                                .width - 140,
                                                            decoration: BoxDecoration(border: Border(bottom: BorderSide(
                                                              color: Colors.grey.withOpacity(0.4), width: 1,))),)
                                                        ],
                                                      );
                                                    });
                                                  },
                                                )





                                              )
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
                                    Icon(Icons.location_on,color: Colors.grey[350],),
                                     Container(padding: const EdgeInsets.only(right: 8),decoration:const BoxDecoration(border: Border(right: BorderSide(color: Colors.grey,width: 2))),child: Text('تهران',style: TextStyle(fontFamily: 'Vazir',fontSize: 14,color: Colors.grey[600]),))],),
                              )

                      ],
                    ))
              ],)
          ],
        ),
      ),
          floatingActionButton: bottomMenu(context),
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
          children:List.generate(6, (index) => InkWell(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const Chat(),)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3),blurRadius: 10,spreadRadius: 0)],
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1,)),
                child: Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:  const EdgeInsets.all(0),
                        child: IconButton(onPressed: (){
                          setState(() {
                            liked=!liked;
                          });
                        }, icon:liked==true?Icon(CupertinoIcons.heart,color: Colors.black.withOpacity(0.5),size: 28,):Icon(CupertinoIcons.heart_fill,color: Colors.red.withOpacity(0.9),size: 28,)),
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
                              child: Icon(Icons.message_sharp,color: Colors.blue,size: 25,),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.0,left: 7,right: 20,top: 5),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('گلستان'),Text('دقایقی پیش'),],),
                      )
                    ],),

                ],),
              ),
            ),
          ))

        ),
      ),
      ]),),
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
                IconButton(onPressed: () {},
                    icon: const Icon(Icons.home, color: Colors.white,)),
                IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const DisplayChat(),));},
                    icon: const Icon(Icons.chat, color: Colors.white)),
                IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));},
                    icon: const Icon(Icons.add_circle, color: Colors.white)),
              ],),
            IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>const SettingsPage(),));},
                icon: const Icon(
                  Icons.manage_accounts_sharp, color: Colors.white,))
          ]),
    ),

  );

}

