import 'package:adminor/AdeversitingPages/AdvertisingPage.dart';
import 'package:adminor/LoginPages/LoginPage.dart';
import 'package:adminor/api/Functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final cache=GetStorage();
  @override
  void initState() {
    sendOtp(cache.read('telephone'), 'otp');
    super.initState();
  }
  TextEditingController pin1Controller=TextEditingController();

  TextEditingController pin2Controller=TextEditingController();

  TextEditingController pin3Controller=TextEditingController();

  TextEditingController pin4Controller=TextEditingController();

  TextEditingController pin5Controller=TextEditingController();

  TextEditingController pin6Controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(elevation: 0,),
      body:
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
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('کد ارسال شده به  ${cache.read('telephone') } را وارد کنید',style: const TextStyle(fontFamily: 'Shabnam'),),
                  const SizedBox(height: 20,),
                  Form(child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 55,
                        height: 55,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black,fontFamily: 'Shabnam'),
                          onChanged: (value) {
                            if(value.isEmpty){
                              FocusScope.of(context).nextFocus();
                            }
                            if(value.isNotEmpty) {
                              FocusScope.of(context).requestFocus(FocusNode());
                              if (pin1Controller.text.isNotEmpty &&
                                  pin2Controller.text.isNotEmpty &&
                                  pin3Controller.text.isNotEmpty &&
                                  pin4Controller.text.isNotEmpty &&
                                  pin5Controller.text.isNotEmpty) {
                                String code=pin1Controller.text+pin2Controller.text+pin3Controller.text+pin4Controller.text+pin5Controller.text+pin6Controller.text;
                                if(validateCode(code)=='ok'){
                                  getInfo(cache.read('telephone'));
                                  getHistory(cache.read('telephone'));
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Advertising(),));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text('به ادمینور خوش آمدید',style: TextStyle(fontFamily: 'Shabnam'),),
                                        backgroundColor: Colors.blue.withOpacity(0.7),
                                      )
                                  );
                                }
                                else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text('کد 6 رقمی اشتباه است',style: TextStyle(fontFamily: 'Shabnam'),),
                                        backgroundColor: Colors.red.withOpacity(0.7),
                                        showCloseIcon: true,
                                        closeIconColor: Colors.white,
                                      )
                                  );
                                }
                              }
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          controller: pin6Controller,
                          decoration: InputDecoration(contentPadding: const EdgeInsets.symmetric(vertical: 15),hintText: '0',hintStyle: const TextStyle(color: Colors.blue,fontFamily: 'Shabnam'),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.5))),
                              border:OutlineInputBorder(borderRadius: BorderRadius.circular(15)) ),
                        ),
                      ),
                      const SizedBox(width:10 ,),
                      SizedBox(
                        width: 55,
                        height: 55,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black,fontFamily: 'Shabnam'),
                          onChanged: (value) {
                            if(value.length==1){
                              FocusScope.of(context).previousFocus();
                              if (pin1Controller.text.isNotEmpty &&
                                  pin2Controller.text.isNotEmpty &&
                                  pin3Controller.text.isNotEmpty &&
                                  pin4Controller.text.isNotEmpty &&
                                  pin6Controller.text.isNotEmpty) {
                                String code=pin1Controller.text+pin2Controller.text+pin3Controller.text+pin4Controller.text+pin5Controller.text+pin6Controller.text;
                                if(validateCode(code)=='ok'){
                                  getInfo(cache.read('telephone'));
                                  getHistory(cache.read('telephone'));
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Advertising(),));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text('به ادمینور خوش آمدید',style: TextStyle(fontFamily: 'Shabnam'),),
                                        backgroundColor: Colors.blue.withOpacity(0.7),
                                      )
                                  );
                                }
                                else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text('کد 6 رقمی اشتباه است',style: TextStyle(fontFamily: 'Shabnam'),),
                                        backgroundColor: Colors.red.withOpacity(0.7),
                                        showCloseIcon: true,
                                        closeIconColor: Colors.white,
                                      )
                                  );
                                }
                              }
                            }
                            if(value.isEmpty){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          controller: pin5Controller,
                          decoration: InputDecoration(contentPadding: const EdgeInsets.symmetric(vertical: 15),hintText: '0',hintStyle: const TextStyle(color: Colors.blue,fontFamily: 'Shabnam'),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.5))),
                              border:OutlineInputBorder(borderRadius: BorderRadius.circular(15)) ),
                        ),
                      ),
                      const SizedBox(width:10 ,),
                      SizedBox(
                        width: 55,
                        height: 55,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black,fontFamily: 'Shabnam'),
                          onChanged: (value) {
                            if(value.length==1){
                              FocusScope.of(context).previousFocus();
                              if (pin1Controller.text.isNotEmpty &&
                                  pin2Controller.text.isNotEmpty &&
                                  pin3Controller.text.isNotEmpty &&
                                  pin5Controller.text.isNotEmpty &&
                                  pin6Controller.text.isNotEmpty) {
                                String code=pin1Controller.text+pin2Controller.text+pin3Controller.text+pin4Controller.text+pin5Controller.text+pin6Controller.text;
                                if(validateCode(code)=='ok'){
                                  getInfo(cache.read('telephone'));
                                  getHistory(cache.read('telephone'));
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Advertising(),));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text('به ادمینور خوش آمدید',style: TextStyle(fontFamily: 'Shabnam'),),
                                        backgroundColor: Colors.blue.withOpacity(0.7),
                                      )
                                  );
                                }
                                else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text('کد 6 رقمی اشتباه است',style: TextStyle(fontFamily: 'Shabnam'),),
                                        backgroundColor: Colors.red.withOpacity(0.7),
                                        showCloseIcon: true,
                                        closeIconColor: Colors.white,
                                      )
                                  );
                                }
                              }
                            }
                            if(value.isEmpty){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          controller: pin4Controller,
                          decoration: InputDecoration(contentPadding: const EdgeInsets.symmetric(vertical: 15),hintText: '0',hintStyle: const TextStyle(color: Colors.blue,fontFamily: 'Shabnam'),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.5))),
                              border:OutlineInputBorder(borderRadius: BorderRadius.circular(15)) ),
                        ),
                      ),
                      const SizedBox(width:10 ,),
                      SizedBox(
                        width: 55,
                        height: 55,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black,fontFamily: 'Shabnam'),
                          onChanged: (value) {
                            if(value.length==1){
                              if (pin1Controller.text.isNotEmpty &&
                                  pin2Controller.text.isNotEmpty &&
                                  pin4Controller.text.isNotEmpty &&
                                  pin5Controller.text.isNotEmpty &&
                                  pin6Controller.text.isNotEmpty) {
                                String code=pin1Controller.text+pin2Controller.text+pin3Controller.text+pin4Controller.text+pin5Controller.text+pin6Controller.text;
                                if(validateCode(code)=='ok'){
                                  getInfo(cache.read('telephone'));
                                  getHistory(cache.read('telephone'));
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Advertising(),));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text('به ادمینور خوش آمدید',style: TextStyle(fontFamily: 'Shabnam'),),
                                        backgroundColor: Colors.blue.withOpacity(0.7),
                                      )
                                  );
                                }
                                else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text('کد 6 رقمی اشتباه است',style: TextStyle(fontFamily: 'Shabnam'),),
                                        backgroundColor: Colors.red.withOpacity(0.7),
                                        showCloseIcon: true,
                                        closeIconColor: Colors.white,
                                      )
                                  );
                                }
                              }
                              FocusScope.of(context).previousFocus();
                            }
                            if(value.isEmpty){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          controller: pin3Controller,
                          decoration: InputDecoration(contentPadding: const EdgeInsets.symmetric(vertical: 15),hintText: '0',hintStyle: const TextStyle(color: Colors.blue,fontFamily: 'Shabnam'),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.5))),
                              border:OutlineInputBorder(borderRadius: BorderRadius.circular(15)) ),
                        ),
                      ),
                      const SizedBox(width:10 ,),
                      SizedBox(
                        width: 55,
                        height: 55,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black,fontFamily: 'Shabnam'),
                          onChanged: (value) {
                            if(value.length==1){
                              FocusScope.of(context).previousFocus();
                              if (pin1Controller.text.isNotEmpty &&
                                  pin3Controller.text.isNotEmpty &&
                                  pin4Controller.text.isNotEmpty &&
                                  pin5Controller.text.isNotEmpty &&
                                  pin6Controller.text.isNotEmpty) {
                                String code=pin1Controller.text+pin2Controller.text+pin3Controller.text+pin4Controller.text+pin5Controller.text+pin6Controller.text;
                                if(validateCode(code)=='ok'){
                                  getInfo(cache.read('telephone'));
                                  getHistory(cache.read('telephone'));
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Advertising(),));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text('به ادمینور خوش آمدید',style: TextStyle(fontFamily: 'Shabnam'),),
                                        backgroundColor: Colors.blue.withOpacity(0.7),
                                      )
                                  );
                                }
                                else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text('کد 6 رقمی اشتباه است',style: TextStyle(fontFamily: 'Shabnam'),),
                                        backgroundColor: Colors.red.withOpacity(0.7),
                                        showCloseIcon: true,
                                        closeIconColor: Colors.white,
                                      )
                                  );
                                }
                              }
                            }
                            if(value.isEmpty){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          controller: pin2Controller,
                          decoration: InputDecoration(contentPadding: const EdgeInsets.symmetric(vertical: 15),hintText: '0',hintStyle: const TextStyle(color: Colors.blue,fontFamily: 'Shabnam'),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.5))),
                              border:OutlineInputBorder(borderRadius: BorderRadius.circular(15)) ),
                        ),
                      ),
                      const SizedBox(width:10 ,),
                      SizedBox(
                        width: 55,
                        height: 55,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black,fontFamily: 'Shabnam'),
                          onChanged: (value) {
                            if(value.isNotEmpty){
                              FocusScope.of(context).previousFocus();
                              if (pin2Controller.text.isNotEmpty &&
                                  pin3Controller.text.isNotEmpty &&
                                  pin4Controller.text.isNotEmpty &&
                                  pin5Controller.text.isNotEmpty&&
                                  pin6Controller.text.isNotEmpty ) {
                                String code=pin1Controller.text+pin2Controller.text+pin3Controller.text+pin4Controller.text+pin5Controller.text+pin6Controller.text;
                                if(validateCode(code)=='ok'){
                                  getInfo(cache.read('telephone'));
                                  getHistory(cache.read('telephone'));
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Advertising(),));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text('به ادمینور خوش آمدید',style: TextStyle(fontFamily: 'Shabnam'),),
                                        backgroundColor: Colors.blue.withOpacity(0.7),
                                      )
                                  );
                                }
                                else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text('کد 6 رقمی اشتباه است',style: TextStyle(fontFamily: 'Shabnam'),),
                                        backgroundColor: Colors.red.withOpacity(0.7),
                                        showCloseIcon: true,
                                        closeIconColor: Colors.white,
                                      )
                                  );
                                }
                              }

                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],

                          controller: pin1Controller,
                          decoration: InputDecoration(contentPadding: const EdgeInsets.symmetric(vertical: 15),hintText: '0',hintStyle: const TextStyle(color: Colors.blue,fontFamily: 'Shabnam'),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.5))),
                              border:OutlineInputBorder(borderRadius: BorderRadius.circular(15)) ),
                        ),
                      ),
                    ],
                  )),
                  const SizedBox(height: 10,),
                   Center(child: InkWell(onTap: () =>Navigator.push(context,MaterialPageRoute(builder: (context) => const Login(),)),child: Text('ویرایش تلفن',style: TextStyle(fontFamily: 'Shabnam',color: Colors.cyan,decoration: TextDecoration.underline,decorationColor: Colors.cyan),)),)
                ],
              ),
            ),
          ]),


    );
  }
  validateCode(var code) {
    if(code==cache.read('otp')){
      return 'ok';
    }
    else {
      return 'wrong code';
    }
  }
}

