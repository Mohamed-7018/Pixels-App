import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixels/models/track.dart';
import 'package:pixels/provider/track_provider.dart';
import 'package:pixels/pages/courses_data_page/components/course_card.dart';
import 'package:pixels/widgets/empty_course_card.dart';
import 'package:pixels/widgets/loading.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class Videos extends StatefulWidget {
  final int index;

  const Videos(this.index);

  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    animation = Tween(begin: 0.2, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    var track = Provider.of<TrackProvider>(context);
    return FutureBuilder(
      future: track.selectedTrack(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: Loading());
        } else {
          TrackModel data = snapshot.data[widget.index];
          if (data.videos.every((element) => element == '')) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: animation,
                    child: RotationTransition(
                      turns: animation,
                      child: EmptyCourseCard(
                        text: 'No Videos Available\ngo to Courses or Books',
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  data.videos.length,
                  (indexx) => Column(
                    children: [
                      (data.videos[indexx] != '')
                          ? ScaleTransition(
                              scale: animation,
                              child: CourseCard(
                                text: 'Video ${indexx + 1}',
                                onClick: () {
                                  Constants.launchUniversalLink(
                                      data.videos[indexx]);
                                },
                              ),
                            )
                          : const SizedBox(),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            );
          }
        }
      },
    );
  }
}
