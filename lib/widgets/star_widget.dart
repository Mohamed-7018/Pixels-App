import 'dart:math';
import 'package:flutter/material.dart';
import 'clippers.dart';

class StarWidget extends StatelessWidget {
  final double size;

  const StarWidget({Key key, this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.rotate(
          angle: -(pi * 35) / 360,
          child: ClipPath(
            clipper: StarClipper(5),
            child: Container(
              width: size,
              height: size,
              color: Colors.amber[800],
              alignment: Alignment.center,
            ),
          ),
        ),
        Text(
          '21',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w900,
          ),
          softWrap: true,
        ),
      ],
    );
  }
}
