import 'package:chat/google/Logged.dart';
import 'package:chat/google/signup_widget.dart';
import 'package:chat/hompeg.dart';
import 'package:chat/masuk.dart';
import 'package:chat/page/ui/ui/screens/beranda.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CtrlLog extends StatelessWidget {
  const CtrlLog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return const BerandaUI(); //MyDashboard(); //LoggedInWidget();
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error'));
            } else {
              return const Masuk(); //SignupWidget
            }
          }));
}
