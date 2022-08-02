import 'dart:math';

import 'package:chat/theme/colorplt.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'tudu.dart';

class Addnote extends StatefulWidget {
  const Addnote({Key? key}) : super(key: key);

  @override
  State<Addnote> createState() => _AddnoteState();
}

class _AddnoteState extends State<Addnote> {
 TextEditingController second = TextEditingController();

  TextEditingController third = TextEditingController();

  final fb = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    var rng = Random();
    var k = rng.nextInt(10000);

    final ref = fb.ref().child('todos/$k');

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todos"),
        backgroundColor: primary,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              controller: second,
              decoration: InputDecoration(
                hintText: 'title',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10 , top: 5),
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              controller: third,
              decoration: InputDecoration(
                hintText: 'sub title',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            color: primary,
            onPressed: () {
              ref.set({
                "title": second.text,
                "subtitle": third.text,
              }).asStream();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Tuwduh()));
            },
            child: Text(
              "save",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}