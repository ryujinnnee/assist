// import 'package:chat/log/login.dart';
// import 'package:chat/splash.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Home2 extends StatefulWidget {
//   const Home2({Key? key}) : super(key: key);

//   @override
//   State<Home2> createState() => _Home2State();
// }

// class _Home2State extends State<Home2> {
//   late SharedPreferences logindata;
//   late String username;
//   final bool _switch = false;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     initial();
//   }
//   void initial() async {
//     logindata = await SharedPreferences.getInstance();
//     setState(() {
//       username = logindata.getString('username')!;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home2'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//              onPressed: _logOut,//(){} ,  //_logOut,
//           ),
//         ],
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('selamat datang, $username'),
//           Text('pilih tema'),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('light'),
//               SizedBox(height: 10),
//               Switch(
//                 value: _switch,
//                 onChanged: (val) {},
//               ),
//               Text('dark'),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   void _logOut() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     pref.remove("isUser");
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => const Splash()));
//   //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => const Login()));
//   }

  
// }
