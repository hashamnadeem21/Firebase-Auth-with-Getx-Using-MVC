import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:signuploginfirebase/auth_screens/home_screen.dart';
import 'package:signuploginfirebase/auth_screens/login_screen.dart';
import 'package:signuploginfirebase/utils/image_constants.dart';

import '../utils/color_constants.dart';
import '../widgets/logo.dart';

class MainLogin extends StatelessWidget {
  const MainLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:const Text("") , backgroundColor: Colors.black26),
        
        
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const Logo(),
                Center(child: SvgPicture.asset(ImageConstants.LoginPagePic)),
                LoginPage()
              ],
    ),
            ),
          ),
    );
  }
}
