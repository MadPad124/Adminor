
import 'package:adminor/Settings/settingsPage.dart';
import 'package:adminor/api/Functions.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../structure.dart';
double rating=3;
List<int> likely=[];
final cache = GetStorage();
class AdvertisingDetail extends StatefulWidget {
  final int index;
  const AdvertisingDetail({super.key, required this.index});


  @override
  State<AdvertisingDetail> createState() => _AdvertisingDetailState();
}

class _AdvertisingDetailState extends State<AdvertisingDetail> {
@override
  void initState() {
  cache.read(users[widget.index].phone_number);
    rating=3;
    likely=[];
    for(int i=0;i<users.length;i++){
      if(users[i].city==users[widget.index].city && users[i].id!=users[widget.index].id){
        likely.add(i);
      }
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.green,
          leading: IconButton(onPressed: (){Navigator.of(context).pop();},icon: const Icon(Icons.arrow_back_outlined,color: Colors.white,),),
          actions: [
            Padding(
              padding:const EdgeInsets.only(left: 8.0),
              child: IconButton(onPressed: (){
                switch(cache.read(users[widget.index].phone_number)){
                  case false:
                    cache.write(users[widget.index].phone_number,true);
                    addFavorite(users[widget.index].phone_number,widget.index);
                    submitScore(users[widget.index].id, 5);
                    users[widget.index].score+=5;
                    setState(() {

                    });
                    break;
                  case null:
                    cache.write(users[widget.index].phone_number,true);
                    submitScore(users[widget.index].id,5);
                    users[widget.index].score+=5;
                    addFavorite(users[widget.index].phone_number,widget.index);
                    setState(() {

                    });
                    break;
                  case true:
                    submitScore(users[widget.index].id, -5);
                    users[widget.index].score-=5;
                    if(users[widget.index].score<10){
                    submitHistory(users[widget.index].adminPhone, 'alarm',users[widget.index]);
                    }
                    cache.write(users[widget.index].phone_number,false);
                    addFavorite(users[widget.index].phone_number,widget.index);
                    setState(() {

                    });
                    break;
                }
                },icon:Icon(Icons.star_rate_sharp,color: cache.read(users[widget.index].phone_number)==true?Colors.yellowAccent:Colors.white)),
            ),
          ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: [
                Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                 Padding(
                 padding: const EdgeInsets.only(right: 10.0,bottom: 10),
                 child: Text('نام : ${users[widget.index].name}',style: const TextStyle(fontFamily: 'Shabnam'),),
               ),
                 Padding(
                   padding: const EdgeInsets.only(right: 10.0,bottom: 10),
                   child: Text('دسته بندی : ${users[widget.index].type}',style: const TextStyle(fontFamily: 'Shabnam'),),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(right: 10.0),
                   child: Text('شهر : ${users[widget.index].city}',style: const TextStyle(fontFamily: 'Shabnam'),),
                 ),
               ],),
                  const Column(
                    children: [
                    Icon(Icons.supervisor_account_outlined,size: 20,),
                    SizedBox(height: 20,),
                    Icon(Icons.supervisor_account_outlined,size: 20,),
                    SizedBox(height: 20,),
                    Icon(Icons.supervisor_account_outlined,size: 20,),
                  ],),
                  const Column(
                    children: [
                      Icon(Icons.supervisor_account_outlined,size: 20,),
                      SizedBox(height: 20,),
                      Icon(Icons.supervisor_account_outlined,size: 20,),
                    ],),
                  const Column(
                    children: [
                      Icon(Icons.supervisor_account_outlined,size: 20,),
                    ],),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ClipRRect(borderRadius:BorderRadius.circular(50),child: Image.network('$baseUrl/uploads/${users[widget.index].image}',width: 100,height: 100,)),
                  ),
                ],),
            ),
             Container(
              height: 1,
              decoration: const BoxDecoration(
                  border:  DashedBorder.fromBorderSide(side: BorderSide(color: Colors.green), dashLength: 6),
           ),
            ),


            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset('assets/images/cash.png',width: 100,height: 100,),
                  ),
                  const Column(
                    children: [
                      Icon(Icons.attach_money,size: 20,color: Colors.orange,),
                    ],),
                  const Column(
                    children: [
                      Icon(Icons.attach_money,size: 20,color: Colors.orange,),
                      SizedBox(height: 20,),
                      Icon(Icons.attach_money,size: 20,color: Colors.orange,),
                    ],),
                  const Column(
                    children: [
                      Icon(Icons.attach_money,size: 20,color: Colors.orange,),
                      SizedBox(height: 20,),
                      Icon(Icons.attach_money,size: 20,color: Colors.orange,),
                      SizedBox(height: 20,),
                      Icon(Icons.attach_money,size: 20,color: Colors.orange,),
                    ],),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,bottom: 10),
                        child: Text('قیمت : ${users[widget.index].price} میلیون',style: const TextStyle(fontFamily: 'Shabnam'),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,bottom: 10),
                        child: Text('شیوه پرداخت : ${users[widget.index].paymentMethod}',style: const TextStyle(fontFamily: 'Shabnam'),),
                      ),
                    ],),
                ],),
            ),
            Container(
              height: 1,
              decoration: const BoxDecoration(
                border:  DashedBorder.fromBorderSide(side: BorderSide(color: Colors.green), dashLength: 6),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: [
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0,bottom: 10),
                        child: Text('نوع همکاری : ${users[widget.index].dealType}',style: const TextStyle(fontFamily: 'Shabnam'),),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 10.0,bottom: 10),
                        child: Text('ساعت های همکاری',style: TextStyle(fontFamily: 'Shabnam'),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: Text('${users[widget.index].startTime} : ${users[widget.index].endTime}',style: const TextStyle(fontFamily: 'Shabnam'),),
                      ),
                    ],),
                  const Column(
                    children: [
                      Icon(Icons.work,size: 20,color: Colors.green,),
                      SizedBox(height: 20,),
                      Icon(Icons.work,size: 20,color: Colors.green),
                      SizedBox(height: 20,),
                      Icon(Icons.work,size: 20,color: Colors.green),
                    ],),
                  const Column(
                    children: [
                      Icon(Icons.work,size: 20,color: Colors.green),
                      SizedBox(height: 20,),
                      Icon(Icons.work,size: 20,color: Colors.green),
                    ],),
                  const Column(
                    children: [
                      Icon(Icons.work,size: 20,color: Colors.green),
                    ],),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset('assets/images/deal.jpg',width: 100,height: 100,),
                  ),
                ],),
            ),
            Container(
              height: 1,
              decoration: const BoxDecoration(
                border:  DashedBorder.fromBorderSide(side: BorderSide(color: Colors.green), dashLength: 6),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset('assets/images/history.jpg',width: 100,height: 100,),
                  ),
                  const Column(
                    children: [
                      Icon(Icons.access_time_filled,size: 20,color: Colors.blue),
                    ],),
                  const Column(
                    children: [
                      Icon(Icons.access_time_filled,size: 20,color: Colors.blue),
                      SizedBox(height: 20,),
                      Icon(Icons.access_time_filled,size: 20,color: Colors.blue),
                    ],),
                  const Column(
                    children: [
                      Icon(Icons.access_time_filled,size: 20,color: Colors.blue),
                      SizedBox(height: 20,),
                      Icon(Icons.access_time_filled,size: 20,color: Colors.blue),
                      SizedBox(height: 20,),
                      Icon(Icons.access_time_filled,size: 20,color: Colors.blue),
                    ],),




                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,bottom: 10),
                        child: Text('سابقه : ${users[widget.index].history}',style: const TextStyle(fontFamily: 'Shabnam'),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,bottom: 10),
                        child: Text(' سربازی : ${users[widget.index].status}',style: const TextStyle(fontFamily: 'Shabnam'),),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0,bottom: 10),
                        child: Row(
                          children: [
                            Text('هویت : تایید شده',style: TextStyle(fontFamily: 'Shabnam'),),
                            Icon(Icons.shield_outlined,color: Colors.blue,),
                          ],
                        ),
                      ),
                    ],),
                ],),
            ),
            Container(
              height: 1,
              decoration: const BoxDecoration(
                border:  DashedBorder.fromBorderSide(side: BorderSide(color: Colors.green), dashLength: 6),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0,bottom: 10),
                        child: Text('تلفن : ${users[widget.index].phone_number}',style: const TextStyle(fontFamily: 'Shabnam'),),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 10.0,bottom: 10),
                        child: Text('تلفن کارفرما:',style: TextStyle(fontFamily: 'Shabnam'),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: Text(users[widget.index].email_2,style: const TextStyle(fontFamily: 'Shabnam'),),
                      ),
                    ],),
                  const Column(
                    children: [
                      Icon(Icons.sensor_occupied,size: 20,color: Colors.red,),
                      SizedBox(height: 20,),
                      Icon(Icons.sensor_occupied,size: 20,color: Colors.red),
                      SizedBox(height: 20,),
                      Icon(Icons.sensor_occupied,size: 20,color: Colors.red),
                    ],),
                  const Column(
                    children: [
                      Icon(Icons.sensor_occupied,size: 20,color: Colors.red),
                      SizedBox(height: 20,),
                      Icon(Icons.sensor_occupied,size: 20,color: Colors.red),
                    ],),
                  const Column(
                    children: [
                      Icon(Icons.sensor_occupied,size: 20,color: Colors.red),
                    ],),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset('assets/images/socialMedia.png',width: 100,height: 100,),
                  ),
                ],),
            ),
            Container(
              height: 1,
              decoration: const BoxDecoration(
                border:  DashedBorder.fromBorderSide(side: BorderSide(color: Colors.green), dashLength: 6),
              ),
            ),
            const SizedBox(height: 5,),
            SizedBox(width:MediaQuery.of(context).size.width,child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('توضیحات تکمیلی',style: TextStyle(fontFamily: 'Shabnam'),),
                  SizedBox(width: 5,height: 5,),
                  Icon(Icons.check_circle,color: Colors.green,)
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(width:MediaQuery.of(context).size.width,height:200,decoration:BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.green,width: 2)),child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(users[widget.index].specialConditions,maxLines: 5,),
              )),
            ),
