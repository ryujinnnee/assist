
import 'package:chat/home2.dart';
import 'package:chat/log/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({ Key? key, required this.isUser }) : super(key: key);
  static const String routeName = '/splash';

  final bool isUser;
 // Splash(this.isUser);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => widget.isUser ? const Home2() : const Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Loading..'),
      ),
    );
  }
}