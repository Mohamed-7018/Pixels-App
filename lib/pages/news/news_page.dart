import 'package:flutter/material.dart';
import 'package:pixels/models/facebook_posts.dart';
import 'package:pixels/pages/news/posts_list.dart';
import 'package:pixels/pages/tracks_page/track_header.dart';
import 'package:pixels/widgets/dices.dart';
import 'package:pixels/widgets/loading.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Data> data = Provider.of<List<Data>>(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox.expand(child: VariousDiscs()),
            Column(
              children: [
                TracksHeader(),
                Expanded(
                  child:
                      (data == null) ? Center(child: Loading()) : PostsList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
