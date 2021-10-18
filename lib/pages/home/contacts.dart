

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixels/pages/home/feedback.dart';
import 'package:pixels/widgets/action_icon.dart';

import '../../constants.dart';
import '../../widgets/blur_filter.dart';
import '../../widgets/dices.dart';
import '../../widgets/star_widget.dart';
import '../info/components/info_header.dart';

class PixelsMedia extends StatefulWidget {


  const PixelsMedia({Key key}) : super(key: key);

  @override
  _PixelsMediaState createState() => _PixelsMediaState();
}

class _PixelsMediaState extends State<PixelsMedia>
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
    return Scaffold(
      body: SafeArea(
        child: Stack (
          children: [
            SizedBox.expand(child: VariousDiscs (),),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
 /*---------------------------------------------------------------------------------------*/
/*------------------------------------  Pixels Logo  ------------------------------------*/
/*---------------------------------------------------------------------------------------*/
                InfoHeader(),
/*---------------------------------------------------------------------------------------*/
/*------------------------------------  Pixels Star  ------------------------------------*/
/*---------------------------------------------------------------------------------------*/
                Hero(
                  tag: 'pixelsStar',
                  transitionOnUserGestures: true,
                  child: Material(
                    color: Colors.transparent,
                    child: StarWidget(size: (size.height > 600) ? 60 : 50),
                  ),
                ),
                const SizedBox(height: 10),
                _contact(context),
                SizedBox(height: (size.height > 600) ? 30 : 20),
                SizedBox(
                  height: 5,
                ),
                size.height > 700 ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScaleTransition(
                        scale: animation1,
                        child: Text(
                          'Learn ',
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
                          'Make ',
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
                          'Share',
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
                ) :Container (),

              ],
            )
          ],
        ),
      ),
    );
  }

_contact (BuildContext context) {
  return BlurFilter(
    sigma: 5.0,
    borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20)),
    child: Container(
      width: MediaQuery.of(context).size.width*0.9,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pink[700], width: 2),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20)),
        //color: Colors.white.withOpacity(0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Pixels Contacts",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 27,
              ),
            ),
            Divider(
              thickness: 2,
              height: 20,
              color: Colors.pink[800],
            ),
            _buildOptionIcons(context: context),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      gradient: new LinearGradient(
                          colors: [
                            Colors.white10,
                            Colors.white,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    width: 100.0,
                    height: 1.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Text(
                      "Or",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: "WorkSansMedium"),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: new LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.white10,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    width: 100.0,
                    height: 1.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0)
                  .copyWith(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlurFilter(
                    sigma: 5.0,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.pink[700],
                              width: 2),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                        ),
                        backgroundColor:
                        Colors.white.withOpacity(0.2),
                      ),
                      child: Text(
                        "  Write a Feedback  ",
                        style: TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 25.0),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackScreen()));

//                        doorNavigateToPage(context, page: FeedbackScreen());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildOptionIcons({@required BuildContext context}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.indigo.withOpacity(0.3),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ActionIcon(
                onTap: () {
                  Constants.launchUniversalLink (Constants.githubLink);
                } ,
                title: "github",
                iconData: FeatherIcons.github,
                color: Color(0xFF9599B3),
              ),
              Spacer(),
              ActionIcon(
                onTap: () {
                  Constants.launchUniversalLink(Constants.websiteLink);
                },
                title: "website",
                iconData: FeatherIcons.chrome,
                color: Color(0xFF817889),
              ),
              Spacer(),
              ActionIcon(
                onTap: () {
                  Constants.launchUniversalLink(Constants.linkedInLink);
                },
                title: "LinkedIn",
                iconData: FeatherIcons.linkedin,
                color: Color(0xFFD47FA6),
              ),
            ],
          ),
        ),
      ),
      Divider(
        color: Colors.greenAccent,
        height: 24.0,
      ),
      Container(
        //height: height * 0.15,
        decoration: BoxDecoration(
          color: Colors.pink[800].withOpacity(0.3),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ActionIcon(
                onTap: () {
                  Constants.launchUniversalLink(Constants.facebookLink);
                },
                title: "Facebook",
                iconData: FeatherIcons.facebook,
                color: Color(0xFF8856AC),
              ),
              Spacer(),
              ActionIcon(
                onTap: () {
                  Constants.launchUniversalLink(Constants.twitterLink);
                },
                title: 'twitter',
                iconData: FeatherIcons.twitter,
                color:Color(0xFFD47FA6),
              ),

              Spacer(),
              ActionIcon(
                onTap: () {
                  Constants.launchUniversalLink(Constants.instagramLink);
                },
                title: "Instagram",
                iconData: FeatherIcons.instagram,
                color:Color(0xFF8856AC),
              ),

            ],
          ),
        ),
      )
    ],
  );
}
}
