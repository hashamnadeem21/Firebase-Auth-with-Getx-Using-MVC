import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LotiiePage extends StatelessWidget {
  const LotiiePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Lottie.asset("images/119276-sign-up.json");
  }
}
