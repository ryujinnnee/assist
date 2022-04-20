//import 'dart:ffi';

import 'package:chat/home.dart';
import 'package:chat/page/addjadwal.dart';
import 'package:chat/page/inJadwal.dart';
import 'package:chat/page/setting.dart';
import 'package:chat/theme/colorplt.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Do extends StatefulWidget {
  static const routeName = '/do';
  const Do({Key? key}) : super(key: key);

  @override
  _DoState createState() => _DoState();
}

class _DoState extends State<Do> {
  List todos = [];
  String input = '';
  @override
  void initState() {
    super.initState();
    todos.add("Test gan");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coll.abuu,
      appBar: AppBar(
      backgroundColor: primary,
        //backgroundColor: utama,
        centerTitle: true,
        title: const Text('do'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.of(context).pushNamed(Addjadwal.routeName);
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Tambah baru"),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          todos.add(input);
                        });
                        Navigator.of(context).pop();
                      },
                      child: const Text("Tambah"),
                    )
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(todos[index]),
            child: Card(
              // color: Colors.white,
              elevation: 4,
              margin: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                title: Text(todos[index]),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      todos.removeAt(index);
                    });
                  },
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: GlassmorphicContainer(
        width: double.infinity,
        height: 65,
       // borderRadius: borderRadius.c(30),
       linearGradient: LinearGradient(
         begin: Alignment.topCenter,
         end: Alignment.bottomCenter,
         colors: [
           Constants.kWhiteColor.withOpacity(0.1),
           Constants.kWhiteColor.withOpacity(0.1),
           
         ],
       ), 
       blur: 30, 
       borderGradient: const LinearGradient(
         begin: Alignment.topCenter,
         end: Alignment.bottomCenter,
         colors: [
           Constants.kPinkColor,
           Constants.kGreenColor,
         ],
       ), 
       borderRadius: 0, border: 0,
       child: BottomAppBar(
         color: Colors.transparent,
         notchMargin: 4,
         elevation: 0,
         child: Row(
           //padding: const EdgeInsets.symmetric(horizontal: 20),
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //SizedBox(width: 20),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Home.routeName);
                  },
                  icon: Image.asset('assets/img/modern-home.png', 
                     width: 30, height: 30,       
                  ),
                  ),
                ),
              
              Expanded(
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Jadwal.routeName);
                  },
                  
                  icon: Image.asset('assets/img/analytics.png', 
                     semanticLabel: 'Analytics',
                     width: 30, height: 30,       
                  ),
                  
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Do.routeName);
                  },
                  icon: Image.asset('assets/img/writing.png', 
                     width: 30, height: 30,       
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Setting.routeName);
                  },
                  // icon: const Icon(
                  //   Icons.settings,
                  //   color: Constants.kPinkColor,
                  // ),
                  icon: Image.asset('assets/img/setting.png', 
                     width: 30, height: 30,       
                  ),
                ),
              ),
            ],
         ),
       ),
      ),
    );
  }
}
