
import 'package:flutter/material.dart';
import 'package:pixels/pages/info/components/events_history.dart';
import 'package:pixels/pages/info/components/info_header.dart';


class InfoBoxEventsHistory extends StatefulWidget {
  final PageController controller;

  const InfoBoxEventsHistory({Key key, this.controller}) : super(key: key);

  @override
  _InfoBoxEventsHistory createState() => _InfoBoxEventsHistory();
}

class _InfoBoxEventsHistory extends State<InfoBoxEventsHistory> {


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
          WeatherTimeline(),

        ],
      ),
    );
  }
}
