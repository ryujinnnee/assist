import 'package:carousel_slider/carousel_slider.dart';
import 'package:chat/home.dart';
import 'package:chat/hompeg.dart';
import 'package:chat/page/inJadwal.dart';
import 'package:chat/page/setting.dart';
import 'package:chat/page/todo.dart';
import 'package:chat/theme/colorplt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat/page/ui/common/my_colors.dart';
import 'package:chat/page/ui/common/my_font_size.dart';
import 'package:chat/page/ui/common/my_style.dart';
import 'package:chat/page/ui/ui/widgets/card_goclub.dart';
import 'package:chat/page/ui/ui/widgets/card_info.dart';
import 'package:chat/page/ui/ui/widgets/custom_button_icon.dart';
import 'package:chat/page/ui/ui/widgets/custom_card.dart';
import 'package:chat/page/ui/ui/widgets/nav_bottom.dart';
import 'package:chat/page/ui/ui/widgets/subtitle.dart';
import 'package:chat/page/ui/ui/widgets/scroll_brush.dart';

class BerandaUI extends StatefulWidget {
  static const routeName = '/berandaui';
  const BerandaUI({Key? key}) : super(key: key);

  @override
  _BerandaUIState createState() => _BerandaUIState();
}

class _BerandaUIState extends State<BerandaUI> {
  final _scrollController = ScrollController();

  List<bool> tabBarBadgeList = [
    false,
    false,
    false,
    true,
  ];
  final tabBarList2 = [
    Home(),
    Jadwal(),
    Todo(),
    Setting(),
  ];
  List tabBarList = [
    "Beranda",
    "Promo",
    "Pesanan",
    "Chat",
  ];

  int tabBarIndex = 0;

  int balanceBalance = 0;

  bool isBrush = false;

