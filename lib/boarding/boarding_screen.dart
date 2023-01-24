import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:signuploginfirebase/auth_screens/login_screen.dart';
import 'package:signuploginfirebase/auth_screens/mainlogin_screen.dart';
import 'package:signuploginfirebase/utils/color_constants.dart';
import '../utils/image_constants.dart';

class Boarding_Screen extends StatelessWidget {
  const Boarding_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const Text(
              "Lets Get Started",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
       const SizedBox(
              height: 12,
            ),
          const Text(
              "Create account and login to see what is happening near you!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
           const  SizedBox(
              height: 45,
            ),
            SvgPicture.asset(ImageConstants.BoardingScreen),
           const SizedBox(
              height: 48,
            ),
            Boarding_Buttons(
                textColor: Colors.white,
                label: "Firebase Login",
                function: () {
                  Get.to(MainLogin());
                },
                backgroundColor: ColorConstants.MainColor),

          ],
        ),
      ),
    );
  }
}

class Boarding_Buttons extends StatelessWidget {
  Boarding_Buttons(
      {Key? key,
      required this.textColor,
      required this.label,
      required this.function,
      required this.backgroundColor})
      : super(key: key);

  String label;
  Color backgroundColor;
  Color textColor;
  VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
                minimumSize: const Size(252, 47),
                maximumSize: const Size(252, 47),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
            onPressed: function,
            child: Text(
              label,
              style: TextStyle(
                  color: textColor, fontSize: 18, fontWeight: FontWeight.w500),
            )),
       const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
