import 'package:chat/theme/colorplt.dart';
import 'package:flutter/material.dart';

class Notip extends StatelessWidget {
  const Notip({Key? key}) : super(key: key);
  static const routeName = '/notip';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: abuw1,
      appBar: AppBar(
        backgroundColor: primary,
        title: const Text('Notip'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // AvatarGlow(child: child, endRadius: endRadius)
              Text('Belum ada notifikasi nih'),
              
            ],
          ),
        ),
      ),
    );
  }
}