import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:signuploginfirebase/auth_screens/home_screen.dart';
import 'package:signuploginfirebase/auth_screens/login_screen.dart';
class AuthController extends GetxController {
  // Singleton instance of the AuthController
  static AuthController instance = Get.find();

  // Rx variable to hold the current Firebase user
  late Rx<User?> _user;
  // FirebaseAuth instance to handle authentication
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    // Initialize _user with the current user
    _user = Rx<User?>(auth.currentUser);
    // Bind _user to the stream of user changes
    _user.bindStream(auth.userChanges());
    // Watch for changes in _user and call _initialPage
    ever(_user, _initialPage);
  }

  // Function to handle routing based on user status
  _initialPage(User? user) {
    if (user == null) {
      // If no user, navigate to login page
      print("Login Page");
      Get.offAll(LoginPage());
    } else {
      // If user is logged in, navigate to home screen
      print("Login Success");
      Get.offAll(HomeScreen(email: user.email,));
    }
  }

  // Function to handle registration
  void Register(
      String email, String password, String name, String username) async {
    try {
      // Create user with email and password
      await auth.createUserWithEmailAndPassword(
          email: email, password: password).then((value){
        // Add user to Firestore database
        FirebaseFirestore.instance.collection('User').add({
          "Name": name,
          "Username": username,
          "Email": email,
          "Password": password,
        });
      });
    } catch (e) {
      // Show snackbar with error message
      Get.snackbar("title", "message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text("Login Again"));
    }
  }
  // Function to handle login
  void Login(
      String email, String password) async {
    try {
      // Sign in with email and password
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      // Show snackbar with error message
      Get.snackbar("Login ", "Login Failed",
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text("Login Failed"));
    }
  }

  // Function to handle logout
  void LogOut()async {
    await auth.signOut();
  }
}
