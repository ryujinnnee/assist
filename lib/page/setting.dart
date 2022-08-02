import 'package:avatar_glow/avatar_glow.dart';
import 'package:chat/RestApi/home_res.dart';
import 'package:chat/google/Logged.dart';
import 'package:chat/home.dart';
import 'package:chat/hompeg.dart';
import 'package:chat/model/log/loginpek.dart';
// import 'package:chat/model/screen/welcome.dart';
// import 'package:chat/page/addjadwal.dart';
import 'package:chat/page/do.dart';
import 'package:chat/page/inJadwal.dart';
import 'package:chat/page/notip.dart';
import 'package:chat/page/ui/common/my_colors.dart';
import 'package:chat/page/ui/ui/widgets/nav_bottom.dart';
import 'package:chat/page/ui/ui/widgets/scroll_brush.dart';
import 'package:chat/res/main_page.dart';
import 'package:chat/splash.dart';
import 'package:chat/theme/colorplt.dart';
import 'package:chat/update/screens/home_todo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  static const routeName = '/setting';
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  late SharedPreferences logindata;
  late String username;
  late String nama;

  final snackBar = SnackBar(
    content: const Text('Tema Diubah'),
    // backgroundColor: Colors.transparent,
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
  final snackOut = SnackBar(
    content: const Text('Berhasil Menambah'),
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
      // nama = logindata.getString('nama')!;
    });
  }
  int balanceBalance = 0;

  bool isBrush = false;

  bool isCollapseNavBottom = true;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: abuw1,
      appBar: AppBar(
        backgroundColor: primary,
        title: const Text('Setting', textAlign: TextAlign.center),
        actions: [
          IconButton(
            icon: Icon(Icons.people),
            onPressed: () {
              // Navigator.of(context).pushNamed(Home.routeName);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (c) => const LoggedInWidget()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            // onPressed: _logOut,
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (c) => const HomeScreen()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.api),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (c) => const HomeRes()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (c) => const MainPageRes()));
            },
          ),
        ],
      ),
      // bottomNavigationBar: GlassmorphicContainer(
      //   width: double.infinity,
      //   height: 65,
      //   // borderRadius: borderRadius.c(30),
      //   linearGradient: LinearGradient(
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //     colors: [
      //       Constants.kWhiteColor.withOpacity(0.1),
      //       Constants.kWhiteColor.withOpacity(0.1),
      //     ],
      //   ),
      //   blur: 30,
      //   borderGradient: const LinearGradient(
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //     colors: [
      //       Constants.kPinkColor,
      //       Constants.kGreenColor,
      //     ],
      //   ),
      //   borderRadius: 0, border: 0,
      //   child: BottomAppBar(
      //     color: Colors.transparent,
      //     notchMargin: 4,
      //     elevation: 0,
      //     child: Row(
      //       //padding: const EdgeInsets.symmetric(horizontal: 20),
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       //crossAxisAlignment: CrossAxisAlignment.end,
      //       children: [
      //         //SizedBox(width: 20),
      //         Expanded(
      //           child: IconButton(
      //             onPressed: () {
      //               Navigator.of(context).pushNamed(Home.routeName);
      //             },
      //             icon: Image.asset(
      //               'assets/img/modern-home.png',
      //               width: 30,
      //               height: 30,
      //             ),
      //           ),
      //         ),

      //         Expanded(
      //           child: IconButton(
      //             onPressed: () {
      //               Navigator.of(context).pushNamed(Jadwal.routeName);
      //             },
      //             icon: Image.asset(
      //               'assets/img/analytics.png',
      //               semanticLabel: 'Analytics',
      //               width: 30,
      //               height: 30,
      //             ),
      //           ),
      //         ),
      //         Expanded(
      //           child: IconButton(
      //             onPressed: () {
      //               Navigator.of(context).pushNamed(Do.routeName);
      //             },
      //             icon: Image.asset(
      //               'assets/img/writing.png',
      //               width: 30,
      //               height: 30,
      //             ),
      //           ),
      //         ),
      //         Expanded(
      //           child: IconButton(
      //             onPressed: () {
      //               Navigator.of(context).pushNamed(Setting.routeName);
      //             },
      //             // icon: const Icon(
      //             //   Icons.settings,
      //             //   color: Constants.kPinkColor,
      //             // ),
      //             icon: Image.asset(
      //               'assets/img/setting.png',
      //               width: 30,
      //               height: 30,
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AvatarGlow(
              glowColor: Coll.utama,
              endRadius: 90.0,
              duration: const Duration(milliseconds: 2000),
              repeat: true,
              showTwoGlows: true,
              repeatPauseDuration: const Duration(milliseconds: 100),
              child: Material(
                // Replace this child with your own
                elevation: 8.0,
                shape: const CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  child: Image.network(
                    user.photoURL!,
                    // height: 60,
                  ),
                  radius: 40.0,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 88,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: putih2),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                        'dark mode ',
                        //'Instalasi Flutter, Dart, Widget',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      IconButton(
                        icon: Image.asset(
                          'assets/img/theme.png',
                          width: 30,
                          height: 30,
                        ),
                        onPressed: () {
                          if (primary == Colors.orange) {
                            setState(() {
                              abuw1 = Colors.black;
                              putih2 = Colors.grey[500];
                              // dark = Colors.black;
                              primary = Colors.black;
                              Coll.utama = Colors.black;
                              pri = Colors.black;
                              MyColors.ping = Colors.black;
                              MyColors.ping2 = Colors.black;
                              MyColors.ping3 = Colors.black;
                              MyColors.blackText = Colors.white;
                              MyColors.white = Colors.black;
                              // Color.fromARGB(255, 201, 79, 120) = Colors.black;
                            });
                          } else {
                            setState(() {
                              abuw1 = Colors.grey[200];
                              putih2 = Colors.white;
                              // dark = Colors.white10;
                              primary = Colors.orange;
                              Coll.utama = Colors.orange;
                              MyColors.ping = Colors.pink;
                              MyColors.ping2 = Colors.red.shade400;
                              MyColors.ping3 = Colors.pinkAccent.shade400;
                              MyColors.blackText = Colors.black;
                              MyColors.white = Colors.white;
                            });
                          }
                          snackBar;
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      ),
                    ],
                  ),
                  //const SizedBox(height: 20)
                ],
              ),
            ),
            const SizedBox(height: 2),
            Container(
              height: 88,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: putih2),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.settings,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 15,
                      ),
                      const Text(
                        'Pengaturan Akun ',
                        //'Instalasi Flutter, Dart, Widget',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromARGB(255, 104, 102, 102),
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  //const SizedBox(height: 20)
                ],
              ),
            ),
            const SizedBox(height: 2),
            Container(
              height: 88,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: putih2),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.help,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 15,
                      ),
                      const Text(
                        'Pusat Bantuan ',
                        //'Instalasi Flutter, Dart, Widget',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromARGB(255, 104, 102, 102),
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  //const SizedBox(height: 20)
                ],
              ),
            ),
            const SizedBox(height: 2),
            Container(
              height: 88,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: putih2),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.privacy_tip,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 15,
                      ),
                      const Text(
                        'Privasi and Policy ',
                        //'Instalasi Flutter, Dart, Widget',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromARGB(255, 104, 102, 102),
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  //const SizedBox(height: 20)
                ],
              ),
            ),
            const SizedBox(height: 45),
            // Container(
            //   height: 88,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(4), color: putih2),
            //   padding: const EdgeInsets.all(20),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       //const SizedBox(height: 20),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           const Icon(
            //             Icons.remove,
            //             color: Color.fromARGB(255, 0, 0, 0),
            //             size: 15,
            //           ),
            //           const Text(
            //             'Hapus Semua Data ',
            //             //'Instalasi Flutter, Dart, Widget',
            //             textAlign: TextAlign.left,
            //             style: TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.w100,
            //               color: Color.fromARGB(255, 0, 0, 0),
            //             ),
            //           ),
            //           IconButton(
            //             icon: const Icon(
            //               Icons.delete_forever,
            //               color: Color.fromARGB(255, 104, 102, 102),
            //               size: 20,
            //             ),
            //             onPressed: () {},
            //           ),
            //         ],
            //       ),
            //       //const SizedBox(height: 20)
            //     ],
            //   ),
            // ),
            if (isBrush)
            const Align(alignment: Alignment.topCenter, child: ScrollBrush()),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
                onPanUpdate: (details) {
                  if (details.delta.dy < 0) {
                    isCollapseNavBottom = false;
                    setState(() {});
                  }

                  if (details.delta.dy > 0) {
                    isCollapseNavBottom = true;
                    setState(() {});
                  }
                },
                child: NavBottom(
                  isCollapse: isCollapseNavBottom,
                )),
          ),
          ],
        ),
      ),
    );
  }

  void _logOut() async {
    SharedPreferences p = await SharedPreferences.getInstance();
    logindata.setBool('login', true);
    p.remove('logindata');
    dispose();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (c) => Splash()));
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => const Login()));
    snackOut;
    ScaffoldMessenger.of(context).showSnackBar(snackOut);
    
  }
}
