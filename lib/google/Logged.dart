import 'package:chat/google/gugelLog.dart';
import 'package:chat/page/ui/ui/widgets/nav_bottom.dart';
import 'package:chat/page/ui/ui/widgets/scroll_brush.dart';
import 'package:chat/splash.dart';
import 'package:chat/theme/colorplt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggedInWidget extends StatefulWidget {
  static const routeName = '/logged';
  const LoggedInWidget({Key? key}) : super(key: key);

  @override
  State<LoggedInWidget> createState() => _LoggedInWidgetState();
}

class _LoggedInWidgetState extends State<LoggedInWidget> {
  bool isBrush = false;

  bool isCollapseNavBottom = true;
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
            onPressed: () async {
              // FirebaseAuth.instance.signOut();
              final provider =
                  Provider.of<GoogleSignInprovider>(context, listen: false);
              provider.logout();
              final prefs = await SharedPreferences.getInstance();
                              prefs.setBool('showboarding', false);
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
            SizedBox(height: 76,),
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
            const SizedBox(height: 350),
            if (isBrush)
            const Align(alignment: Alignment.topCenter, child: ScrollBrush()),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
                onPanUpdate: (details) {
                  if (details.delta.dy < 0) {
                    isCollapseNavBottom = false;
                    setState(() {});
                  }

                  if (details.delta.dy > 0) {
                    isCollapseNavBottom = true;
                    setState(() {});
                  }
                },
                child: NavBottom(
                  isCollapse: isCollapseNavBottom,
                )),
          ),
          ],
        ),
      ),
    );
  }
}
