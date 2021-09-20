import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

import '../constants.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoadingBouncingGrid.square(
      inverted: true,
      backgroundColor: Constants.color2,
    );
  }
}
