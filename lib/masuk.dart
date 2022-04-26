import 'package:chat/home2.dart';
import 'package:chat/hompeg.dart';
import 'package:chat/log/dummy_data.dart';
//import 'package:chat/log/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Masuk extends StatefulWidget {
  const Masuk({Key? key}) : super(key: key);

  @override
  State<Masuk> createState() => _MasukState();
}

class _MasukState extends State<Masuk> {
  final User_controller = TextEditingController();
  final Pass_controller = TextEditingController();
  late SharedPreferences logindata;
  late bool newuser;
  @override
  void initState() {
    
    super.initState();
    cekLogin();
  }

  void cekLogin() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => MyDashboard()));
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    User_controller.dispose();
    Pass_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dummyData = DummyData.data;
    for (var data in dummyData) {
      print(data);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(" Login"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Login",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Login to Continue",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: User_controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: Pass_controller,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  // secureTextEntry: true,
                  
                ),
              ),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () {
                String username = User_controller.text;
                String password = Pass_controller.text;
                // if (username == DummyData.data && password == DummyData.data ) {
                //   print('Successfull');
                //   logindata.setBool('login', false);
                //   logindata.setString('username', username);
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => MyDashboard()));
                // }
                for (var data in dummyData) {
                  if (data['username'] == username &&
                      data['password'] == password) {
                    print('Successfull');
                    logindata.setBool('login', false);
                    logindata.setString('username', username);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const MyDashboard()));
                  } else {
                    print('Failed');
                  }
                }
              },
              child: Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
