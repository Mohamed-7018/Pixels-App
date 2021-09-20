import 'package:flutter/material.dart';
import 'package:pixels/models/facebook_posts.dart';
import 'package:pixels/pages/news/post_boxes/post_with_image.dart';
import 'package:pixels/pages/news/post_boxes/post_with_link.dart';
import 'package:pixels/widgets/loading.dart';
import 'package:provider/provider.dart';

import '../post_boxes/post_with_album.dart';

class PostBox extends StatelessWidget {
  final int index;

  const PostBox({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Data> data = Provider.of<List<Data>>(context);
    Attachments atData = data[index].attachments;

    if (data == null) {
      return Loading();
    } else {
      switch (atData.data[0].mediaType) {
        case 'photo':
          return PostWithImage(index: index);
          break;
        case 'album':
          return PostWithAlbum(index: index);
          break;
        case 'link':
        case 'video':
          return PostWithLink(index: index);
          break;
        default:
          return Container();
      }
    }
  }
}
