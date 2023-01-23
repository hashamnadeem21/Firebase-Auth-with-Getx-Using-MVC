import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Custom_Button extends StatelessWidget {
  Custom_Button(
      {super.key,
      required this.label,
      required this.backgroundcolor,
      required this.textcolor,
      required this.function});

  String label;
  Color backgroundcolor;
  Color textcolor;
  VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundcolor,
              minimumSize : Size(Get.width*200, 58),
              maximumSize:  Size(Get.width*200, 58),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              elevation: 5,
            ),
            onPressed: function,
            child: Text(
              label,
              style: TextStyle(color: textcolor, fontWeight: FontWeight.w500, fontSize: 20),
            )),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
