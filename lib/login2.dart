import 'package:chat/home2.dart';
//import 'package:chat/log/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login2 extends StatefulWidget {
  const Login2({Key? key}) : super(key: key);

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _email,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _password,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: const Text('Login'),
              onPressed: () {
                _login();
              }, //_login,//() {
              // Navigator.of(context).pushNamed('/home');

              //  },
            ),
          ],
        ),
      ),
    );
  }

  void _login() async {
    // if (_email.text == DummyData.data && _password.text == DummyData.data) {
    //   setState(() {
    //     //isLoading = true;
    //     Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => const Home2()));
    //   });
    SharedPreferences prefs = await SharedPreferences.getInstance(); //{
    prefs.setBool('isUser', true); //setString('email', _email.text);
    //   prefs.setString('email', _email.text);
    //   prefs.setString('password', _password.text);
    //   Navigator.of(context).pushReplacementNamed(Home.routeName);
    // });
    Future.delayed(Duration(seconds: 1), () {
      if (_email.text == 'soyaa' && _password.text == '1233') {
        //DummyData.data.password
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home2()));
      }
    });
    // if (_email.text != DummyData.data && _password.text != DummyData.data) {
    //   print('data salah');
    // }
  }
}
