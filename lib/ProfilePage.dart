import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'AdeversitingPages/AdvertisingPage.dart';
import 'AdeversitingPages/NewAdversitingPage.dart';
import 'Settings/settingsPage.dart';
import 'chat/displayChatPage.dart';
bool haveImage=false;
class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;

    TextEditingController nameController=TextEditingController(text: 'حسین کریمیان');
    TextEditingController emailController=TextEditingController(text: 'hkarimian79@gmail.com');
    TextEditingController phoneController=TextEditingController(text:'09217123169');
    TextEditingController locationController=TextEditingController(text:'تهران');
    return Scaffold(

      body:  Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StatefulBuilder(builder: (BuildContext context, StateSetter setState)=>
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: (){setState((){haveImage=!haveImage;});},
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          border:  const DashedBorder.fromBorderSide(side: BorderSide(color: Colors.green), dashLength: 6),
                          borderRadius: BorderRadius.circular(50)),
                      child:  Center(child:haveImage==false?ClipRRect(borderRadius: BorderRadius.circular(50),child: Image.asset('assets/images/UserRandom.png')):Text('افزودن تصویر',style: TextStyle(fontFamily: 'Shabnam'),)),
                    ),
                  ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: w-50,
                child: TextField(keyboardType: TextInputType.name,controller: nameController,
                  decoration: const InputDecoration(suffixIcon:Icon(Icons.account_circle_rounded),label:Text('نام',style: TextStyle(fontFamily: 'Shabnam'),),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2))
                  ,
                ),),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: w-50,
                child: TextField(style:const TextStyle(fontFamily: 'Vazir'),controller: emailController,keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(suffixIcon:Icon(Icons.mail),label:Text('ایمیل',style: TextStyle(fontFamily: 'Shabnam'),),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2))
                  ,
                ),),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: w-50,
                child: TextField(style:const TextStyle(fontFamily: 'Vazir',color: Colors.grey),controller:phoneController,readOnly: true,keyboardType: TextInputType.number,
                  decoration: const InputDecoration(suffixIcon:Icon(Icons.phone_android),label:Text('تلفن همراه',style: TextStyle(fontFamily: 'Shabnam'),),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1)),labelStyle: TextStyle(color: Colors.grey)
                  ,
                ),),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: w-50,
                child: TextField(style:const TextStyle(fontFamily: 'Vazir'),controller:locationController,readOnly: true,keyboardType: TextInputType.number,
                  decoration: const InputDecoration(suffixIcon:Icon(Icons.location_city),label:Text('مکان',style: TextStyle(fontFamily: 'Shabnam'),),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2))
                  ,
                ),),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    behavior: SnackBarBehavior.floating,
                    shape: const StadiumBorder(),
                    elevation: 0,
                    backgroundColor: Colors.green.withOpacity(0.1),
                    width: 300,
                    content: const Center(child: Text('تغییرات با موفقیت اعمال شد',style: TextStyle(color: Colors.black),))));
              },style: ButtonStyle(fixedSize: MaterialStateProperty.all(const Size(150, 40)),backgroundColor: MaterialStateProperty.all(Colors.green)), child: const Text('ثبت تغییرات'),)
            ]),
      ),
        ),
      floatingActionButton:bottomMenu(context) ,
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
