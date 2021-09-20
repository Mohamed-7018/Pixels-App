import 'package:flutter/material.dart';
import 'package:pixels/pages/info/components/info_box_events_history.dart';
import 'package:pixels/pages/info/components/info_box_mission_and_vision.dart';
import 'package:pixels/widgets/dices.dart';
import 'components/info_box1.dart';
import 'components/info_box2.dart';
import 'components/info_box_pixels_21_events.dart';

class PixelsInfo extends StatefulWidget {
  @override
  _PixelsInfoState createState() => _PixelsInfoState();
}

class _PixelsInfoState extends State<PixelsInfo> {
  PageController controller = PageController(initialPage: 0);
  List boxes;
  @override
  void initState() {
    super.initState();
    boxes = [InfoBoxOne(controller: controller), InfoBoxMissionAndVision(controller: controller,), InfoBoxTwo(controller: controller), InfoBoxPixel21Events (controller: controller),InfoBoxEventsHistory(controller: controller)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          VariousDiscs(),
          PageView.builder(
            controller: controller,
            scrollDirection: Axis.vertical,
            onPageChanged: (value) => setState(() => makeDiscs()),
            itemCount: 5,
            itemBuilder: (context, index) => boxes[index],
          ),
        ],
      ),
    );
  }
}
