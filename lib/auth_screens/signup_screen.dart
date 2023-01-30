import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:signuploginfirebase/auth_screens/login_screen.dart';
import 'package:signuploginfirebase/auth_screens/mainlogin_screen.dart';
import 'package:signuploginfirebase/extention_function/extension_function_padding.dart';
import 'package:signuploginfirebase/utils/color_constants.dart';
import 'package:signuploginfirebase/utils/image_constants.dart';
import 'package:signuploginfirebase/widgets/buttons.dart';
import '../controllers/auth_controller.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  var email = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();
  var username = TextEditingController();
  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Signup"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 50, left: 50, bottom: 50),
            child: Lottie.asset("images/107800-login-leady.json"),
          ),
          CustomTextField(
            Secure: false,
            controller: name,
            label: "Name",
            hintText: "Enter your Name",
            icon: Icons.person,
            action: TextInputAction.next,
          ),
          CustomTextField(
            Secure: false,
            controller: username,
            label: "Username",
            hintText: "Enter your Username",
            icon: Icons.supervised_user_circle,
            action: TextInputAction.next,
          ),
          CustomTextField(
            Secure: false,
            controller: email,
            label: "Email",
            hintText: "Enter your Email",
            icon: Icons.email_outlined,
            action: TextInputAction.next,
          ),
          CustomTextField(
            Secure: true,
            controller: password,
            label: "Password",
            hintText: "Enter your Password",
            icon: Icons.password,
            action: TextInputAction.done,
            secondIcon: Icons.remove_red_eye_outlined,
          ),
          Custom_Button(
              label: "Signup",
              backgroundcolor: ColorConstants.MainColor,
              textcolor: Colors.white,
              function: () {
                AuthController.instance.Register(
                    email.text.toString(),
                    password.text.toString(),
                    name.text.toString(),
                    username.text.toString());
              }),
          Custom_Button(
              label: "Login",
              backgroundcolor: ColorConstants.MainColor,
              textcolor: Colors.white,
              function: () {
                Get.to(MainLogin());
              }),
        ],
      ).extendPadding(),
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.hintText,
      required this.icon,
      required this.action,
      this.secondIcon,
      required this.Secure})
      : super(key: key);

  String label;
  String hintText;
  IconData icon;
  IconData? secondIcon;
  TextEditingController controller;
  TextInputAction action;
  bool Secure;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: Get.width * 100,
          height: 70,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: ColorConstants.TextFieldsColor,
            child: TextFormField(
              textInputAction: action,
              controller: controller,
              obscureText: Secure,
              decoration: InputDecoration(
                labelText: label,
                hintText: hintText,
                prefixIcon: Icon(icon),
                suffixIcon: Icon(secondIcon),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
