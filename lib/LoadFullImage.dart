import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class LoadFullImage extends StatelessWidget {
  String imagePath;
  LoadFullImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fill)
              ),
       ),
    );
  }
}