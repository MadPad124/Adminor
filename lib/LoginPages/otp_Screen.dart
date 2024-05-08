import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
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
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('کد ارسال شده را وارد کنید',style: TextStyle(fontFamily: 'Shabnam'),),
            SizedBox(height: 20,),Form(child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 55,
                height: 55,
                child: TextFormField(
                  onChanged: (value) {
                    if(value.length==1){
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: pin1Controller,
                  decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 15),hintText: '0',hintStyle: TextStyle(color: Colors.grey[400]),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black.withOpacity(0.5))),
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(15)) ),
                ),
              ),
              SizedBox(
                width: 55,
                height: 55,
                child: TextFormField(
                  onChanged: (value) {
                    if(value.length==1){
                      FocusScope.of(context).nextFocus();
                    }
                    if(value.isEmpty){
                      FocusScope.of(context).previousFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: pin2Controller,
                  decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 15),hintText: '0',hintStyle: TextStyle(color: Colors.grey[400]),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black.withOpacity(0.5))),
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(15)) ),
                ),
              ),
              SizedBox(
                width: 55,
                height: 55,
                child: TextFormField(
                  onChanged: (value) {
                    if(value.length==1){
                      FocusScope.of(context).nextFocus();
                    }
                    if(value.isEmpty){
                      FocusScope.of(context).previousFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: pin3Controller,
                  decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 15),hintText: '0',hintStyle: TextStyle(color: Colors.grey[400]),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black.withOpacity(0.5))),
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(15)) ),
                ),
              ),
              SizedBox(
                width: 55,
                height: 55,
                child: TextFormField(
                  onChanged: (value) {
                    if(value.length==1){
                      FocusScope.of(context).nextFocus();
                    }
                    if(value.isEmpty){
                      FocusScope.of(context).previousFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: pin4Controller,
                  decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 15),hintText: '0',hintStyle: TextStyle(color: Colors.grey[400]),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black.withOpacity(0.5))),
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(15)) ),
                ),
              ),
              SizedBox(
                width: 55,
                height: 55,
                child: TextFormField(
                  onChanged: (value) {
                    if(value.length==1){
                      FocusScope.of(context).nextFocus();
                    }
                    if(value.isEmpty){
                      FocusScope.of(context).previousFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: pin5Controller,
                  decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 15),hintText: '0',hintStyle: TextStyle(color: Colors.grey[400]),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black.withOpacity(0.5))),
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(15)) ),
                ),
              ),
              SizedBox(
                width: 55,
                height: 55,
                child: TextFormField(
                  onChanged: (value) {
                    if(value.isEmpty){
                      FocusScope.of(context).previousFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: pin6Controller,
                  decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 15),hintText: '0',hintStyle: TextStyle(color: Colors.grey[400]),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black.withOpacity(0.5))),
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(15)) ),
                ),
              ),
            ],
            ))
          ],
        ),
      ),

    );
  }
}
