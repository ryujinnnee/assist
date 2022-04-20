import 'package:chat/page/setting.dart';
import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  static const routeName = '/todo';
  const Todo({Key? key}) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon:  Image.asset('assets/icon/bike.png'),
            onPressed: () {
              Navigator.of(context).pushNamed(Setting.routeName);
            },
          ),
        ],
        title: const Text('Todo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 65,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.list,
                          color: Color.fromARGB(255, 0, 0, 0),
                          size: 15,
                        ),
                        const Text(
                          'Membuat Mind Map',
                          //'Instalasi Flutter, Dart, Widget',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w100,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        const SizedBox(width: 97),
                        Container(
                          padding: const EdgeInsets.all(4),
                          height: 25,
                          //width: 110,
                          decoration: const BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: const Icon(
                            Icons.playlist_remove,
                            color: Color.fromARGB(255, 104, 102, 102),
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    //const SizedBox(height: 20)
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 65,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.list,
                          color: Color.fromARGB(255, 0, 0, 0),
                          size: 15,
                        ),
                        const Text(
                          'Membuat Mind Map',
                          //'Instalasi Flutter, Dart, Widget',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w100,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        const SizedBox(width: 97),
                        Container(
                          padding: const EdgeInsets.all(4),
                          height: 25,
                          //width: 110,
                          decoration: const BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: const Icon(
                            Icons.playlist_remove,
                            color: Color.fromARGB(255, 104, 102, 102),
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    //const SizedBox(height: 20)
                  ],
                ),
              ),
              
              const SizedBox(height: 50),
              FloatingActionButton(
                  onPressed: () {},
                  child: Image.asset('assets/icon/bike.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
