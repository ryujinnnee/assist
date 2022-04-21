import 'package:chat/log/data.dart';
import 'package:chat/log/item_wid.dart';
import 'package:flutter/material.dart';

import '../page/notip.dart';

class Tugas2 extends StatefulWidget {
  const Tugas2({Key? key}) : super(key: key);

  @override
  State<Tugas2> createState() => _Tugas2State();
}

class _Tugas2State extends State<Tugas2> {
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(5, (index) => Data.items[0]);

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.grey[200],
        title: const Text('Tugas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.of(context).pushNamed(Notip.routeName);
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,//Data.items.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index]//Data.items[index],
            );
          },
        ),
      ),
    );
  }
}
