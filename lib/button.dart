import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final textcolor;
  final String buttontext;
  final color;
  final ontap;
  const Mybutton({
    Key? key,
    required this.textcolor,
    required this.buttontext,
    required this.color,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttontext,
                style: TextStyle(color: textcolor, fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
