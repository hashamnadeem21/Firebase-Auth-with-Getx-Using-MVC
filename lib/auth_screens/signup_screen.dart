import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signuploginfirebase/auth_screens/login_screen.dart';
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Signup"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: name,
              autofocus: true,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                label: Text("Name"),
              ),
            ),
            TextFormField(
              controller: username,
              autofocus: true,
              decoration: const InputDecoration(
                icon: Icon(Icons.supervised_user_circle),
                label: Text("Username"),
              ),
            ),
            TextFormField(
              controller: email,
              autofocus: true,
              decoration: const InputDecoration(
                  icon: Icon(Icons.email_outlined),
                  label: Text("Email"),
                  fillColor: Colors.cyan),
            ),
            TextFormField(
              controller: password,
              autofocus: true,
              decoration: const InputDecoration(
                icon: Icon(Icons.password),
                label: Text("Password"),
              ),
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
        ),
      ),
    );
  }
}
