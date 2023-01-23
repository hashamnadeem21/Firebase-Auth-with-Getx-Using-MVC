import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/image_constants.dart';
class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 20),
      child: Container(
        width: 70,
        height: 70,
        child: SvgPicture.asset(ImageConstants.SplashScreenLogo),
        decoration: const BoxDecoration(
        ),
      ),
    );
  }
}
