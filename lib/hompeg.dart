import 'package:chat/home.dart';
import 'package:chat/log/login.dart';
import 'package:chat/splash.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/sharedpreferences/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyDashboard(),
//     );
//   }
// }
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logOut,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'selamat Datang  $username',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            RaisedButton(
              onPressed: () {
                
                Navigator.pushReplacement(context,
                    new MaterialPageRoute(builder: (context) => Home()));
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
