import 'package:chat/google/Logged.dart';
import 'package:chat/google/controller.dart';
import 'package:chat/google/signup_widget.dart';
import 'package:chat/home2.dart';
import 'package:chat/hompeg.dart';
import 'package:chat/log/login.dart';
//import 'package:chat/login2.dart';
import 'package:chat/masuk.dart';
import 'package:chat/page/ui/common/my_colors.dart';
import 'package:chat/theme/colorplt.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:lottie';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  static const String routeName = '/splash';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const CtrlLog()));  //SignupWidget,Masuk
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            // Icon(
            //   Icons.task,
            //   size: 100,
            //   color: primary,
            // ),
            // Image.asset(
            //   'assets/img/tinder_logo.png',
            //   width: 100,
            //   height: 100,
            // ),
            Lottie.network(
              'https://assets10.lottiefiles.com/private_files/lf30_jgdvwwjs.json',
              width: 150,
              // height: 100,
            ),
            const SizedBox(
              height: 500,
            ),
            Image.asset(
              'assets/img/lg_umm.png',
              height: 30.0,
              fit: BoxFit.scaleDown,
            )
          ],
        ),
      ),
    );
  }
}
