import 'dart:math';

import 'package:adminor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            color: Colors.white,
            child: Center(
              child: PageView(
                controller: pageViewController,
                onPageChanged: (index) {
                  print(index);
                },
                children: [
                  Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(35))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
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
                                crossAxisAlignment:
                                CrossAxisAlignment.stretch,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
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
                                      maxLength: 11,
                                      minLines: 1,
                                      decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        border: InputBorder.none,
                                        icon: Padding(
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: Icon(
                                            Icons.phone_android,
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
                            ),
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
                                crossAxisAlignment:
                                CrossAxisAlignment.stretch,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
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
                                      maxLength: 11,
                                      minLines: 1,
                                      decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        border: InputBorder.none,
                                        icon: Padding(
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: Icon(
                                            Icons.phone_android,
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
                            ),
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
                                crossAxisAlignment:
                                CrossAxisAlignment.stretch,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
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
                                      maxLength: 11,
                                      minLines: 1,
                                      decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        border: InputBorder.none,
                                        icon: Padding(
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: Icon(
                                            Icons.phone_android,
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
                            ),
                          ],
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(35))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
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
                                crossAxisAlignment:
                                CrossAxisAlignment.stretch,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
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
                                      style: TextStyle(
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
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: Icon(
                                            Icons.phone_android,
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
                            ),
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
                                crossAxisAlignment:
                                CrossAxisAlignment.stretch,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
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
                                      style: TextStyle(
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
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: Icon(
                                            Icons.phone_android,
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
                            ),
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
                                crossAxisAlignment:
                                CrossAxisAlignment.stretch,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
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
                                      style: TextStyle(
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
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: Icon(
                                            Icons.phone_android,
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
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomSheets() {
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
                  duration: Duration(milliseconds: 500), curve: Curves.linear),
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'sad',
                style: TextStyle(color: Colors.white, fontSize: 12),
              )),
        ],
      ),
      duration: Duration(milliseconds: 350),
      curve: Curves.fastOutSlowIn,
    );
  }
}
