import 'package:flutter/material.dart';
import 'package:pixels/widgets/blur_filter.dart';

import '../../../constants.dart';

class CourseCard extends StatelessWidget {
  final String text;
  final Function onClick;

  const CourseCard({Key key, this.text, this.onClick}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: BlurFilter(
        borderRadius: BorderRadius.circular(20),
        sigma: 8,
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.symmetric(vertical: 22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.15),
            border: Border.all(color: Constants.color2, width: 2),
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }
}
