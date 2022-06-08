import 'package:chat/google/gugelLog.dart';
import 'package:chat/splash.dart';
import 'package:chat/theme/colorplt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  const LoggedInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: const Text('Logged'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // FirebaseAuth.instance.signOut();
              final provider =
                  Provider.of<GoogleSignInprovider>(context, listen: false);
              provider.logout();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (c) => Splash()));
            },
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          // child: Text('Welcome ${user.displayName}'),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('profile'),
            Text('Welcome ${user.displayName}'),
            const SizedBox(height: 30),
            CircleAvatar(
              backgroundImage: NetworkImage(user.photoURL!),
              radius: 40,
            ),
            SizedBox(height: 8),
            Text(
              user.displayName!,
              style: TextStyle(fontSize: 14),
            ),
            Text(
              user.email!,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
