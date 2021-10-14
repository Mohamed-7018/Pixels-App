import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixels/pages/info/components/info_header.dart';
import 'package:pixels/pages/info/components/timeline.dart';

import '../../../constants.dart';

class InfoBoxTwo extends StatefulWidget {
  final PageController controller ;

  const InfoBoxTwo({Key key, this.controller}) : super(key: key);
  @override
  _InfoBoxTwoState createState() => _InfoBoxTwoState();
}

class _InfoBoxTwoState extends State<InfoBoxTwo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation animation1, animation2, animation3;
  Timer timer;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500));
    animation1 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.4, curve: Curves.easeOutBack)));
    animation2 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.3, 0.7, curve: Curves.easeOutBack)));
    animation3 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 1.0, curve: Curves.easeOutBack)));
    timer = Timer(
      const Duration(milliseconds: 1300),
      () => _controller.forward(),
    );
  }

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
          InfoTimeline(),
          (size.height > 700 ) ? Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: animation1,
                  child: Text(
                    'We ',
                    style: GoogleFonts.fjallaOne(
                      fontSize: (size.height > 600)
                          ? Theme.of(context).textTheme.headline4.fontSize
                          : Theme.of(context).textTheme.headline6.fontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                ScaleTransition(
                  scale: animation2,
                  child: Text(
                    'Are ',
                    style: GoogleFonts.fjallaOne(
                      fontSize: (size.height > 600)
                          ? Theme.of(context).textTheme.headline4.fontSize
                          : Theme.of(context).textTheme.headline6.fontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                ScaleTransition(
                  scale: animation3,
                  child: Text(
                    'Pixels',
                    style: GoogleFonts.fjallaOne(
                      fontSize: (size.height > 600)
                          ? Theme.of(context).textTheme.headline4.fontSize
                          : Theme.of(context).textTheme.headline6.fontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
          ) : Container (),
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
                  3,
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
