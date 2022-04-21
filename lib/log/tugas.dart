import 'package:flutter/material.dart';

import '../page/notip.dart';

class Tugass extends StatefulWidget {
  const Tugass({Key? key}) : super(key: key);
  static const routeName = '/tugas';

  @override
  State<Tugass> createState() => _TugassState();
}

class _TugassState extends State<Tugass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: primary,
        title: const Text('Tugas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Notip(),
                ),
              );
            },
          ),
        ],
      ),
      body:  Container(
      color: Colors.grey[200],
      child: ListView.builder(
        itemCount: 9,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: 140,
                  //color: Colors.blue[200],
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      // borderRadius: BorderRadius.circular(20),
                      colors: [
                        Colors.blue,
                        Colors.purple,
                        // Colors.blueAccent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'GKB IV',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Pemrograman Mobile',
                        //'Instalasi Flutter, Dart, Widget',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w100,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            height: 25,
                            width: 110,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 248, 81, 30),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: const Text(
                              //data.getGrade),
                              'Dosen ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            height: 25,
                            width: 110,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: const Text(
                              '09.00 - 10.00',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                                color: Color.fromARGB(255, 104, 102, 102),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //const SizedBox(height: 20),
                    ],
                  ),
                ),
                
              ],
            ),
          );
        },
      ),
    ),
    );
  }
}
