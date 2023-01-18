import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signuploginfirebase/auth_screens/signup_screen.dart';
import 'package:signuploginfirebase/controllers/auth_controller.dart';
import 'package:signuploginfirebase/widgets/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
// HomeScreen widget displays the email passed as a parameter and a signout button
class HomeScreen extends StatelessWidget {

  // variable to store the passed email
  var email;

  // constructor to initialize the email
  HomeScreen({Key? key , required this.email}) : super(key: key);

  // FirebaseAuth instance to handle authentication
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with title "Home Screen"
      appBar: AppBar(title: const Text("Home Screen"),),

      // Body with centered column layout
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Displays the passed email
            Text(email),
            // Signout button using Custom_Button widget
            Custom_Button(label: "Signout", backgroundcolor: Colors.grey, textcolor: Colors.white, function: (){
              // Call LogOut function of AuthController to sign out
              AuthController.instance.LogOut();
            }
            )
          ],

        ),
      ),
    );
  }
}
