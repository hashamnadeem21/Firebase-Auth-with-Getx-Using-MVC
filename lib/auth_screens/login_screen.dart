import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:signuploginfirebase/auth_screens/signup_screen.dart';
import 'package:signuploginfirebase/controllers/auth_controller.dart';
import 'package:signuploginfirebase/utils/color_constants.dart';
import 'package:signuploginfirebase/utils/image_constants.dart';
import 'package:signuploginfirebase/widgets/buttons.dart';

import '../widgets/dividers.dart';
import '../widgets/signup_textbutton.dart';

// LoginPage is a StatelessWidget that displays a login form and buttons to login or navigate to the signup page.
class LoginPage extends StatelessWidget {
// The TextEditingController's are used to manage the text in the TextFormFields.
  var email = TextEditingController();
  var password = TextEditingController();
// The name and username controllers are not used in this code snippet.
  var name = TextEditingController();
  var username = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
// AppBar with title "Login"
        child: Padding(
// Padding for the entire column
      padding: const EdgeInsets.all(48),
      child: Column(
// Align the children of the column to the center
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextField(
            Secure: false,
              controller: email,
              label: "Email",
              hintText: "Enter Your Email",
              icon: Icons.email_outlined,
              action: TextInputAction.next),
          CustomTextField(
            Secure: true,
              controller: password,
              label: "Password",
              hintText: "Enter Your Password",
              icon: Icons.password,
              action: TextInputAction.done),
// Login button that calls the login method in the AuthController with the email and password text
          Custom_Button(
              label: "Login",
              backgroundcolor: ColorConstants.MainColor,
              textcolor: Colors.white,
              function: () {
                AuthController.instance
                    .Login(email.text.toString(), password.text.toString());
              }),

          const Dividers(),
// Signup button that navigates to the SignUp page
          SignUpText(function: () {
            Get.to(SignUp());
          }),
        ],
      ),
    ));
  }
}
