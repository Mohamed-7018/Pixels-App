import 'package:flutter/material.dart';
import 'package:pixels/widgets/blur_filter.dart';
import 'package:pixels/widgets/dices.dart';

import '../../../constants.dart';

class InfoTimeline extends StatefulWidget {
  @override
  _InfoTimelineState createState() => _InfoTimelineState();
}

class _InfoTimelineState extends State<InfoTimeline> {
  int cStep = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(splashColor: Constants.color2),
      child: Stepper(
        physics: NeverScrollableScrollPhysics(),
        currentStep: cStep,
        onStepContinue: () {
          if (cStep < 2) {
            setState(() {
              ++cStep;
              makeDiscs();
            });
          }
        },
        onStepCancel: () {
          if (cStep > 0) {
            setState(() {
              --cStep;
              makeDiscs();
            });
          }
        },
        onStepTapped: (value) {
          setState(() {
            cStep = value;
          });
        },
        controlsBuilder: (context, {onStepCancel, onStepContinue}) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconBtn(icon: Icons.arrow_upward_rounded, onClick: onStepCancel),
            iconBtn(
                icon: Icons.arrow_downward_rounded, onClick: onStepContinue),
          ],
        ),
        steps: List.generate(
          3,
          (index) => infoStep(
            context,
            title: Constants.titles[index],
            content: Constants.contents[index],
          ),
        ),
      ),
    );
  }

  Step infoStep(context, {title, content}) {
    var size = MediaQuery.of(context).size;
    return Step(
      isActive: false,
      title: BlurFilter(
        sigma: 8,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 13),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            border: Border.all(color: Colors.pink[700], width: 1.5),
          ),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      content: BlurFilter(
        sigma: 8,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              bottomLeft: Radius.circular(40),
            ),
          ),
          child: Text(
            content,
            style: TextStyle(
              fontSize: (size.height > 600) ? 16 : 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: (size.height > 600) ? 1.5 : 1.3,
            ),
            softWrap: true,
          ),
        ),
      ),
    );
  }

  iconBtn({Function onClick, IconData icon}) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: BlurFilter(
        sigma: 8,
        borderRadius: BorderRadius.circular(100),
        child: InkWell(
          onTap: onClick,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            padding: (size.height > 600)
                ? const EdgeInsets.all(12)
                : const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.1),
              border: Border.all(color: Colors.pink[700], width: 1.5),
            ),
            child: Icon(icon, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
