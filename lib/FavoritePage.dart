import 'package:adminor/AdeversitingPages/AdvertisingDetailPage.dart';
import 'package:adminor/AdeversitingPages/AdvertisingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart'as http;
import 'AdeversitingPages/NewAdversitingPage.dart';
import 'Settings/settingsPage.dart';
import 'api/Functions.dart';
import 'chat/displayChatPage.dart';
final cache = GetStorage();
class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: bottomMenu(context),
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
        title: const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text('نشان شده ها ',style: TextStyle(fontFamily: 'Shabnam',color: Colors.white),),
      Icon(Icons.star,color: Colors.yellow,)
      ],
    ),backgroundColor: Colors.green,),
    backgroundColor: Colors.white,
    body: Center(child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: favoriteIndex.isEmpty? Center(child: Column(crossAxisAlignment:CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [Icon(Icons.star,color: Colors.grey.shade200,size: 200,),const Text('هیچ کاربر ادمینی پیدا نشد',style: TextStyle(fontFamily: 'Shabnam',fontSize: 16),)],),):
      Padding(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: ListView.builder(itemCount: favoriteIndex.length,itemBuilder: (context, index) {
          return InkWell(
            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  AdvertisingDetail(index: favoriteIndex[index]),));},
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),width: w,height: 100,
                  child:Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: ClipRRect(borderRadius:BorderRadius.circular(50) ,
                        child: Image.network('$baseUrl/uploads/${users[favoriteIndex[index]].image}',width: 70,height: 70,),),
                    ),const SizedBox(width:15),
                      Expanded(
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,children: [
                          Text(users[favoriteIndex[index]].name,style: const TextStyle(fontFamily: 'Shabnam'),),
                          const SizedBox(height: 5,),
                          Text('قیمت ${users[favoriteIndex[index]].price} میلیون تومان',style: const TextStyle(fontFamily: 'Shabnam'),),
                        ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                            onPressed: () {
                              showDialog(context: context, builder: (context) =>  AlertDialog(
                                  actions: [
                                    TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),onPressed: (){Navigator.of(context).pop();}, child: const Text('انصراف',style: TextStyle(fontFamily: 'Vazir',fontSize: 15,color: Colors.white),)),
                                    TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),onPressed: () async {
                                      submitScore(users[favoriteIndex[index]].id,-5);
                                      users[favoriteIndex[index]].score-=5;
                                      var url = Uri.parse('$baseUrl/?action=addfavorite');
                                      await http.post(url, body: {'phone': cache.read('telephone'),'adminPhone':users[favoriteIndex[index]].phone_number,'index':favoriteIndex[index].toString()});
                                      cache.write(users[favoriteIndex[index]].phone_number,false);
                                      favoriteIndex.remove(favoriteIndex[index]);
                                      setState(() {

                                      });
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>const Favorite() ,));
                                      setState(() {

                                      });
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        shape: const StadiumBorder(),
                                        elevation: 0,
                                        backgroundColor: Colors.blue.withOpacity(0.7),
                                        width: 300,
                                        content: const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('مورد با موفقیت حذف شد',style: TextStyle(color: Colors.white,fontFamily: 'Shabnam'),),Icon(Icons.delete_outline_rounded,color: Colors.white,)])));
                                      },
                                        child: const Text('تایید',style: TextStyle(fontFamily: 'Vazir',fontSize: 15,color: Colors.white),))
                                  ],
                                  title:const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                    Text('آیا مطمعن هستید؟',style: TextStyle(fontFamily: 'Vazir',fontSize: 15),),
                                    Icon(Icons.error,color: Colors.blue,)],)
                              ),);
                            }, child: const Row(
                          children: [
                            Text('حذف نشان',style: TextStyle(color: Colors.black,fontFamily: 'Vazir'),),
                            Icon(Icons.star_border_purple500_outlined,color: Colors.yellow ,),
                          ],
                        )),
                      ),
                    ],)
              ),
            ),
          );
        },),
      ),

    )),
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
                IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Advertising(),));},
                    icon: const Icon(Icons.home, color: Colors.white,)),
                IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const DisplayChat(),));},
                    icon: const Icon(Icons.chat, color: Colors.white)),
                IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const NewAdvertising(),));},
                    icon: const Icon(Icons.add_circle, color: Colors.white)),
              ],),
            IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>const Settings(),));},
                icon: const Icon(
                  Icons.manage_accounts_sharp, color: Colors.white,))
          ]),
    ),

  );

}

