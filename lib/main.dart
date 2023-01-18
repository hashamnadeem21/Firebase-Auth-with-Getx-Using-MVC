import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:signuploginfirebase/auth_screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:signuploginfirebase/controllers/auth_controller.dart';


// This code is initializing the Firebase
// app and ensuring that the WidgetsFlutterBinding is initialized.
// The Firebase.initializeApp()
// method is called to initialize the Firebase app and connect it to the Firebase backend.
// The .then() function is used to ensure that the AuthController()
// is put into the Get object after the Firebase app is initialized.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