Column(children: [
  SizedBox(height:cache.read('${users[widget.index].phone_number}rated')==false?0:10),
  cache.read('${users[widget.index].phone_number}rated')==false?const Text('به این کاربر امتیاز بدهید',style: TextStyle(fontFamily: 'Shabnam'),):Container(),
  const SizedBox(height: 15,),

  cache.read('${users[widget.index].phone_number}rated')==false?
  RatingBar.builder(
    onRatingUpdate: (value) => rating=value,
    glowColor: Colors.white,
    initialRating: 3,
    itemCount: 5,
    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
    itemBuilder: (context, index) {
      switch (index) {
        case 0:
          return const Icon(
            Icons.sentiment_very_dissatisfied,
            color: Colors.red,
          );
        case 1:
          return const Icon(
            Icons.sentiment_dissatisfied,
            color: Colors.redAccent,
          );
        case 2:
          return const Icon(
            Icons.sentiment_neutral,
            color: Colors.amber,
          );
        case 3:
          return const Icon(
            Icons.sentiment_satisfied,
            color: Colors.lightGreen,
          );
        case 4:
          return const Icon(
            Icons.sentiment_very_satisfied,
            color: Colors.green,
          );
        default:
          return Container();
      }
    },
  ):const Icon(Icons.sentiment_very_satisfied_outlined,color: Colors.green,size: 50,),
   SizedBox(height: cache.read('${users[widget.index].phone_number}rated')==false?15:10,),
  cache.read('${users[widget.index].phone_number}rated')==false? ElevatedButton(style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),onPressed: () async {
    submitRating(rating,users[widget.index].phone_number);
    submitHistory(cache.read('telephone'), 'rating',users[widget.index]);
    setState(() {
      submitScore(users[widget.index].id,rating.toInt()-3);
      users[widget.index].score=rating.toInt()-3;
      if(users[widget.index].score<10){
        submitHistory(users[widget.index].adminPhone, 'alarm',users[widget.index]);
      }
      cache.write('${users[widget.index].phone_number}rated',true);
    });

    }, child: const Text('ثبت نظر',style: TextStyle(fontFamily: 'Shabnam',color: Colors.white),))
      :
  const Text('ممنون از نظر و همکاری شما',style: TextStyle(fontFamily: 'Shabnam')),
  const SizedBox(height: 20,),

],),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              const Padding(
                padding: EdgeInsets.only(right: 15.0,left: 10),
                child: Text('موارد مشابه',style: TextStyle(fontFamily: 'Shabnam',fontWeight: FontWeight.w900),),
              ),
              Expanded(child: Container(height:1,decoration: const BoxDecoration(border: DashedBorder.fromBorderSide(side: BorderSide(color: Colors.green), dashLength: 6)),)),
            ],),
            SizedBox(
              height: 200,
              child: ListView.builder(
                physics: const ScrollPhysics(),
                itemExtent: 150,
                //primary: false,
                //shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount:likely.length,itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    splashColor: Colors.green,
                    overlayColor: MaterialStateProperty.all(Colors.green.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(15),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AdvertisingDetail(index: likely[index]),)),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(width: 1,color: Colors.green)),
                      width: 50,height: 50,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        ClipRRect(borderRadius:  BorderRadius.circular(50),child: Image.network('$baseUrl/uploads/${users[likely[index]].image}',width: 100,height: 100,)),
                        const SizedBox(height: 5,),
                         Text(users[likely[index]].name,style: const TextStyle(fontFamily: 'Shabnam')),
                        const SizedBox(height: 10,),
                         Text(users[likely[index]].city,style: const TextStyle(fontFamily: 'Shabnam',color:Colors.red),),
                    
                      ]),),
                  ),
                );
              },),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              const Padding(
                padding: EdgeInsets.only(right: 15.0,left: 10),
                child: Text('محبوب ترین ها',style: TextStyle(fontFamily: 'Shabnam',fontWeight: FontWeight.w900),),
              ),
              Expanded(child: Container(height:1,decoration: const BoxDecoration(border: DashedBorder.fromBorderSide(side: BorderSide(color: Colors.green), dashLength: 6)),)),
              ],),
            SizedBox(
              height: 200,
              child: ListView.builder(
                physics: const ScrollPhysics(),
                itemExtent: 150,
                //primary: false,
                //shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount:likely.length,itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    splashColor: Colors.green,
                    overlayColor: MaterialStateProperty.all(Colors.green.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(15),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AdvertisingDetail(index: likely[index]),)),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(width: 1,color: Colors.green)),
                      width: 50,height: 50,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(borderRadius:  BorderRadius.circular(50),child: Image.network('$baseUrl/uploads/${users[likely[index]].image}',width: 100,height: 100,)),
                            const SizedBox(height: 5,),
                            Text(users[likely[index]].name,style: const TextStyle(fontFamily: 'Shabnam')),
                            const SizedBox(height: 10,),
                            Text('امتیاز ${users[likely[index]].score}',style: const TextStyle(fontFamily: 'Shabnam'),)

                          ]),),
                  ),
                );
              },),
            ),
            cache.read('telephone')=='0${users[widget.index].adminPhone}'?
            InkWell(onTap:(){
              showDialog(context: context, builder: (context) =>  AlertDialog(
                  actions: [
                    TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),onPressed: (){Navigator.of(context).pop();}, child: const Text('انصراف',style: TextStyle(fontFamily: 'Vazir',fontSize: 15,color: Colors.white),)),
                    TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),onPressed: () async {
                    deleteMyAdmin(users[widget.index].phone_number);
                      cache.write('id', users[widget.index].id);
                    submitHistory(cache.read('telephone'), 'remove',users[widget.index]);
                      users=[];
                    for(var i in userResponse){
                      if(i['id'].toString()!=cache.read('id').toString()){
                        var userItem=UserStructure(int.parse(i['id']), i['phone'], i['adminPhone'],i['name'], i['price'], i['type'], i['image'], i['city'], i['dealType'], i['payment_Method'], i['startTime'], i['endTime'], i['special_Conditions'], i['history'], i['email_1'], i['email_2'],i['status'],int.parse(i['score']));
                        users.add(userItem);
                        setState(() {

                        });
                      }
                    }
                    cache.remove('id');
                    getUsers();
                      setState(() {
                      });
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>const Settings() ,));

                      setState(() {
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          behavior: SnackBarBehavior.floating,
                          shape: const StadiumBorder(),
                          elevation: 0,
                          backgroundColor: Colors.red.withOpacity(0.7),
                          width: 300,
                          content: const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('آگهی با موفقیت حذف شد',style: TextStyle(color: Colors.white,fontFamily: 'Shabnam'),),Icon(Icons.delete_sweep,color: Colors.white,)])));
                    },
                        child: const Text('تایید',style: TextStyle(fontFamily: 'Vazir',fontSize: 15,color: Colors.white),))
                  ],
                  title:const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    Text('آیا مطمعن هستید؟',style: TextStyle(fontFamily: 'Vazir',fontSize: 15),),
                    Icon(Icons.error,color: Colors.blue,)],)
              ),);

            },child: Container(width:MediaQuery.of(context).size.width,height:50,decoration: const BoxDecoration(color: Colors.red),child: const Center(child: Text('حذف آگهی',style: TextStyle(color: Colors.white,fontFamily: 'Shabnam'),))))
            :Container(),
            cache.read('telephone')==users[widget.index].adminPhone?
            InkWell(onTap:(){
              showDialog(context: context, builder: (context) =>  AlertDialog(
                  actions: [
                    TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),onPressed: (){Navigator.of(context).pop();}, child: const Text('انصراف',style: TextStyle(fontFamily: 'Vazir',fontSize: 15,color: Colors.white),)),
                    TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),onPressed: () async {
                      deleteMyAdmin(users[widget.index].phone_number);
                      cache.write('id', users[widget.index].id);
                      submitHistory(cache.read('telephone'), 'remove',users[widget.index]);
                      users=[];
                      for(var i in userResponse){
                        if(i['id'].toString()!=cache.read('id').toString()){
                          var userItem=UserStructure(int.parse(i['id']), i['phone'], i['adminPhone'],i['name'], i['price'], i['type'], i['image'], i['city'], i['dealType'], i['payment_Method'], i['startTime'], i['endTime'], i['special_Conditions'], i['history'], i['email_1'], i['email_2'],i['status'],int.parse(i['score']));
                          users.add(userItem);
                          setState(() {

                          });
                        }
                      }
                      cache.remove('id');
                      getUsers();
                      setState(() {
                      });
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>const Settings() ,));

                      setState(() {
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          behavior: SnackBarBehavior.floating,
                          shape: const StadiumBorder(),
                          elevation: 0,
                          backgroundColor: Colors.red.withOpacity(0.7),
                          width: 300,
                          content: const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('آگهی با موفقیت حذف شد',style: TextStyle(color: Colors.white,fontFamily: 'Shabnam'),),Icon(Icons.delete_sweep,color: Colors.white,)])));
                    },
                        child: const Text('تایید',style: TextStyle(fontFamily: 'Vazir',fontSize: 15,color: Colors.white),))
                  ],
                  title:const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    Text('آیا مطمعن هستید؟',style: TextStyle(fontFamily: 'Vazir',fontSize: 15),),
                    Icon(Icons.error,color: Colors.blue,)],)
              ),);

            },child: Container(width:MediaQuery.of(context).size.width,height:50,decoration: const BoxDecoration(color: Colors.red),child: const Center(child: Text('حذف آگهی',style: TextStyle(color: Colors.white,fontFamily: 'Shabnam'),))))
                :Container(),
          ],),
      ),
    );
  }
}
