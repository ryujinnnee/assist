import 'package:chat/home.dart';
import 'package:chat/home2.dart';
import 'package:chat/log/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
          margin: const EdgeInsets.all(20),
          child: isLoading
              ? const Center(
                  child: Icon(Icons.punch_clock),
                )
              : Column(
                  children: <Widget>[
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
                        // Navigator.of(context).pushNamed('/home');
                        _login();
                      },
                    ),
                  ],
                )),
    );
  }

  void _login() async {
    if (_email.text.isNotEmpty || _password.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      SharedPreferences prefs = await SharedPreferences.getInstance(); //{
      prefs.setBool('isUser', true); //setString('email', _email.text);
      //   prefs.setString('email', _email.text);
      //   prefs.setString('password', _password.text);
      //   Navigator.of(context).pushReplacementNamed(Home.routeName);
      // });
      Future.delayed(Duration(seconds: 2), () {
        if (_email.text == 'admin@a.com' && _password.text == '1233') {
          //DummyData.data.password
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Home2()));
        }
      });
    }
  }
}
