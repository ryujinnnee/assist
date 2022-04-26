// ignore: file_names
import 'package:chat/home.dart';
// import 'package:chat/page/addjadwal.dart';
import 'package:chat/page/do.dart';
import 'package:chat/page/notip.dart';
import 'package:chat/page/setting.dart';
import 'package:chat/theme/colorplt.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Jadwal extends StatefulWidget {
  static const routeName = '/jadwal';
  const Jadwal({Key? key}) : super(key: key);

  @override
  _JadwalState createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: const Text('Jadwall'),
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
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  color: Colors.grey,
                  child: const Center(child: Text('Senin')),
                ),
                SizedBox(width: 20),
                Container(
                  width: 120,
                  height: 120,
                  color: Colors.grey,
                  child: const Center(child: Text('Selasa')),
                ),
                
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               // SizedBox(height: 20),
                Container(
                  width: 120,
                  height: 120,
                  color: Colors.grey,
                  child: const Center(child: Text('Rabu')),
                ),
             //   SizedBox(height: 20),
                Container(
                  width: 120,
                  height: 120,
                  color: Colors.grey,
                  child: const Center(child: Text('Kamis')),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  color: Colors.grey,
                  child: const Center(child: Text('Jumat')),
                ),
                Container(
                  width: 120,
                  height: 120,
                  color: Colors.grey,
                  child: const Center(child: Text('Sabtu')),
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 30),
                Container(
                  width: 120,
                  height: 120,
                  color: Colors.grey,
                  child: const Center(child: Text('Minggu')),
                ),
              ],
            )
          ],
        ),
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
              // Row(
              //   size
              // ),
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
