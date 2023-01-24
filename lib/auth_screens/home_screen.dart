import 'package:flutter/material.dart';
import 'package:signuploginfirebase/controllers/auth_controller.dart';
import 'package:signuploginfirebase/utils/color_constants.dart';
import 'package:signuploginfirebase/widgets/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../lottie_page/lottie_page_animtions.dart';

// HomeScreen widget displays the email passed as a parameter and a signout button
class HomeScreen extends StatelessWidget {
  // variable to store the passed email
  var email;
  var password;
  // constructor to initialize the email
  HomeScreen({Key? key, required this.email}) : super(key: key);

  // FirebaseAuth instance to handle authentication
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with title "Home Screen"
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Home Screen"),
      ),
      // Body with centered column layout
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LotiiePage(),
            // Displays the passed email
            Row(
              children: [
                const Text(
                  "Email:  ",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(email),
              ],
            ),
            // Signout button using Custom_Button widget
            Custom_Button(
                label: "Signout",
                backgroundcolor: ColorConstants.MainColor,
                textcolor: Colors.white,
                function: () {
                  // Call LogOut function of AuthController to sign out
                  AuthController.instance.LogOut();
                })
          ],
        ),
      ),
    );
  }
}
