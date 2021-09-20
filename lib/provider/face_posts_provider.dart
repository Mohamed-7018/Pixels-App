import 'package:flutter/foundation.dart';
import 'package:pixels/backend/face_posts_data.dart';
import 'package:pixels/models/facebook_posts.dart';

class FacePostsProvider extends ChangeNotifier {
  List<Data> _facePosts = [];

  fetchPosts() async {
    _facePosts = await FacePostsServices.getFacebookData();
    notifyListeners();
  }

  List<Data> get facePosts => _facePosts;
}
