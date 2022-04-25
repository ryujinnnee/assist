import 'package:chat/log/login.dart';
import 'package:chat/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  final bool _switch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home2'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
             onPressed: _logOut,//(){} ,  //_logOut,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('selamat datang'),
          Text('pilih tema'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('light'),
              SizedBox(height: 10),
              Switch(
                value: _switch,
                onChanged: (val) {},
              ),
              Text('dark'),
            ],
          )
        ],
      ),
    );
  }

  void _logOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("isUser");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => const Splash(isUser: true,)));
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => const Login()));
  }
}
