import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signuploginfirebase/auth_screens/login_screen.dart';
import 'package:signuploginfirebase/extention_function/extension_function.dart';
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

          CustomTextField(controller: name, label: "Name", hintText: "Enter your Name", icon: Icons.person),
          CustomTextField(controller: username, label: "Username", hintText: "Enter your Username", icon: Icons.supervised_user_circle),
          CustomTextField(controller: email, label: "Email", hintText: "Enter your Email", icon: Icons.email_outlined),
          CustomTextField(controller: password, label: "Password", hintText: "Enter your Password", icon: Icons.password),

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
  CustomTextField({Key? key, required this.controller, required this.label, required this.hintText, required this.icon}) : super(key: key);

  String label;
  String hintText;
  IconData icon;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            prefixIcon: Icon(icon),
          ),
        ),
      ],
    );

  }
}


