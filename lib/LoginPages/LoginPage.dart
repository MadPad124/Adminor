
import 'package:adminor/LoginPages/otp_Screen.dart';
import 'package:adminor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:async';
import '../AdeversitingPages/AdvertisingPage.dart';
import '../api/Functions.dart';
final cache = GetStorage();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
@override
  void initState() {
  getUsers();
  super.initState();
  }
  TextEditingController mobileController=TextEditingController(text: cache.read('telephone') ?? '');
  bool showLoading = false;
  Future<void> submitPhoneNumber () async {
  if(mobileController.text.length>=11){
    cache.write('telephone', mobileController.value.text);
    cache.write('city', 'تهران');
    cache.read('telephone')!=null?submitHistory(cache.read('telephone'), 'login',users[0]):null;
    setState(() {
      showLoading = true;
    });

    Future.delayed(const Duration(seconds: 5), () => setState(() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OTPScreen(),
          ));
      showLoading = false;
    }));
    loginUser(mobileController.value.text);
   /* showDialog(context: context, builder: (context) {
*//*      return  AlertDialog(
        title: const Text('آیا شماره تلفن درست است؟',style: TextStyle(fontFamily: 'Vazir',fontSize: 17),),content: Text(mobileController.text,style: const TextStyle(fontFamily: 'Vazir',fontSize: 16,color: Colors.blue)),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            TextButton(onPressed: (){

            }, child: const Text('بله',style: TextStyle(fontFamily: 'Shabnam',fontSize: 14,color: Colors.green))),
            TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('ویرایش',style: TextStyle(fontFamily: 'Shabnam',fontSize: 14,color: Colors.green))),
          ],)
        ],);*//*
    },);*/
    /* getInfo(mobileController.value.text);
    getUsers();
    cache.read('telephone')!=null?submitHistory(cache.read('telephone'), 'login',users[0]):null;
    setState(() {
      showLoading = true;
    });

    cache.writeIfNull('telephone', mobileController.value.text);

    Future.delayed(const Duration(seconds: 5), () => setState(() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Advertising(),
          ));
      showLoading = false;
    })
    );
loginUser(mobileController.value.text);*/
  }
  else if (mobileController.text.length<11){
    ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
            content: const Text('لطفا شماره خود را درست وارد کنید',style: TextStyle(fontFamily: 'Shabnam'),),
          backgroundColor: Colors.red.withOpacity(0.7),
           showCloseIcon: true,
           closeIconColor: Colors.white,
        )
    );
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        primary: false,
        shadowColor: Colors.green,
        automaticallyImplyLeading: false,
        elevation: 1,
        toolbarHeight: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            color: Colors.white,
            child: Center(
              child:
              Stack(
                  children: [
                    Align(alignment: Alignment.bottomCenter,child: Image.asset('assets/images/splash-bottom-page-image.png')),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/images/splash-bottom-page-image-sun.png',
                        opacity: const AlwaysStoppedAnimation(.3),
                      ),
                    ),
                  Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Container(
                     height: 260,
                       width: MediaQuery.of(context).size.width,
                       decoration: const BoxDecoration(
                         borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50),bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
                       ),
                       child: const Center(child: Text('AdminorLogin',style: TextStyle(fontSize: 36,color: Colors.black),))
                   ),
                 ],
                  ),

                Positioned(
                  top: 150,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2),blurRadius: 100)]),
                    width: MediaQuery.of(context).size.width,height: 30,),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(35))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //ردیف ورود و شماره موبایل
                          Container(
                            height: 75,
                            padding: const EdgeInsets.all(13.0),
                            alignment: Alignment.centerRight,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.white,
                                    spreadRadius: 0.2,
                                    blurRadius: 1),
                              ],
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                showLoading ? Container() : Expanded(
                                    flex: 5,
                                    child: TextFormField(
                                      controller: mobileController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[0-9]'))
                                      ],
                                      keyboardType: TextInputType.number,
                                      autofocus: true,
                                      style: const TextStyle(color: Colors.white,fontFamily: 'Shabnam'),
                                      cursorColor: Colors.black87,
                                      cursorWidth: 0,
                                      maxLength: 11,
                                      minLines: 1,
                                      decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        border: InputBorder.none,
                                        icon: Padding(
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: Icon(
                                            Icons.phone_android
                                            ,
                                            color: Colors.white,
                                          ),
                                        ),
                                        labelText: "شماره موبایل",
                                        labelStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                        counterText: '',
                                      ),
                                    )),
                                Expanded(
                                  flex: 2,
                                  child: showLoading ? AnimatedSize(
                                    duration: const Duration(seconds: 1),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        padding: const EdgeInsets.all(6),
                                        animationDuration:
                                        const Duration(milliseconds: 1),
                                        elevation: 2,
                                        splashFactory: InkSparkle.splashFactory,
                                        backgroundColor: Colors.white,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          showLoading = false;
                                        });
                                      },
                                      child: adminorLoadingText(90, 15, Colors.green),
                                    ),
                                  ) : TextButton(
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.all(6),
                                      animationDuration:
                                      const Duration(milliseconds: 1),
                                      elevation: 2,
                                      splashFactory: InkSparkle.splashFactory,
                                      backgroundColor: Colors.white,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                      ),
                                    ),
                                    onPressed: () => submitPhoneNumber(),
                                    child: showText('ورود', 16, Colors.green,FontWeight.normal),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
              ]),
            ),
          ),
        ),
      ),
    );
  }

}