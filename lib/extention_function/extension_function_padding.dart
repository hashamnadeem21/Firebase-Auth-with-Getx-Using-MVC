import 'package:flutter/material.dart';

extension padding on Widget{

  Widget extendPadding(){
    return SingleChildScrollView(
    child: Padding(padding: EdgeInsets.all(40),
    child: this,
    ),
    );
  }
}
