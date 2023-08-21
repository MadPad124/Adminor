
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:SizedBox(
        width: MediaQuery.of(context).size.width-30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(heroTag:'btn1',backgroundColor: Colors.green,onPressed: (){Navigator.pop(context);},child: const Directionality(textDirection: TextDirection.rtl,child: Icon(Icons.done,color: Colors.white,))),
            FloatingActionButton(heroTag:'btn2',backgroundColor: Colors.white,onPressed: (){Navigator.pop(context);},child: const Directionality(textDirection: TextDirection.ltr,child: Icon(CupertinoIcons.back,color: Colors.green,))),
          ],),
      ),
      body:GestureDetector(
        onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
        child: SafeArea(
          child:
          SingleChildScrollView(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const Row(children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.0,top: 10),
                    child: Icon(CupertinoIcons.add_circled_solid,color: Colors.cyan,),
                  ),
                 Directionality(textDirection: TextDirection.rtl,child: Padding(
                   padding: EdgeInsets.only(top: 15.0,bottom: 5,right: 5),
                   child: Text("افزودن تصویر",style: TextStyle(fontFamily: 'Vazir',fontSize: 18),),
                 )),
                ],),
                const Directionality(textDirection: TextDirection.rtl,child: Padding(
                  padding: EdgeInsets.only(top: 15.0,bottom: 15,right: 5),
                  child: Text("چند تصویر مرتبط با آگهی درج کنید",style: TextStyle(fontFamily: 'Vazir',fontSize: 14,color: Colors.grey),),
                )),
                imageSection(),
                const SizedBox(height: 15,),
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(validator:(value) {return 'فیلد نمیتونه خالی باشه';},decoration: const InputDecoration(labelText: 'عنوان آگهی',labelStyle: TextStyle(fontFamily: 'Vazir'),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1.5)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2))
                    ),),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(decoration: const InputDecoration(labelText: 'توضیحات',labelStyle: TextStyle(fontFamily: 'Vazir'),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1.5)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2))
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8,right: 8,left: 8,bottom: 150),
                    child:
                    TextFormField(
                      onTap: (){
                        showDialog(context: context, builder: (context) => AlertDialog(contentPadding: const EdgeInsets.only(top:10),title:const Text('انتخاب استان',style: TextStyle(fontFamily: 'Vazir',color: Colors.black,fontSize: 18,fontWeight: FontWeight.w100),),
                            content: SingleChildScrollView(
                              child: Center(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.green.withOpacity(0.7),width: 2))),
                                        width: MediaQuery.of(context).size.width/1.5,
                                        child: const Padding(
                                          padding: EdgeInsets.only(bottom: 15.0,right: 25,top: 8),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              height: 60,
                                              width: MediaQuery.of(context).size.width-130,
                                              child:
                                              TextField(
                                                style: const TextStyle(fontFamily: 'Vazir',color: Colors.black),
                                                textDirection: TextDirection.rtl,
                                                decoration:  InputDecoration(
                                                  enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.green,width: 1),borderRadius: BorderRadius.circular(8)),
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
                            )),);},
                      readOnly:true,decoration: const InputDecoration(suffixIcon: Icon(CupertinoIcons.location),labelText: 'مکان ',labelStyle: TextStyle(fontFamily: 'Vazir'),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1.5)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2))
                    ),),
                  ),
                ],),
            ),
          ),
        ),
      )
    );
  }
}
Widget imageSection(){
  return Row(children: [
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: (){},
        child: Container(width:100,height:100,decoration:  BoxDecoration(
          border: const DashedBorder.fromBorderSide(side: BorderSide(color: Colors.green), dashLength: 6),
          borderRadius: BorderRadius.circular(5),),
            child:const Column(
              mainAxisAlignment: MainAxisAlignment.center ,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.add),
                Text('افزودن تصویر')

              ],)
          /*ListTile(title: Text('افزودن تصویر'),leading: Icon(CupertinoIcons.add)),*/
        ),
      ),
    ),
    SizedBox(
        width: 300,
        height: 110,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,itemBuilder: (context, index) =>
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: (){},
                child: Container(width:100,height:100,decoration:  BoxDecoration(
                  border: const DashedBorder.fromBorderSide(side: BorderSide(color: Colors.green), dashLength: 6),
                  borderRadius: BorderRadius.circular(5),),
                    child:const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.camera),

                      ],)
                  /*ListTile(title: Text('افزودن تصویر'),leading: Icon(CupertinoIcons.add)),*/
                ),
              ),
            ),))
  ],);
}