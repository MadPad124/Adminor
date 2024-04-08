import 'package:adminor/api/Functions.dart';
import 'package:adminor/chat/ChatPage.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

double Rating=3;
final cache = GetStorage();
class AdvertisingDetail extends StatefulWidget {
  final index;
  const AdvertisingDetail({super.key, required this.index});


  @override
  State<AdvertisingDetail> createState() => _AdvertisingDetailState();
}

class _AdvertisingDetailState extends State<AdvertisingDetail> {
@override
  void initState() {
  cache.read(users[widget.index].phone_number);
  cache.read('${users[widget.index].phone_number}rated');

    Rating=3;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

      return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.green,
          leading: IconButton(onPressed: (){Navigator.of(context).pop();},icon: const Icon(Icons.arrow_back_outlined,color: Colors.white,),),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.share,color: Colors.white,)),
            Padding(
              padding:const EdgeInsets.only(left: 8.0),
              child: IconButton(onPressed: (){

                setState(() {
                  cache.read(users[widget.index].phone_number)==false?cache.write(users[widget.index].phone_number,true):cache.write(users[widget.index].phone_number,false);
                  addFavorite(users[widget.index].phone_number);
              });
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
                    Icon(Icons.supervisor_account_outlined,size: 15,),
                    SizedBox(height: 20,),
                    Icon(Icons.supervisor_account_outlined,size: 15,),
                    SizedBox(height: 20,),
                    Icon(Icons.supervisor_account_outlined,size: 15,),
                  ],),
                  const Column(
                    children: [
                      Icon(Icons.supervisor_account_outlined,size: 15,),
                      SizedBox(height: 20,),
                      Icon(Icons.supervisor_account_outlined,size: 15,),
                    ],),
                  const Column(
                    children: [
                      Icon(Icons.supervisor_account_outlined,size: 15,),
                    ],),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.network(users[widget.index].image,width: 100,height: 100,),
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
                      Icon(Icons.attach_money,size: 15,color: Colors.orange,),
                      SizedBox(height: 20,),
                      Icon(Icons.attach_money,size: 15,color: Colors.orange,),
                      SizedBox(height: 20,),
                      Icon(Icons.attach_money,size: 15,color: Colors.orange,),
                    ],),
                  const Column(
                    children: [
                      Icon(Icons.attach_money,size: 15,color: Colors.orange,),
                      SizedBox(height: 20,),
                      Icon(Icons.attach_money,size: 15,color: Colors.orange,),
                    ],),
                  const Column(
                    children: [
                      Icon(Icons.attach_money,size: 15,color: Colors.orange,),
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
                      Icon(Icons.work_history,size: 15,color: Colors.green,),
                      SizedBox(height: 20,),
                      Icon(Icons.work_history,size: 15,color: Colors.green),
                      SizedBox(height: 20,),
                      Icon(Icons.work_history,size: 15,color: Colors.green),
                    ],),
                  const Column(
                    children: [
                      Icon(Icons.work_history,size: 15,color: Colors.green),
                      SizedBox(height: 20,),
                      Icon(Icons.work_history,size: 15,color: Colors.green),
                    ],),
                  const Column(
                    children: [
                      Icon(Icons.work_history,size: 15,color: Colors.green),
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
                    child: Image.asset('assets/images/tick.jpg',width: 100,height: 100,),
                  ),

                  const Column(
                    children: [
                      Icon(Icons.subdirectory_arrow_right,size: 15,color: Colors.blue),
                      SizedBox(height: 20,),
                      Icon(Icons.subdirectory_arrow_right,size: 15,color: Colors.blue),
                      SizedBox(height: 20,),
                      Icon(Icons.subdirectory_arrow_right,size: 15,color: Colors.blue),
                    ],),
                  const Column(
                    children: [
                      Icon(Icons.subdirectory_arrow_right,size: 15,color: Colors.blue),
                      SizedBox(height: 20,),
                      Icon(Icons.subdirectory_arrow_right,size: 15,color: Colors.blue),
                    ],),
                  const Column(
                    children: [
                      Icon(Icons.subdirectory_arrow_right,size: 15,color: Colors.blue),
                    ],),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,bottom: 10),
                        child: Text('تلفن : ${users[widget.index].phone_number}',style: const TextStyle(fontFamily: 'Shabnam'),),
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
    onRatingUpdate: (value) => Rating=value,
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
    submitRating(Rating,users[widget.index].phone_number);
    setState(() {
      cache.write('${users[widget.index].phone_number}rated',true);
    });

    }, child: const Text('ثبت نظر',style: TextStyle(fontFamily: 'Shabnam',color: Colors.white),))
      :
  const Text('ممنون از نظر و همکاری شما',style: TextStyle(fontFamily: 'Shabnam')),
  const SizedBox(height: 20,),
  Container(height:1,decoration: const BoxDecoration(border: DashedBorder.fromBorderSide(side: BorderSide(color: Colors.green), dashLength: 6)),),
  const SizedBox(height: 10,),

],),
            SizedBox(width: MediaQuery.of(context).size.width,child: const Directionality(textDirection: TextDirection.rtl,child: Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Text('موارد مشابه',style: TextStyle(fontFamily: 'Shabnam'),),
            ))),
            SizedBox(
              height: 200,
              child: ListView.builder(
                physics: const ScrollPhysics(),
                itemExtent: 150,
                //primary: false,
                //shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount:users.length,itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(width: 1,color: Colors.green)),
                    width: 50,height: 50,
                    child: Column(children: [
                      users[index].image=='https://192.168.1.106/adminor/uploads/useravatar.png'?SizedBox(height: 15,):Container(),
                      ClipRRect(borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),child: Image.network(users[index].image,width: 100,height: 100,)),
                      const SizedBox(height: 5,),
                       Text(users[index].name,style: const TextStyle(fontFamily: 'Shabnam')),
                      const SizedBox(height: 10,),
                       Text('قیمت ${users[index].price}',style: TextStyle(fontFamily: 'Shabnam'),)

                    ]),),
                );
              },),
            ),
            InkWell(onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Chat(index: 1),));},child: Container(width:MediaQuery.of(context).size.width,height:50,decoration: const BoxDecoration(color: Colors.green),child: const Center(child: Text('چت با کاربر',style: TextStyle(color: Colors.white,fontFamily: 'Shabnam'),))))
          ],),
      ),
    );
  }
}
