import 'package:flutter/material.dart';
import 'package:pixels/pages/info/components/info_header.dart';
import 'package:pixels/pages/info/components/mission_and_vision.dart';


import '../../../constants.dart';

class InfoBoxMissionAndVision extends StatefulWidget {
  final PageController controller;

  const InfoBoxMissionAndVision({Key key, this.controller}) : super(key: key);

  @override
  _InfoBoxMissionAndVision createState() => _InfoBoxMissionAndVision();
}

class _InfoBoxMissionAndVision extends State<InfoBoxMissionAndVision> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InfoHeader(),
          MissionAndVision(),
/*---------------------------------------------------------------------------------------*/
/*-----------------------------------  Arrow Down Btn  ----------------------------------*/
/*---------------------------------------------------------------------------------------*/
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Constants.color2, width: 3.5),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_downward_outlined),
              onPressed: () {
                widget.controller.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.fastOutSlowIn,
                );
              },
            ),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
