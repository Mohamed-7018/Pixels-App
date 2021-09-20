import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../widgets/blur_filter.dart';


class MissionAndVision extends StatefulWidget {
  @override
  _MissionAndVision createState() => _MissionAndVision();
}

class _MissionAndVision extends State<MissionAndVision> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          height: MediaQuery.of(context).size.height*0.7,
          child: ListView(
            children: <Widget>[
              TimelineTile(
                alignment: TimelineAlign.center,
                isFirst: true,
                indicatorStyle: const IndicatorStyle(
                  width: 20,
                  color: Colors.purple,
                  indicatorXY: 0.2,
                  padding: EdgeInsets.all(8),
                ),
                endChild: Container(
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset('assets/pixels_white.png'),
                        padding: const EdgeInsets.all(5.0),
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      BlurFilter(
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
                            "Pixels Vision",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      // Text(
                      //   "Pixels Vision",
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 15,
                      //       color: Colors.black
                      //   ),
                      // ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Building strong, conscious, and well qualified calibers &"
                          'having a creative Arabic society can improve and'
                      'Produce different new technologies through'
                      'enriching youth skills,',
                        style: TextStyle(

                            fontSize: 14,
                            color: Colors.white
                        ),
                      )

                    ],
                  ),
                ),
              ),

              TimelineTile(
                alignment: TimelineAlign.center,
                indicatorStyle: const IndicatorStyle(
                  width: 20,
                  color: Colors.yellowAccent,
                  padding: EdgeInsets.all(8),
                  indicatorXY: 0.3,
                ),
                startChild: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        child: Image.asset('assets/pixels_white.png'),
                        padding: const EdgeInsets.all(5.0),
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      BlurFilter(
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
                            "Pixels Mission",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      // Text(
                      //   "Pixels Vision",
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 15,
                      //       color: Colors.black
                      //   ),
                      // ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Center(
                          child: Text(
                            "Building well qualified members technically & Personally so"
                          "that they could afford responsibility towards the"
                          "the community in their life journey & to effectively"
                          "develop & enhance the entity on all levels, so it will have"
                          "stronger impact over the nation and making effective"
                            "leaders able to hold positioning in the near future & devotes"
                            "towards enhancing these committees.",
                            style: TextStyle(

                                fontSize: 14,
                                color: Colors.white
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ),
              TimelineTile(
                alignment: TimelineAlign.center,
                indicatorStyle: const IndicatorStyle(
                  width: 20,
                  color: Colors.redAccent,
                  padding: EdgeInsets.all(8),
                  indicatorXY: 0.3,
                ),
                endChild: Container(
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset('assets/pixels_white.png'),
                        padding: const EdgeInsets.all(5.0),
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      BlurFilter(
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
                            "Pixels Objectives",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      // Text(
                      //   "Pixels Vision",
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 15,
                      //       color: Colors.black
                      //   ),
                      // ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "1-In Pixels at the beginning of the season we recruit new members and improve their technical and soft skills.\n"
                        "2-Building a high technical projects to support pixels presence in the campus, also for participating in various international competitions.\n"
                        "3-Organizing courses, camps, workshops and hubs to develop technical skills foreach engineering students all aroundEgypt.\n"
                        "Organizing robotics competition and problem solving contest to practice  in what we studied in our courses.\n",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white
                        ),
                      )


                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
    );
  }
}