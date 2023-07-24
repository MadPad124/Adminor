import 'dart:math';
import 'package:adminor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
final pageViewController = PageController();
class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});
  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}
class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child:
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height/2,
                  child: PageView(
                    controller: pageViewController,
                    onPageChanged: (index) {
                      print(index);
                    },
                    children: [
                      sliderComponent('امنیت بالا ', 'assets/images/Data-security.jpg',"امنیت بالا در پیدا کردن ادمین مورد نظر", context),
                      //                   sliderComponent('test', 'assets/images/chronometer.png',"sliderText", context),
                      sliderComponent('ارتباط سریع و دوستانه', 'assets/images/group-young-people.jpg',"با پیشنهاد کردن ادمین های مدنظر شما و فیلتر های جستجو", context),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(children:[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset('assets/images/splash-bottom-page-image.png'),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(
                          'assets/images/splash-bottom-page-image-sun.png',
                          opacity: const AlwaysStoppedAnimation(.3),
                        ),
                      ],
                    ),
                    mainBackContainer(context),


                  ] ),
                ),
              ],
            ),




      ),
    );
  }
/*  Widget bottomSheets() {
    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: <Color>[
            Colors.green.shade600,
            Colors.green.shade600,
          ],
        ),
      ),
      duration: const Duration(milliseconds: 350),
      curve: Curves.fastOutSlowIn,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: SmoothPageIndicator(
              controller: pageViewController,
              count: 3,
              effect: WormEffect(
                spacing: 9,
                dotColor: Colors.green.shade300,
                activeDotColor: Colors.white,
              ),
              onDotClicked: (index) => pageViewController.animateToPage(index,
                  duration: const Duration(milliseconds: 500), curve: Curves.linear),
            ),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'sad',
                style: TextStyle(color: Colors.white, fontSize: 12),
              )),
        ],
      ),
    );
  }*/
}
//main back container---------->
Widget mainBackContainer(context){
  return Padding(
      padding:const EdgeInsets.all(0.0),
      child: Container(
        height: MediaQuery.of(context).size.height/2,
          padding:const EdgeInsets.all(10),
          decoration:const BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(35))),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              nameBox(),
              const SizedBox(height: 10),
              lastnameBox(),
              const SizedBox(height: 10),
              ageBox(),
              const SizedBox(height: 10),

            ],
          ),
      ));
}
//text boxes------------>
//text box name
Widget nameBox(){
  return Container(
    height: 75,
    padding: const EdgeInsets.all(13.0),
    alignment: Alignment.centerRight,
    decoration: BoxDecoration(
      color: Colors.green.withOpacity(0.9),
      boxShadow: const [
        BoxShadow(
            color: Colors.white,
            spreadRadius: 0.2,
            blurRadius: 1),
      ],
      borderRadius: BorderRadius.circular(25),
    ),
    child: Row(
      crossAxisAlignment:CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp('[A-z]')
              )
            ],
            keyboardType: TextInputType.name,
            autofocus: false,
            onChanged: (text) {

            },
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'vazir'),
                cursorColor: Colors.black87,
                cursorWidth: 0,
                maxLength: 11,
                minLines: 1,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              border: InputBorder.none,
              icon: Padding(
                padding: EdgeInsets.only(left: 5.0,right: 13),
                child: Icon(
                  Icons.account_box_sharp,
                  color: Colors.white,
                ),
              ),
              labelText: "نام",
              labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
              counterText: '',
            ),
          ),
        ),
      ],
    ),
  );
}
//text box lName
Widget lastnameBox(){
  return Container(
    height: 75,
    padding: const EdgeInsets.all(13.0),
    alignment: Alignment.centerRight,
    decoration: BoxDecoration(
      color: Colors.green.withOpacity(0.9),
      boxShadow: const [
        BoxShadow(
            color: Colors.white,
            spreadRadius: 0.2,
            blurRadius: 1),
      ],
      borderRadius: BorderRadius.circular(25),
    ),
    child: Row(
      crossAxisAlignment:CrossAxisAlignment.stretch,
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp('[A-z]'))
            ],
            keyboardType: TextInputType.name,
            autofocus: false,
            onChanged: (text) {},
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'vazir'),
            cursorColor: Colors.black87,
            cursorWidth: 0,
            maxLength: 11,
            minLines: 1,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              border: InputBorder.none,
              icon: Padding(
                padding: EdgeInsets.only(left: 5.0,right: 13),
                child: Icon(
                  Icons.supervisor_account_outlined,
                  color: Colors.white,
                ),
              ),
              labelText: "نام خانوادگی",
              labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
              counterText: '',
            ),
          ),
        ),
      ],
    ),
  );
}
//text box age
Widget ageBox(){
  return Container(
    height: 75,
    padding: const EdgeInsets.all(13.0),
    alignment: Alignment.centerRight,
    decoration: BoxDecoration(
      color: Colors.green.withOpacity(0.9),
      boxShadow: const [
        BoxShadow(
            color: Colors.white,
            spreadRadius: 0.2,
            blurRadius: 1),
      ],
      borderRadius: BorderRadius.circular(25),
    ),
    child: Row(
      crossAxisAlignment:CrossAxisAlignment.stretch,
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp('[0-9]'))
            ],
            keyboardType: TextInputType.number,
            autofocus: false,
            onChanged: (text) {},
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'vazir'),
            cursorColor: Colors.black87,
            cursorWidth: 0,
            maxLength: 3,
            minLines: 1,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              border: InputBorder.none,
              icon: Padding(
                padding: EdgeInsets.only(left: 5.0,right: 13),
                child: Icon(
                  Icons.accessibility_sharp,
                  color: Colors.white,
                ),
              ),
              labelText: "سن",
              labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
              counterText: '',
            ),
          ),
        ),
      ],
    ),
  );
}
Widget sliderComponent(String sliderTitle,String sliderImgUrl,String sliderText,context){
  return Column(
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/3,
        child: Image.asset(sliderImgUrl,fit: BoxFit.fill),
      ),
      const SizedBox(height: 20,),
      SizedBox(
        width:MediaQuery.of(context).size.width,
        child: Center(child:
        Text(sliderTitle,style: const TextStyle(fontSize: 24,fontFamily: 'vazir'),),
        ),
      ),
      SizedBox(child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(sliderText,style: TextStyle(fontSize: 16,fontFamily: 'vazir',color: Colors.grey[500])),
      ),)
    ],
  );
}