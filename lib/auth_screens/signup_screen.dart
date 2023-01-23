import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:signuploginfirebase/auth_screens/login_screen.dart';
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
        title: const Text("Signup"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(ImageConstants.SplashScreenLogo),
          CustomTextField(
            controller: name,
            label: "Name",
            hintText: "Enter your Name",
            icon: Icons.person,
            action: TextInputAction.next,
          ),
          CustomTextField(
            controller: username,
            label: "Username",
            hintText: "Enter your Username",
            icon: Icons.supervised_user_circle,
            action: TextInputAction.next,
          ),
          CustomTextField(
            controller: email,
            label: "Email",
            hintText: "Enter your Email",
            icon: Icons.email_outlined,
            action: TextInputAction.next,
          ),
          CustomTextField(
            controller: password,
            label: "",
            hintText: "Enter your Password",
            icon: Icons.password,
            action: TextInputAction.done,
          ),
          Custom_Button(
              label: "Signup",
              backgroundcolor: Colors.grey,
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
              backgroundcolor: Colors.grey,
              textcolor: Colors.white,
              function: () {
                Get.to(LoginPage());
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
      required this.action})
      : super(key: key);

  String label;
  String hintText;
  IconData icon;
  TextEditingController controller;
  TextInputAction action;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: ColorConstants.TextFieldsColor,
            child: TextFormField(
              textInputAction: action,
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                hintText: hintText,
                prefixIcon: Icon(icon),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
