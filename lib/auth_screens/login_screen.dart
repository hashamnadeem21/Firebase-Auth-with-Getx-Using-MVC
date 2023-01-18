import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:signuploginfirebase/auth_screens/signup_screen.dart';
import 'package:signuploginfirebase/controllers/auth_controller.dart';
import 'package:signuploginfirebase/widgets/buttons.dart';

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
    return Scaffold(
// AppBar with title "Login"
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
// Padding for the entire column
        padding: const EdgeInsets.all(20),
        child: Column(
// Align the children of the column to the center
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
// Email TextFormField with email icon and label
            TextFormField(
              controller: email,
              autofocus: true,
              decoration: const InputDecoration(
                  icon: Icon(Icons.email_outlined),
                  label: Text("Email"),
                  fillColor: Colors.cyan),
            ),
// Password TextFormField with password icon and label
            TextFormField(
              controller: password,
              autofocus: true,
              decoration: const InputDecoration(
                icon: Icon(Icons.password),
                label: Text("Password"),
              ),
            ),
// Login button that calls the login method in the AuthController with the email and password text
            Custom_Button(
                label: "Login",
                backgroundcolor: Colors.grey,
                textcolor: Colors.white,
                function: () {
                  AuthController.instance
                      .Login(email.text.toString(), password.text.toString());
                }),
// Signup button that navigates to the SignUp page
            Custom_Button(
                label: "Signup",
                backgroundcolor: Colors.grey,
                textcolor: Colors.white,
                function: () {
                  Get.to(SignUp());
                })
          ],
        ),
      ),
    );
  }
}