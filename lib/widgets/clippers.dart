import 'dart:math';

import 'package:flutter/material.dart';

class StarClipper extends CustomClipper<Path> {
  StarClipper(this.numberOfPoints);

  ///The number of points of the star
  final int numberOfPoints;

  @override
  Path getClip(Size size) {
    double width = size.height;

    double halfWidth = width / 2;

    double bigRadius = halfWidth;

    double radius = halfWidth / 2;

    double degreesPerStep = _degToRad(360 / numberOfPoints) as double;

    double halfDegreesPerStep = degreesPerStep / 2;

    var path = Path();

    double max = 2 * pi;

    path.moveTo(width, halfWidth);

    for (double step = 0; step < max; step += degreesPerStep) {
      path.lineTo(
          halfWidth + bigRadius * cos(step), halfWidth + bigRadius * sin(step));
      path.lineTo(halfWidth + radius * cos(step + halfDegreesPerStep),
          halfWidth + radius * sin(step + halfDegreesPerStep));
    }

    path.close();
    return path;
  }

  num _degToRad(num deg) => deg * (pi / 180.0);

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    StarClipper oldie = oldClipper as StarClipper;
    return numberOfPoints != oldie.numberOfPoints;
  }
}

/*----------------------------------------------  Circular Page Route  ----------------------------------------------*/

class CirclePageRouteClipper extends CustomClipper<Path> {
  final double radius;
  final Offset center;

  CirclePageRouteClipper(this.radius, this.center);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addOval(Rect.fromCircle(center: center, radius: radius));
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

/*----------------------------------------------  Bottom Navbar  ----------------------------------------------*/

class BottomNavClipper extends CustomClipper<Path> {
  final int length;

  BottomNavClipper(this.length);
  @override
  Path getClip(Size size) {
    Path path = Path();
    var width = size.width;
    var height = size.height;
    path.lineTo(0, 0);
    List.generate(
      2 * length,
      (index) {
        path.cubicTo(
          (((index + 1) * 2) - 1) * width / (4 * length),
          (index % 2 == 0) ? 0 : 2 * height / 5,
          (((index + 1) * 2) - 1) * width / (4 * length),
          (index % 2 != 0) ? 0 : 2 * height / 5,
          (index + 1) * 2 * width / (4 * length),
          (index % 2 != 0) ? 0 : 2 * height / 5,
        );
      },
    );

    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
