import 'package:flutter/material.dart';
import 'package:iexam/core/theme/app_pallete.dart';

class CustomBtn {
  static customtn(String text, double width, VoidCallback onTap) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        height: 60,
        width: width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Pallete.blueGradient2,
                  Pallete.blueGradient1,
                ]),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              const Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
