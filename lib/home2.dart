import 'package:flutter/material.dart';

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  bool _switch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home2'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              //  Navigator.of(context).pushNamed('/notip');
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('selamat datang'),
          Text('pilih tema'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('light'),
              SizedBox(height: 10),
              Switch(
                value: _switch,
                onChanged: (val) {},
              ),
              Text('dark'),
            ],
          )
        ],
      ),
    );
  }
}
