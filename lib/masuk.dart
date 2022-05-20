import 'package:chat/home.dart';
import 'package:chat/home2.dart';
import 'package:chat/hompeg.dart';
import 'package:chat/log/dummy_data.dart';
import 'package:chat/log/tugas.dart';
import 'package:chat/loginn.dart';
import 'package:chat/page/addjadwal.dart';
import 'package:chat/page/do.dart';
import 'package:chat/page/inJadwal.dart';
import 'package:chat/page/notip.dart';
import 'package:chat/page/setting.dart';
import 'package:chat/page/todo.dart';
// import 'package:chat/model/alert_controller.dart';
// import 'package:chat/model/data_alert.dart';
import 'package:chat/theme/colorplt.dart';
//import 'package:chat/log/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';

// class Masuk2 extends StatefulWidget {
//   const Masuk2({Key? key}) : super(key: key);

//   @override
//   State<Masuk2> createState() => _Masuk2State();
// }

// class _Masuk2State extends State<Masuk2> {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Login',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       builder: (context, child) => Stack(
//         children: [child!, const DropdownAlert()],
//       ),
//       home: const Masuk(),
//       routes: {
//         //   "/home": (context) => const Home(),
//         //    "/setting": (context) => const Setting(),
//         // "/jadwal": (context) => const Jadwal(),
//         // "/addjadwal": (context) => const Addjadwal(),
//         // "/injadwal": (context) => const Jadwal(),
//         // "/todo": (context) => const Todo(),
//         Home.routeName: (context) => const Home(),
//         Setting.routeName: (contex) => const Setting(),
//         Addjadwal.routeName: (context) => const Addjadwal(),
//         Jadwal.routeName: (context) => const Jadwal(),
//         Todo.routeName: (context) => const Todo(),
//         Do.routeName: (context) => const Do(),
//         Notip.routeName: (context) => const Notip(),
//         Tugass.routeName: (context) => const Tugass(),
//       },
//     );
//   }
// }

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

  final snackBar = SnackBar(
    content: const Text('Yeay Login Berhasil:)'),
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
  final snackBarF = SnackBar(
    content: const Text('Yah Login gagal '),
    action: SnackBarAction(
      label: ':(',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
  void _success() {
    Map<String, dynamic> payload = new Map<String, dynamic>();
    payload["data"] = "content";
    AlertController.show(
        "Success", "Success message here!", TypeAlert.success, payload);
  }

  void _warning() {
    AlertController.show("Warn!", "Warning message here!", TypeAlert.warning);
  }

  void _error() {
    AlertController.show("Error", "Error message here!", TypeAlert.error);
  }

  @override
  void initState() {
    super.initState();
    cekLogin();
    AlertController.onTabListener(
        (Map<String, dynamic>? payload, TypeAlert type) {
      print("$payload - $type");
    });
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
      backgroundColor: Colors.grey[200],
      // appBar: AppBar(
      //   title: const Text(" Login"),
      //   backgroundColor: primary,
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.exit_to_app),
      //       onPressed: () {
      //         // logindata.setBool('login', false);
      //         Navigator.pushReplacement(
      //             context, new MaterialPageRoute(builder: (context) => Loggin()));
      //       },

      //     ),
      //     IconButton(
      //         icon: Icon(Icons.check),
      //         onPressed: _success,
      //       ),
      //   ],
      // ),
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.white,
            width: 350, //MediaQuery.of(context).size.width * 0.7,
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // const DropdownAlert(),
                const Padding(padding: EdgeInsets.all(20)),
                CircleAvatar(
                  radius: 35,
                  backgroundColor: primary,
                  child: Image.asset('assets/icon/jisoo.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Login to Continue",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: User_controller,
                    decoration: const InputDecoration(
                      // icon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: 'username',
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: Icon(Icons.star_border),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: Pass_controller,
                    obscureText: true,
                    // expands: true,
                    // obscuringCharacter: '*',
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.key_off),
                      labelText: 'Password',
                      // secureTextEntry: true,
                    ),
                  ),
                ),
                // RaisedButton(
                //   textColor: Colors.white,
                //   color: Colors.blue,
                //   onPressed: () {
                //     String username = User_controller.text;
                //     String password = Pass_controller.text;
                //     // if (username == DummyData.data && password == DummyData.data ) {
                //     //   print('Successfull');
                //     //   logindata.setBool('login', false);
                //     //   logindata.setString('username', username);
                //     //   Navigator.push(context,
                //     //       MaterialPageRoute(builder: (context) => MyDashboard()));
                //     // }
                //     for (var data in dummyData) {
                //       if (data['username'] == username &&
                //           data['password'] == password) {
                //         print('Successfull');
                //         logindata.setBool('login', false);
                //         logindata.setString('username', username);
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => const MyDashboard()));
                //       } else {
                //         print('Failed');
                //       }
                //     }
                //   },
                //   child: Text('Login'),
                // ),
                SizedBox(
                  height: 35,
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: primary,
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      String username = User_controller.text;
                      String password = Pass_controller.text;
                      // _success;
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
                          snackBar;
                          // _success();
                          logindata.setBool('login', false);
                          logindata.setString('username', username);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyDashboard()));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          // break;
                          return;
                        } else {
                          print('Failed');
                          // snackBarF;
                          // ScaffoldMessenger.of(context).showSnackBar(snackBarF);
                          // // _error();
                          // // _success(); , _error();
                          // // break;
                          // return;
                        }
                      }
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                    ),
                  ),
                ),
                // const DropdownAlert(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
