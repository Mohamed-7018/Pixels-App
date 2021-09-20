import 'package:flutter/cupertino.dart';
import 'package:pixels/backend/get_data.dart';
import 'package:pixels/models/track.dart';

import '../constants.dart';

class TrackProvider extends ChangeNotifier {
  int _trackType = 0;

  setTrackType(trackType) {
    _trackType = trackType;
    notifyListeners();
  }

  int get trackType => _trackType;

  Future<List<TrackModel>> selectedTrack() {
    switch (_trackType) {
      case 0:
        return Tracks.getTrackFromSheet(
            trackUrl: Constants.csTrackUrl, trackFileName: 'csTrack.json');
        break;
      case 1:
        return Tracks.getTrackFromSheet(
            trackUrl: Constants.powerTrackUrl,
            trackFileName: 'powerTrack.json');
        break;
      case 2:
        return Tracks.getTrackFromSheet(
            trackUrl: Constants.mechanicalTrackUrl,
            trackFileName: 'mechTrack.json');
        break;
      default:
        return null;
    }
  }
}
