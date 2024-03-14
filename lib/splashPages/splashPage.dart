
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../LoginPages/LoginPage.dart';

class StartAppSplash extends StatelessWidget {
  const StartAppSplash({Key? key}) : super(key: key);

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
        actions: [],
      ),
      body: Center(
        child: Stack(
          children:[
            AnimatedSplashScreen(
              disableNavigation: false,
              duration: 4500,
              animationDuration: const Duration(milliseconds: 320),
              splash:Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('ADMiNOR',
                        textStyle: const TextStyle(
                            fontSize: 32,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                        speed: const Duration(milliseconds: 100)),
                  ],
                  repeatForever: true,
                ),
              ),
              nextScreen: const Login(),
              pageTransitionType: PageTransitionType.fade,
            ),
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
                Image.asset('assets/images/splash-bottom-page-image-sun.png',opacity: const AlwaysStoppedAnimation(.3), ),
              ],
            )
          ]
        ),
      ),
    );
  }
}
