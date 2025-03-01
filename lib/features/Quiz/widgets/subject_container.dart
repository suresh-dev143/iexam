import 'package:flutter/material.dart';
import 'package:iexam/core/theme/app_pallete.dart';

class SubContainer {
  static subContainer(String text, double width, VoidCallback onTap) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 70,
          width: width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Pallete.blueGradient2,
                    Pallete.blueGradient1,
                  ]),
              color: Pallete.blueLightColor,
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const Icon(
                  Icons.subject,
                  size: 40,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(text,
                    style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        TextButton(
            onPressed: onTap,
            child: Container(
              alignment: Alignment.center,
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Pallete.blueGradient2,
                        Pallete.blueGradient1,
                      ]),
                  color: Pallete.blueLightColor,
                  borderRadius: BorderRadius.circular(15)),
              child: const Text(
                'Go',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            )),
      ],
    );
  }
}
