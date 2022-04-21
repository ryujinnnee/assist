import 'package:carousel_slider/carousel_slider.dart';
import 'package:chat/page/addjadwal.dart';
import 'package:chat/page/do.dart';
import 'package:chat/page/inJadwal.dart';
import 'package:chat/page/notip.dart';
import 'package:chat/page/setting.dart';
import 'package:chat/page/todo.dart';
import 'package:chat/theme/colorplt.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = {
      const Home(),
      const Jadwal(),
      const Todo(),
      const Setting(),
    };


     final List<String> imgSlider = [
    'elektronik.jpeg',
    'fashion.jpg',
    'food.jpg',
    'rendang.jpg',
    'sport.jpg'
  ];
  final CarouselSlider autoPlayImage = CarouselSlider(
    items: imgSlider.map((fileImage) {
      return Container(
        margin: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            'assets/slider/${fileImage}',
            width: 500,
            fit: BoxFit.cover,
          ),
        ),
      );
    }).toList(),
    options: CarouselOptions(
      autoPlay: true,
      aspectRatio: 2.0,
      enlargeCenterPage: true,
      viewportFraction: 0.9,
      initialPage: 0,
    ),
  );  

    return Scaffold(
     // backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        title: const Text('Assist'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.of(context).pushNamed(Notip.routeName);
            },
          ),
        ],
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
      body: Container(
        padding: const EdgeInsets.all(20),
        // margin: const EdgeInsets.all(30),
        color: Coll.abuu,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hari ini',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Minggu, 27 Maret 2022',
              style: TextStyle(
                fontSize: 17,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
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
                          borderRadius: BorderRadius.all(Radius.circular(15)),
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
                          borderRadius: BorderRadius.all(Radius.circular(15)),
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
            const SizedBox(height: 15),
            //   ====>                    batas suci                          <========    ////
            const Text(
              'Jadwal Selanjutnya',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w200,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 120,
              //color: Colors.blue[200],
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
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
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 17,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  const SizedBox(height: 15),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Pemrograman Web',
                        //'Instalasi Flutter, Dart, Widget',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w100,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        height: 25,
                        width: 40,
                        decoration: const BoxDecoration(
                          //color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          gradient: LinearGradient(
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
                        child: const Text(
                          '19.00',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w100,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //const SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(height: 15),
            autoPlayImage,
            // const SizedBox(height: 35),
            // Container(
            //   height: 65,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(40), color: Colors.white),
            //   padding: const EdgeInsets.all(20),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
                  //const SizedBox(height: 20),
                  
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     const Icon(
                  //       Icons.list,
                  //       color: Color.fromARGB(255, 0, 0, 0),
                  //       size: 15,
                  //     ),
                  //     const Text(
                  //       'Membuat Mind Map',
                  //       //'Instalasi Flutter, Dart, Widget',
                  //       textAlign: TextAlign.left,
                  //       style: TextStyle(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w100,
                  //         color: Color.fromARGB(255, 0, 0, 0),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 97),
                  //     Container(
                  //       padding: const EdgeInsets.all(4),
                  //       height: 25,
                  //       //width: 110,
                  //       decoration: const BoxDecoration(
                  //         color: Colors.white12,
                  //         borderRadius: BorderRadius.all(Radius.circular(15)),
                  //       ),
                  //       child: const Icon(
                  //         Icons.playlist_remove,
                  //         color: Color.fromARGB(255, 104, 102, 102),
                  //         size: 20,
                  //       ),
                  //     ),
                  //   ],
                  // ),
            //       //const SizedBox(height: 20),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: const IconThemeData(size: 22.0),
        // this is ignored if animatedIcon is non null
        // child: Icon(Icons.add),
        visible: true,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        tooltip: 'Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        elevation: 6.0,
        shape: const CircleBorder(),
        children: [
          SpeedDialChild(
              child: const Icon(Icons.power_off_outlined),
              backgroundColor: Colors.red,
              label: 'Jadwal',
              // labelStyle: TextTheme(fontSize: 18.0),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Jadwal()),
                );
              }),
          SpeedDialChild(
            child: const Icon(Icons.brush),
            backgroundColor: Colors.blue,
            label: 'Todo',
            //  labelStyle: TextTheme(fontSize: 18.0),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Do()), //Todo()),
            ),
          ),
          SpeedDialChild(
            child: const Icon(Icons.keyboard_voice),
            backgroundColor: Colors.green,
            label: 'setting',
            //   labelStyle: TextTheme(fontSize: 18.0),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Setting()),
            ),
          ),
          SpeedDialChild(
            child: const Icon(Icons.keyboard_voice),
            backgroundColor: Colors.green,
            label: 'setting',
            //   labelStyle: TextTheme(fontSize: 18.0),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Addjadwal()),
            ),
          ),
        ],
      ),
    );
  }
}
