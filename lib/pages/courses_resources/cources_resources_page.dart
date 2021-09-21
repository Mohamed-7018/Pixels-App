import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixels/pages/home/hint_circle.dart';
import 'package:pixels/pages/home/home_center_box.dart';
import 'package:pixels/pages/home/home_header.dart';
import 'package:pixels/pages/tracks_page/bubble_indication_painter.dart';
import 'package:pixels/widgets/dices.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../widgets/blur_filter.dart';
import '../tracks_page/carousel.dart';

// var scrollControllers ;
// // List.generate(Constants.favourites.length, (index) => ScrollController());

class CourcesResourcesPage extends StatefulWidget {
  static const String routeName = 'courcesResourcesPage';

  @override
  _CourcesResourcesPageState createState() => _CourcesResourcesPageState();
}

List<String> best;

class _CourcesResourcesPageState extends State<CourcesResourcesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  PageController _pageController;
  Color left = Colors.black;
  Color right = Colors.white;

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Constants.createDatabase();
    setData();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: NotificationListener<OverscrollIndicatorNotification>(
        // ignore: missing_return
        onNotification: (overscroll) {
          overscroll.disallowGlow();
        },
        child: SafeArea(
          child: Stack(
            children: [
              SizedBox.expand(child: VariousDiscs()),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeHeader(),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: _buildMenuBar(context),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 2,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (i) {
                        setState(() => makeDiscs());
                        if (i == 0) {
                          setState(() {
                            right = Colors.white;
                            left = Colors.black;
                          });
                        } else if (i == 1) {
                          setState(() {
                            right = Colors.black;
                            left = Colors.white;
                          });
                        }
                      },
                      children: <Widget>[
                        new ConstrainedBox(
                          constraints: const BoxConstraints.expand(),
                          child: HomeCenterBox(),
                        ),
                        new ConstrainedBox(
                            constraints: const BoxConstraints.expand(),
                            child: _buildFavouritesPage(context)),
                      ],
                    ),
                  ),
                  HintCircle(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    best = prefs.getStringList("Pixels Book Mark");
    print("hr attendance : ${best == null ? 0 : best.length}");
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Constants.color2, //Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: TabIndicationPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              // ignore: deprecated_member_use
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignInButtonPress,
                child: Text(
                  "All Courses",
                  style: TextStyle(
                      color: left,
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              // ignore: deprecated_member_use
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignUpButtonPress,
                child: Text(
                  "Bookmarks",
                  style: TextStyle(
                      color: right,
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}

_buildFavouritesPage(BuildContext context) {
  final CarouselController carouselController = CarouselController();
  final scrollControllers =
      List.generate(Constants.favourites.length, (index) => ScrollController());
  var size = MediaQuery.of(context).size;
  return Column(
    children: [
      Expanded(
        child: Stack(
          children: [
            Positioned.fill(
              child: Constants.favourites.length == 0
                  ? Container(
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
                            child: AnimatedTextKit(
                              isRepeatingAnimation: false,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  "Here you will find all of your favourite courses\n Hurry up and add courses to your favourite",
                                  textAlign: TextAlign.center,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2,
                                        height: 2,
                                      ),
                                  speed: const Duration(milliseconds: 200),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Constants.favourites.length == 1
                      ? Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: CarouselCard(
                            trackName: Constants.favourites[0]["track"],
                            name: Constants.favourites[0]["name"],
                            description: Constants.favourites[0]["des"],
                            logo: Constants.favourites[0]["logo"],
                            index: 0,
                            scrollControllers: scrollControllers,
                            where: "fav",
                            num: Constants.favourites[0]["num"],
                          ),
                        )
                      :  CarouselSlider.builder(
                          carouselController: carouselController,
                          itemCount: Constants.favourites.length,
                          itemBuilder: (context, index, n) {
                            return CarouselCard(
                              trackName: Constants.favourites[index]["track"],
                              name: Constants.favourites[index]["name"],
                              description: Constants.favourites[index]["des"],
                              logo: Constants.favourites[index]["logo"],
                              index: index,
                              scrollControllers: scrollControllers,
                              where: "fav",
                              num: Constants.favourites[index]["num"],
                            );
                          },
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                            aspectRatio: 4 / 3.9,
                            viewportFraction: 0.8,
                          ),
                        ),
            ),

          ],
        ),
      ),
      const SizedBox(height: 20),
    ],
  );
}
