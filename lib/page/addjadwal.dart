// import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class Addjadwal extends StatefulWidget {
  static const routeName = '/addjadwal';
  const Addjadwal({Key? key}) : super(key: key);

  @override
  _AddjadwalState createState() => _AddjadwalState();
}
  
class _AddjadwalState extends State<Addjadwal> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('tambah jadwal'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             // AvatarGlow(child: child, endRadius: endRadius)
              // const TextField(
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: 'Matkul',
              //   ),
              // ),
              // const SizedBox(height: 20),
              // const TextField(
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: 'Nama dosen',
              //   ),
              // ),
              // const SizedBox(height: 20),
              // const TextField(
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: 'Ruangan',
              //   ),
              // ),
              // const SizedBox(height: 20),
              // const TextField(
              //   textInputAction: TextInputAction.done,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: 'Hari',
              //   ),
              // ),
              // const SizedBox(height: 20),
              // const TextField(
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: 'Jam',
              //   ),
              // ),
              
              // const SizedBox(height: 20),
              // RaisedButton(
              //   onPressed: () {},
              //   child: const Text('Tambah'),
              // ),
              // TextField(
              //   onChanged: (value),
              //   controller: controller,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: 'Matkul',
              //   ),
              // ),
            ],
            
          ),
        ),
      ),
    );
  }
}
  
