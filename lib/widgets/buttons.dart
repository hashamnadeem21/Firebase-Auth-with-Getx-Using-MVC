import 'package:flutter/material.dart';

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
              minimumSize: const Size(270, 50),
              maximumSize: const Size(270, 50),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              elevation: 30,
            ),
            onPressed: function,
            child: Text(
              label,
              style: TextStyle(color: textcolor),
            )),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
