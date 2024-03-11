import 'package:adminor/people.dart';
import 'package:flutter/material.dart';
class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    var h=MediaQuery.of(context).size.height;
    return Scaffold(appBar: AppBar(title: const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text('نشان شده ها ',style: TextStyle(fontFamily: 'vazir'),),
      Icon(Icons.star,color: Colors.yellow,)
      ],
    ),backgroundColor: Colors.green,),
    body: Center(child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(width: w,height: h,decoration: const BoxDecoration(color: Colors.teal),
      child: ListView.builder(itemCount: name.length,itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),width: w,height: 100,
              child:Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: ClipRRect(borderRadius:BorderRadius.circular(50) ,
                    child: Image.asset(url[index],width: 70,height: 70,),),
                ),const SizedBox(width:15),
                  Expanded(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Text(name[index],style: const TextStyle(fontFamily: 'Shabnam'),),
                    const SizedBox(height: 5,),
                    Text('قیمت ${price[index]} تومان',style: const TextStyle(fontFamily: 'Shabnam'),),
                ],),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                      onPressed: () {} , child: const Row(
                    children: [
                      Icon(Icons.delete_forever,color: Colors.red ,),
                      Text('حذف نشان',style: TextStyle(color: Colors.black),),
                    ],
                  )),
                ),
                ],)
          ),
        );
      },),
      ),
    )),
    );
  }
}
