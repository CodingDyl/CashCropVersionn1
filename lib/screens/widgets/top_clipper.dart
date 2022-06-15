import 'package:flutter/material.dart';

class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * .6);

    path.cubicTo(
      size.width * .7,
      size.height + 150,
      size.width * .3,
      size.height * .5,
      0,
      size.height,
    );
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
