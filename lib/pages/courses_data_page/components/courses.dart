import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixels/models/track.dart';
import 'package:pixels/provider/track_provider.dart';
import 'package:pixels/pages/courses_data_page/components/course_card.dart';
import 'package:pixels/widgets/empty_course_card.dart';
import 'package:pixels/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Articles extends StatefulWidget {
  final int index;

  const Articles(this.index);

  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles>
    with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    var track = Provider.of<TrackProvider>(context);
    return FutureBuilder(
      future: track.selectedTrack(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: Loading());
        } else {
          TrackModel data = snapshot.data[widget.index];
          if (data.courses.every((element) => element == '')) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: animation,
                    child: RotationTransition(
                      turns: animation,
                      child: EmptyCourseCard(
                        text: 'No Courses Available\ngo to Books or Videos',
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
                  data.courses.length,
                  (indexx) => Column(
                    children: [
                      (data.courses[indexx] != '')
                          ? ScaleTransition(
                              scale: animation,
                              child: CourseCard(
                                text: 'Course ${indexx + 1}',
                                onClick: () {
                                  launch(data.courses[indexx]);
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
