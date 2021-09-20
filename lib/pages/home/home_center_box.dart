import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixels/pages/tracks_page/tracks_page.dart';
import 'package:pixels/provider/track_provider.dart';
import 'package:pixels/widgets/blur_filter.dart';
import 'package:pixels/widgets/navigation.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class HomeCenterBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var track = Provider.of<TrackProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderBox(),
          const SizedBox(height: 8),
          BlurFilter(
            sigma: 10,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(65),
              bottomRight: Radius.circular(65),
            ),
            child: Container(
              width: size.width * 0.8,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple[700], width: 2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(65),
                  bottomRight: Radius.circular(65),
                ),
                color: Colors.white.withOpacity(0.15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  3,
                  (index) => InkWell(
                    onTap: () {
                      track.setTrackType(index);
                      circularNavigate(
                        context,
                        page: TrackPage(),
                        offset: Offset(size.width / 2, size.height / 2),
                      );
                    },
                    splashColor: Constants.color2,
                    borderRadius: (index == 1)
                        ? BorderRadius.only(
                            topRight: Radius.circular(80),
                            bottomLeft: Radius.circular(80),
                          )
                        : BorderRadius.only(
                            topLeft: Radius.circular(80),
                            bottomRight: Radius.circular(80),
                          ),
                    child: Container(
                      width: size.width * 0.8,
                      height: size.height * 0.1,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.deepPurple[700], width: 2),
                        borderRadius: (index == 1)
                            ? BorderRadius.only(
                                topRight: Radius.circular(80),
                                bottomLeft: Radius.circular(80),
                              )
                            : BorderRadius.only(
                                topLeft: Radius.circular(80),
                                bottomRight: Radius.circular(80),
                              ),
                        color: Theme.of(context).primaryColor.withOpacity(0.55),
                      ),
                      child: Text(
                        Constants.tracksNames[index],
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class HeaderBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wavyTextStyle = GoogleFonts.changa(
      fontSize: Theme.of(context).textTheme.headline6.fontSize,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
      wordSpacing: 2,
    );
    return BlurFilter(
      sigma: 10,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(50),
        bottomLeft: Radius.circular(50),
      ),
      child: Container(
        height: (MediaQuery.of(context).size.height > 600) ? 135 : 100,
        width: MediaQuery.of(context).size.width * 0.8,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
          border: Border.all(color: Constants.color2, width: 3),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
          color: Colors.white.withOpacity(0.1),
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText(
              'We Are Pixels',
              textAlign: TextAlign.center,
              textStyle: wavyTextStyle,
            ),
            WavyAnimatedText(
              'Every Pixel is Knowledge',
              textAlign: TextAlign.center,
              textStyle: wavyTextStyle,
            ),
          ],
          pause: const Duration(milliseconds: 2500),
        ),
      ),
    );
  }
}
