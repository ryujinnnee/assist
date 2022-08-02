// import 'package:clone_tinder/tinder_button.dart';
import 'package:chat/google/gugelLog.dart';
import 'package:chat/model/log/btn_login.dart';
import 'package:chat/page/ui/common/my_colors.dart';
import 'package:chat/theme/colorplt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:provider/provider.dart';

class Teste extends StatefulWidget {
  const Teste({Key? key}) : super(key: key);

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  @override
  void initState() {
    super.initState();
    // cekLogin();
    AlertController.onTabListener(
        (Map<String, dynamic>? payload, TypeAlert type) {
      print("$payload - $type");
    });
  }

  @override
  Widget build(BuildContext context) {
    // final ImageProvider _imageProvider;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    //Gradiente

                    Container(
                      // margin: const EdgeInsets.all(10),
                      // padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      // height: 1024,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            // Colors.red.shade400,
                            // Colors.pink,
                            MyColors.ping,
                            MyColors.ping2,
                            MyColors.ping3,
                            // Colors.pinkAccent.shade400,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 620),
                      child: Image.asset(
                        'assets/img/tinder_logo.png',
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                        color: putih2,
                        scale: 1.3,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'By clicking Log in, you agree with our Terms. Learn how we process your data in our Privacy Policy and Cookies Policy.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          //Botão google

                           LoginButton(
                            texto: 'LOG IN WITH GOOGLE',
                            imagem: AssetImage('assets/img/google.png'),
                            cor: MyColors.blackText,
                            onPressed: () {
                              final provider = Provider.of<GoogleSignInprovider>(
                                context,
                                listen: false);
                            provider.googLogin();
                            },
                            // background: MyColors.white,
                            // key: Key('google'),
                            // icon: Icons.account_circle,
                          ),

                          //Espaçador
                          const SizedBox(
                            height: 15,
                          ),
                          LoginButton(
                              texto: 'LOG IN WITH FACEBOOK',
                              imagem: const AssetImage(
                                  'assets/img/facebook.png'),
                              cor: MyColors.blackText,),
                          //Espaçador
                          const SizedBox(
                            height: 15,
                          ),
                          //Botão número
                           LoginButton(
                            texto: 'LOG IN WITH YOUR PHONE',
                            imagem: AssetImage('assets/img/chats.png'),
                            cor: MyColors.blackText,
                          ),
                          // Espaçador
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Trouble logging in?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}