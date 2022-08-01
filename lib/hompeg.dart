import 'package:chat/home.dart';
import 'package:chat/log/login.dart';
import 'package:chat/notip/notipPage.dart';
import 'package:chat/page/ui/ui/screens/beranda.dart';
import 'package:chat/splash.dart';
import 'package:chat/theme/colorplt.dart';
import 'package:chat/update/update.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/sharedpreferences/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  _MyDashboardState createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  late SharedPreferences logindata;
  late String username;
  late String nama;

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
      // nama = logindata.getString('nama')!;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: primary,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.five_g,), //NotipCenter(),
            // onPressed: _logOut,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StateManag(),
                ),
              );
            },
          ),
          IconButton(
            onPressed: () {
               Navigator.pushReplacement(context,
                    new MaterialPageRoute(builder: (context) => NotipCenter()));
            }, 
            icon: Icon(
              Icons.notifications)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'selamat Datang:) ${user.displayName}',
                
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                
                Navigator.pushReplacement(context,
                    new MaterialPageRoute(builder: (context) => BerandaUI())); //Home
              },
              child: Text('Ke home'),
            )
          ],
        ),
      ),
    );
  }
  void _logOut() async {
    SharedPreferences p = await SharedPreferences.getInstance();
    logindata.setBool('login', true);
    p.remove('logindata');
    dispose();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Splash()));
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => const Login()));
  }
}
