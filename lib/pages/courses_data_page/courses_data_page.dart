import 'package:flutter/material.dart';
import 'package:pixels/pages/tracks_page/track_header.dart';
import 'package:pixels/widgets/dices.dart';
import 'package:provider/provider.dart';
import '../../provider/bottom_navbar_provider.dart';
import 'components/courses.dart';
import 'components/books.dart';
import 'components/videos.dart';
import 'components/bottom_navbar.dart';

class CoursesDataPage extends StatelessWidget {
  static const String routeName = 'coursePage';
  final int indexOfSelectedCourse;

  const CoursesDataPage({Key key, this.indexOfSelectedCourse})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cPage = Provider.of<BottomNavBarProvider>(context);
    var pages = [
      Articles(indexOfSelectedCourse),
      Videos(indexOfSelectedCourse),
      Books(indexOfSelectedCourse),
    ];
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            VariousDiscs(),
            Column(
              children: [
                TracksHeader(),
                Expanded(child: pages[cPage.currentPage]),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: MBottomNavBar(),
    );
  }
}
