

import 'package:chat/theme/colorplt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInprovider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future googLogin() async {
    // try{
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
      _user = googleUser;
      

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    // }catch (e) {
    //   print(e.toString());
    // }
      notifyListeners();
    }

    Future logout() async {
      await googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();
      // _user = null;
      // notifyListeners();
    }
  }
