import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pixels/constants.dart';
import 'package:pixels/pages/tracks_page/carousel.dart';
import 'package:pixels/pages/tracks_page/track_header.dart';
import 'package:pixels/provider/track_provider.dart';
import 'package:pixels/widgets/blur_filter.dart';
import 'package:pixels/widgets/dices.dart';
import 'package:provider/provider.dart';

class TrackPage extends StatefulWidget {
  static String routeName = 'trackPage';
  @override
  _TrackPageState createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var track = Provider.of<TrackProvider>(context);
    final CarouselController carouselController = CarouselController();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox.expand(child: VariousDiscs()),
            Column(
              children: [
                TracksHeader(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: BlurFilter(
                    borderRadius: BorderRadius.circular(20),
                    sigma: 8,
                    child: Container(
                      width: size.width * 0.8,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Constants.color2, width: 2.5),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.15),
                      ),
                      child: Text(
                        Constants.tracksNames[track.trackType],
                        style: (size.height > 600)
                            ? Theme.of(context).textTheme.headline6.copyWith(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                )
                            : Theme.of(context).textTheme.subtitle1.copyWith(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: IgnorePointer(
                          child: BlurFilter(
                            borderRadius: BorderRadius.circular(150),
                            sigma: 8,
                            child: Container(
                              width: size.width * 0.8,
                              height: size.width * 0.8,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Constants.color2, width: 2.5),
                                color: Colors.white.withOpacity(0.15),
                                shape: BoxShape.circle,
                              ),
                              child: Text (
                                Constants
                                    .tracksDiscription[track.trackType],
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                  height: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Carousel(carouselController: carouselController),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BlurFilter(
                                borderRadius: BorderRadius.circular(100),
                                sigma: 8.0,
                                child: CircleAvatar(
                                  backgroundColor:
                                      Colors.white.withOpacity(0.2),
                                  child: IconButton(
                                    icon: const Icon(
                                        Icons.arrow_back_ios_rounded),
                                    color: Colors.white,
                                    onPressed: () {
                                      carouselController.previousPage(
                                          duration:
                                              const Duration(milliseconds: 700),
                                          curve: Curves.easeInOut);
                                    },
                                  ),
                                ),
                              ),
                              BlurFilter(
                                borderRadius: BorderRadius.circular(100),
                                sigma: 8.0,
                                child: CircleAvatar(
                                  backgroundColor:
                                      Colors.white.withOpacity(0.2),
                                  child: IconButton(
                                    icon: const Icon(
                                        Icons.arrow_forward_ios_rounded),
                                    color: Colors.white,
                                    onPressed: () {
                                      carouselController.nextPage(
                                          duration:
                                              const Duration(milliseconds: 700),
                                          curve: Curves.easeInOut);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
