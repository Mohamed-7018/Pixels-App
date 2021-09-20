import 'package:flutter/material.dart';
import 'package:pixels/pages/info/components/info_header.dart';
import 'package:pixels/pages/info/components/pixels_21_events.dart';

import '../../../constants.dart';

class InfoBoxPixel21Events extends StatefulWidget {
  final PageController controller;

  const InfoBoxPixel21Events({Key key, this.controller}) : super(key: key);

  @override
  _InfoBoxPixel21Events createState() => _InfoBoxPixel21Events();
}

class _InfoBoxPixel21Events extends State<InfoBoxPixel21Events> {


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
          SuccessTimeline(),
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
                  4,
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.fastOutSlowIn,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
