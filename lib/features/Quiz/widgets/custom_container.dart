import 'package:flutter/material.dart';
import 'package:iexam/core/theme/app_pallete.dart';

class CustomContainer {
  static customContainer(String text, double width, VoidCallback onTap) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 70,
        width: width,
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //     begin: Alignment.centerLeft,
            //     end: Alignment.centerRight,
            //     colors: [
            //       Pallete.blueGradient2,
            //       Pallete.blueGradient1,
            //     ]),
            color: Pallete.blueLightColor,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.text_snippet,
                size: 40,
              ),
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