  bool isCollapseNavBottom = true;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 0) {
        isBrush = true;
        setState(() {});
      } else {
        isBrush = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    final List<String> imgSlider = [
      'goo.png',
      //'fashion.jpg',
      'food.jpg',
      'elektronik.jpeg',
      'goo.png',
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
              width: 350,
              height: 100,
              fit: BoxFit.fitWidth,
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

    Widget tabBarItem(int index) {
      return Expanded(
        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.all(5),
                height: double.infinity,
                decoration: BoxDecoration(
                    color: (tabBarIndex == index)
                        ? MyColors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(100)),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      tabBarIndex = index;
                    });
                  },
                  child: Center(
                    child: Text(
                      tabBarList[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: (tabBarIndex == index)
                              ? MyColors.darkOren
                              : MyColors.white,
                          fontSize: MyFontSize.medium1,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
            if (tabBarBadgeList[index])
              Align(
                alignment: Alignment.topRight,
                child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: MyColors.red,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 1.5, color: MyColors.white)),
                    child: Center(
                      child: Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    )),
              )
          ],
        ),
      );
    }

    Widget tabBar() {
      return Container(
        margin: EdgeInsets.only(bottom: 15),
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            color: MyColors.darkOren, borderRadius: BorderRadius.circular(100)),
        child: Row(
          children: [
            tabBarItem(0),
            tabBarItem(1),
            tabBarItem(2),
            tabBarItem(3),
          ],
        ),
      );
    }

    Widget searchBox() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  decoration: BoxDecoration(
                      color: MyColors.whiteL2,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 1.5, color: MyColors.softGrey)),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: MyColors.blackText, size: 40),
                      SizedBox(width: 10),
                      Expanded(
                          child: Text(
                        "Cari layanan, makanan, & tujuan",
                        style: TextStyle(
                            color: MyColors.grey, fontSize: MyFontSize.medium2),
                      ))
                    ],
                  )),
            ),
            SizedBox(width: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: Image.network(
                user.photoURL!,
                height: 55,
                width: 55,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      );
    }

    Widget balance() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 130,
          decoration: BoxDecoration(
              color: primary, borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    2,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                      height: 16,
                      width: 4,
                      decoration: BoxDecoration(
                          color: (balanceBalance == index)
                              ? MyColors.white
                              : MyColors.darkOren,
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 90,
                width: 150,
                decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'hi ${user.displayName}',
                          style: TextStyle(
                            color: MyColors.blackText,
                            fontSize: MyFontSize.large1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Saldo masih kosong",
                      style: TextStyle(
                        color: MyColors.blackText,
                        fontSize: MyFontSize.medium1,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Klik buat isi",
                      style: TextStyle(
                        color: MyColors.oren,
                        fontSize: MyFontSize.medium1,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: CustomButtonIcon(
                  action: () {
                    MyDashboard();
                  },
                  iconPath: "assets/images/ic_bayar.png",
                  text: "Bayar",
                  fontColor: MyColors.white,
                  height: 33,
                  width: 33,
                  isBold: true,
                ),
              ),
              Expanded(
                child: IconButton(
                  // action: () {},
                  // iconPath: "assets/images/ic_topup.png",
                  // text: "Top Up",
                  // fontColor: MyColors.white,
                  // height: 33,
                  // width: 33,
                  // isBold: true,
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(Home.routeName);
                  },
                  icon: Image.asset("assets/images/ic_eksplor.png"),
                  iconSize: 33,
                ),
              ),
              Expanded(
                child: CustomButtonIcon(
                  action: () {
                    Navigator.of(context).pop(Home.routeName);
                  },
                  iconPath: "assets/images/ic_eksplor.png",
                  text: "Eksplor",
                  fontColor: MyColors.white,
                  height: 33,
                  width: 33,
                  isBold: true,
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: primary,//MyColors.oren, //primary,//MyColors.green,
        title: tabBar(),
      ),
      body: Stack(
        children: [
          ListView(
            controller: _scrollController,
            children: [
              SizedBox(height: 20),
              searchBox(),
              SizedBox(height: 20),
              balance(),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CardGoClub(),
              ),
              SizedBox(height: 20),
              autoPlayImage,
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Subtitle(
                    iconPath: "assets/images/ic_indoshop.png",
                    iconText: "IndoPayBefore",
                    subtitle: "Pake IndoPayBefore di Tokopedia",
                    caption:
                        "Belanja & nikmati beragam promo cashback istimewa hingga Rp 1.7 juta untuk-mu~"),
              ),
              AspectRatio(
                aspectRatio: 1 / 1,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      5,
                      (index) => const CardInfo(
                            imageUrl:
                                "https://lelogama.go-jek.com/post_thumbnail/tunjangan-hari-raya-CWJ.jpg",
                            title: "Hadiah dari IndoJek buat perjalananmu!",
                            caption:
                                "Nikmatin perjalanan aman dan hemat naik IndoJek/IndoCar. Diskon sampai Rp 76.000 pake kode INDOMERDEKA. Klik!",
                          )),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Subtitle(
                  iconPath: "assets/images/ic_indoride.png",
                  iconText: "IndoJek",
                  subtitle: "Promo merdeka buat kamu",
                  caption:
                      "Ada diskon dari IndoJek/IndoCar, paket hemat IndoSend Instant, dan diskon IndoPay di sini!",
                  prefWidget: CustomCard(
                      onTap: () {},
                      padding: EdgeInsets.zero,
                      bgColor: MyColors.softGreen,
                      shadow: false,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text("Lihat Semua",
                            style: TextStyle(
                                color: MyColors.darkGreen,
                                fontSize: MyFontSize.medium2,
                                fontWeight: FontWeight.bold)),
                      )),
                ),
              ),
              AspectRatio(
                aspectRatio: 1 / 1,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      5,
                      (index) => const CardInfo(
                            imageUrl:
                                "https://d1o6t6wdv45461.cloudfront.net/s4/fm/139/newsletter/www.go-jek.com.jpg",
                            title: "Bongkar rahasia penjualan barang murah",
                            caption:
                                "Nikmatin perjalanan aman dan hemat naik IndoJek/IndoCar. Diskon sampai Rp 76.000 pake kode INDOMERDEKA. Klik!",
                          )),
                ),
              ),
              SizedBox(height: 120),
            ],
          ),
          if (isBrush)
            Align(alignment: Alignment.topCenter, child: ScrollBrush()),
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
    );
  }
}
