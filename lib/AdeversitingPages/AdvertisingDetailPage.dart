import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AdvertisingDetail extends StatelessWidget {
  const AdvertisingDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lorem='لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.green,
          leading: IconButton(onPressed: (){Navigator.of(context).pop();},icon: const Icon(Icons.arrow_back_outlined),),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.share)),
            Padding(
              padding:const EdgeInsets.only(left: 8.0),
              child: IconButton(onPressed: (){}, icon: const Icon(Icons.star_rate_sharp)),
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
               const Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                 Padding(
                 padding: EdgeInsets.only(right: 10.0,bottom: 10),
                 child: Text('نام : محسن ایزدی',style: TextStyle(fontFamily: 'Shabnam'),),
               ),
                 Padding(
                   padding: EdgeInsets.only(right: 10.0,bottom: 10),
                   child: Text('دسته بندی : بله',style: TextStyle(fontFamily: 'Shabnam'),),
                 ),
                 Padding(
                   padding: EdgeInsets.only(right: 10.0),
                   child: Text('شهر : تهران',style: TextStyle(fontFamily: 'Shabnam'),),
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
                    child: Image.asset('assets/images/UserRandom.png',width: 100,height: 100,),
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0,bottom: 10),
                        child: Text('قیمت : 2 میلیون',style: TextStyle(fontFamily: 'Shabnam'),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0,bottom: 10),
                        child: Text('شیوه پرداخت : ماهانه',style: TextStyle(fontFamily: 'Shabnam'),),
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.0,bottom: 10),
                        child: Text('نوع همکاری : پاره وقت',style: TextStyle(fontFamily: 'Shabnam'),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0,bottom: 10),
                        child: Text('روز های همکاری',style: TextStyle(fontFamily: 'Shabnam'),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 40.0),
                        child: Text('16 : 12',style: TextStyle(fontFamily: 'Shabnam'),),
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0,bottom: 10),
                        child: Text('تلفن : 09217123169',style: TextStyle(fontFamily: 'Shabnam'),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0,bottom: 10),
                        child: Text('وضعیت سربازی : معاف دائم',style: TextStyle(fontFamily: 'Shabnam'),),
                      ),
                      Padding(
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
              child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.green,width: 2)),child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(lorem,maxLines: 5,),
              )),
            ),
Column(children: [
  const SizedBox(height: 10,),
  const Text('به این کاربر امتیاز بدهید',style: TextStyle(fontFamily: 'Shabnam'),),
  const SizedBox(height: 15,),
  RatingBar.builder(
    onRatingUpdate: (value) => print(value),
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
  ),
  const SizedBox(height: 10,),
  ElevatedButton(onPressed: (){}, child: const Text('ثبت نظر',style: TextStyle(fontFamily: 'Shabnam'),)),
  const SizedBox(height: 10,),
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
                itemCount:4,itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(width: 1,color: Colors.green)),
                    width: 50,height: 50,
                    child: Column(children: [
                      ClipRRect(borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),child: Image.asset('assets/images/UserRandom.png',width: 150,height: 100,fit: BoxFit.fill,)),
                      const SizedBox(height: 5,),
                      const Text('ابولفضل محسنی',style: TextStyle(fontFamily: 'Shabnam')),
                      const SizedBox(height: 10,),
                      const Text('قیمت 4300000',style: TextStyle(fontFamily: 'Shabnam'),)

                    ]),),
                );
              },),
            )

          ],),
      ),
    );
  }
}
