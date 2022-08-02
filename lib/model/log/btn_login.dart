import 'package:chat/google/gugelLog.dart';
import 'package:chat/page/ui/common/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  final String texto;
  final ImageProvider? imagem;
  final Color? cor;
  final ElevatedButton? icon;
  final Function? onPressed;
  // final TextTheme? background;
  const LoginButton({
    Key? key,
    required this.texto,
    this.imagem,
    this.cor,
    this.icon,
    this.onPressed,
    // this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final provider =
            Provider.of<GoogleSignInprovider>(context, listen: false);
        provider.googLogin();
      },
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(2),
        overlayColor: MaterialStateProperty.all(Colors.black12),
        shadowColor: MaterialStateProperty.all(Colors.pink.shade50),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
        backgroundColor: MaterialStateProperty.all(MyColors.white),
        fixedSize: MaterialStateProperty.all(const Size(412, 60)),
      ),
      child: Row(
        children: [
          ImageIcon(
            imagem,
            size: 13,
            color: cor,
          ),
          const Spacer(),
          Text(
            texto,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 17,
                fontWeight: FontWeight.w500),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
