import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixels/pages/home/noor_excel_page.dart';
import 'package:pixels/widgets/window_navigator.dart';

import '../pages/courses_resources/cources_resources_page.dart';
import '../pages/news/news_page.dart';


class ThreeMainButtons extends StatefulWidget {
//  static const routeName = '/WelcomeScreen';
  @override
  _ThreeMainButtonsState createState() =>
      new _ThreeMainButtonsState();
}

class _ThreeMainButtonsState extends State<ThreeMainButtons>
    with TickerProviderStateMixin {
  double _borderRadius = 120;

  AnimationController _container1controller;
  AnimationController _container2controller;
  AnimationController _container3controller;

  void initState() {
    super.initState();
    _container1controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      lowerBound: 0,
      upperBound: 2000,
    );
    _container2controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      lowerBound: 0,
      upperBound: 2000,
    );
    _container3controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      lowerBound: 0,
      upperBound: 2000,
    );

    _container1controller.addListener(() {
      setState(() {});
    });
    _container2controller.addListener(() {
      setState(() {});
    });
    _container3controller.addListener(() {
      setState(() {});
    });

    _container1controller.animateTo(160);
    _container2controller.animateTo(180);
    _container3controller.animateTo(160);
  }

  void dispose() {
    _container1controller.dispose();
    _container2controller.dispose();
    _container3controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _container2controller.animateBack(0);
                    _container3controller.animateBack(0);
                    _container1controller
                        .animateTo(MediaQuery.of(context).size.height*0.5)
                        .whenComplete(() {
                      windowNavigateToPage(context, page: CourcesResourcesPage());
                      _container1controller.animateTo(160);
                      _container2controller.animateTo(180);
                      _container3controller.animateTo(160);
                    });
                  },
                  child: Container(
                    height: _container1controller.value * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(_borderRadius)),
                        color: Colors.pink[800] // Color(0xFF2D274C),
                        ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Courses',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 25.0),
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Resources',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _container1controller.animateBack(0);
                    _container3controller.animateBack(0);
                    _container2controller
                        .animateTo(MediaQuery.of(context).size.height*0.5)
                        .whenComplete(() {
                      windowNavigateToPage(context, page: NewsPage());

                      _container1controller.animateTo(160);
                      _container2controller.animateTo(180);
                      _container3controller.animateTo(160);
                    });
                  },
                  child: Container(
                    height: _container2controller.value * 0.4,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Pixels',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 25.0),
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'News',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _container1controller.animateBack(0);
                    _container2controller.animateBack(0);
                    _container3controller
                        .animateTo(MediaQuery.of(context).size.height*0.5)
                        .whenComplete(() {
                      windowNavigateToPage(context, page: NoorExcelSheetPage());
                      _container1controller.animateTo(160);
                      _container2controller.animateTo(180);
                      _container3controller.animateTo(160);
                    });
                  },
                  child: Container(
                    height: _container3controller.value * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(_borderRadius)),
                      color: Color(0xFF688C96),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Pixera',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 25.0),
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Courses Sheet',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
