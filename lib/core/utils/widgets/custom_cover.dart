import 'package:flutter/material.dart';

class CustomCover extends StatelessWidget {
  const CustomCover({
    super.key,
    this.image,
  });

  final Widget? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/frame.png",
                ),
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45), topRight: Radius.circular(45))),
        ),
        Positioned(
          top: 160,
          right: 5,
          left: 5,
          child: image ??
              Image.asset(
                "assets/images/logo.png",
                height: MediaQuery.of(context).size.height * 0.14,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
        ),
      ],
    );
  }
}
