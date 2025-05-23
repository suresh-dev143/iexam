import 'package:flutter/material.dart';
import 'package:iexam/core/theme/app_pallete.dart';

class CustomBox {
  static customBox(String text, IconData icon, VoidCallback ontap) {
    return TextButton(
      onPressed: ontap,
      child: Container(
        width: 120,
        height: 100,
        decoration: BoxDecoration(
          color: Pallete.currentAffraisBox,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Pallete.blueDarkColor,
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ), //BoxShadow
            const BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 35,
              ),
              Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
