import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pixels/constants.dart';
import 'package:pixels/models/facebook_access_token.dart';
import 'package:pixels/pages/courses_data_page/courses_data_page.dart';
import 'package:pixels/pages/courses_resources/cources_resources_page.dart';
import 'backend/face_posts_data.dart';
import 'provider/bottom_navbar_provider.dart';
import 'package:pixels/pages/home/home.dart';
import 'package:pixels/pages/splash_screen.dart';
import 'package:pixels/pages/tracks_page/tracks_page.dart';
import 'package:pixels/provider/track_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'models/track.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: const Color(0xFF000343),
      statusBarIconBrightness: Brightness.light,
    ),
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  getData(trackUrl, trackFileName) async {
    var dir = await getTemporaryDirectory();
    File file = new File(dir.path + "/" + trackFileName);
    var response = await http.get(Uri.parse(trackUrl));
    if (response.statusCode == 200) {
      var jsonResponse = response.body;
      var jsonTrack = convert.jsonDecode(jsonResponse) as List;

      //save json in local file
      file.writeAsStringSync(jsonResponse, flush: true, mode: FileMode.write);

      // print (jsonTrack);
      return jsonTrack.map((json) => TrackModel.fromJson(json)).toList();
    } else {
      return null;
    }
  }

  Future<String> goTeamsFromSheet() async {
    var raw = await http.get(
        Uri.parse ("https://script.google.com/macros/s/AKfycbwPsFAiXtOtZXmf1Ec90KqafAYfRPVMrtFPJpd2aGyzTDwsSQdh/exec"));

    var jsonSource = convert.jsonDecode(raw.body) as List;
    // print('this is json Feedback ${jsonSource}');

    print ('#############################################################################################');
    print (jsonSource.map((json) => FaceBookGraphAPI.fromJson(json)).toList()[0].url.toString());
    setState(() {
      Constants.faceBookGraphAPI = jsonSource.map((json) => FaceBookGraphAPI.fromJson(json)).toList()[0].url.toString();
    });
    print ("&&&&&&&&&&&");
    print (Constants.faceBookGraphAPI);
    return jsonSource.map((json) => FaceBookGraphAPI.fromJson(json)).toList()[0].url.toString();
    // TeamModel teamModel = new TeamModel();
    // jsonSource.forEach((element) {
    //   print('$element THIS IS NEXT>>>>>>>');
    //
    //   teamModel.ImageUrl = element['Image URL'];
    //   teamModel.Name = element['Name'];
    //   teamModel.Job = element['Job'];
    //   teamModel.Linkedin = element['LinkedIn'];//source.add(sourceModel);
    //
    // });
  }

  @override
  void initState() {
    super.initState();
    getData(Constants.csTrackUrl, 'csTrack.json');
    getData(Constants.powerTrackUrl, 'powerTrack.json');
    getData(Constants.mechanicalTrackUrl, 'mechTrack.json');
    goTeamsFromSheet();

  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TrackProvider>.value(value: TrackProvider()),
        ChangeNotifierProvider<BottomNavBarProvider>.value(
            value: BottomNavBarProvider()),
        FutureProvider(
            initialData: null,
            create: (context) => FacePostsServices.getFacebookData()),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Pixels Egypt',
          debugShowCheckedModeBanner: false,
          theme: theme,
          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName: (context) => SplashScreen(),
            Home.routeName: (context) => Home(),
            CourcesResourcesPage.routeName: (context) => CourcesResourcesPage(),
            CoursesDataPage.routeName: (context) => CoursesDataPage(),
            TrackPage.routeName: (context) => TrackPage(),
          },
        );
      },
    );
  }
}

final ThemeData theme = ThemeData.dark().copyWith(
  primaryColor: const Color(0xFF000343),
  accentColor: Colors.indigo[800],
  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
    centerTitle: true,
    elevation: 0.0,
  ),
  scaffoldBackgroundColor: const Color(0xFF000343),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
