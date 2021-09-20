import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pixels/models/track.dart';
import 'package:pixels/provider/bottom_navbar_provider.dart';
import 'package:pixels/provider/track_provider.dart';
import 'package:pixels/widgets/blur_filter.dart';
import 'package:pixels/widgets/dices.dart';
import 'package:pixels/widgets/loading.dart';
import 'package:pixels/widgets/navigation.dart';
import 'package:pixels/widgets/rounded_snack_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';
import '../../constants.dart';
import '../courses_data_page/courses_data_page.dart';

List<String> preferencesFavouriteName = [];

class Carousel extends StatefulWidget {
  final CarouselController carouselController;

  const Carousel({Key key, this.carouselController}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  var scrollControllers;

  @override
  Widget build(BuildContext context) {
    var track = Provider.of<TrackProvider>(context);
    return Positioned.fill(
      child: FutureBuilder<List<TrackModel>>(
        future: track.selectedTrack(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Loading());
          } else {
            List<TrackModel> data = snapshot.data;
            scrollControllers =
                List.generate(data.length, (index) => ScrollController());
            return CarouselSlider.builder(
              carouselController: widget.carouselController,
              itemCount: data.length,
              itemBuilder: (context, index, n) {
                if (index == 0) {
                  return IgnorePointer(child: const SizedBox());
                } else {
                  return CarouselCard(
                    trackName: Constants.tracksNames[track.trackType],
                    name: data[index].name,
                    description: data[index].description,
                    logo: data[index].logo,
                    index: index,
                    scrollControllers: scrollControllers,
                  );
                }
              },
              options: CarouselOptions(
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                aspectRatio: 4 / 3.9,
                viewportFraction: 0.8,
                onScrolled: (value) {
                  setState(() {
                    makeDiscs();
                  });
                },
              ),
            );
          }
        },
      ),
    );
  }
}

class CarouselCard extends StatefulWidget {
  final String name;
  final String description;
  final String logo;
  final int index;
  final List scrollControllers;
  final String trackName;
  final String where;
  final int num;

  const CarouselCard(
      {Key key,
      this.name,
      this.description,
      this.logo,
      this.index,
      this.num,
      this.where,
      @required this.trackName,
      this.scrollControllers})
      : super(key: key);

  @override
  _CarouselCardState createState() => _CarouselCardState();
}

class _CarouselCardState extends State<CarouselCard> {
  //bool _isFavourite = false;
  bool _isDeleted = false;
  bool _isExist = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cPage = Provider.of<BottomNavBarProvider>(context);
    var track = Provider.of<TrackProvider>(context);
    for (var i =0 ; i<Constants.favourites.length; i++) {
      if (Constants.favourites[i]["name"] == widget.name) {
        setState(() {
          _isExist = true;
        });
        break;
      }
    }
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: BlurFilter(
            borderRadius: BorderRadius.circular(20),
            sigma: 8,
            child: Container(
              width: size.width,
              height: size.height * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.2),
              ),
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  const SizedBox(height: 60),
/*---------------------------------------------------------------------------------------------*/
/*---------------------------------------  Course Name  ---------------------------------------*/
/*---------------------------------------------------------------------------------------------*/
                  Text(
                    widget.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
/*---------------------------------------------------------------------------------------------*/
/*---------------------------------------  Description  ---------------------------------------*/
/*---------------------------------------------------------------------------------------------*/
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.35),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 1.3,
                        ),
                      ),
                      child: VsScrollbar(
                        controller: widget.scrollControllers[widget.index],
                        showTrackOnHover: true,
                        isAlwaysShown: true,
                        scrollbarFadeDuration:
                            const Duration(milliseconds: 500),
                        scrollbarTimeToFade: const Duration(milliseconds: 500),
                        style: VsScrollbarStyle(
                          hoverThickness: 10.0,
                          radius: Radius.circular(10),
                          thickness: 6.0,
                          color: Constants.color2,
                        ),
                        child: ListView(
                          controller: widget.scrollControllers[widget.index],
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.description,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                      height: 1.5,
                                      wordSpacing: 1.2,
                                    ),
                                textAlign: TextAlign.center,
                                softWrap: true,
                                textWidthBasis: TextWidthBasis.parent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

/*---------------------------------------------------------------------------------------------*/
/*------------------------------------  See Resources Btn  ------------------------------------*/
/*---------------------------------------------------------------------------------------------*/
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: FractionallySizedBox(
                      widthFactor: 0.95,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 12,
                          ),
                          backgroundColor: Constants.color2.withOpacity(0.8),
                        ),
                        onPressed: () {
                          print(widget.trackName);
                          if (widget.where == "fav") {
                            if (widget.trackName == "CS & Comms Track") {
                              setState(() {
                                track.setTrackType(0);
                              });
                              cPage.setCurrentPage(0);
                              circularNavigate(
                                context,
                                page: CoursesDataPage(
                                    indexOfSelectedCourse: widget.num),
                                offset: Offset(
                                  size.width / 2,
                                  size.height,
                                ),
                              );
                            } else if (widget.trackName == 'Power Track') {
                              setState(() {
                                track.setTrackType(1);
                              });
                              cPage.setCurrentPage(0);
                              circularNavigate(
                                context,
                                page: CoursesDataPage(
                                    indexOfSelectedCourse: widget.num),
                                offset: Offset(
                                  size.width / 2,
                                  size.height,
                                ),
                              );
                            } else if (widget.trackName == 'Mechanical Track') {
                              setState(() {
                                track.setTrackType(2);
                              });
                              cPage.setCurrentPage(0);
                              circularNavigate(
                                context,
                                page: CoursesDataPage(
                                    indexOfSelectedCourse: widget.num),
                                offset: Offset(
                                  size.width / 2,
                                  size.height,
                                ),
                              );
                            }
                          } else {
                            if (widget.trackName == "CS & Comms Track") {
                              setState(() {
                                track.setTrackType(0);
                              });
                              cPage.setCurrentPage(0);
                              circularNavigate(
                                context,
                                page: CoursesDataPage(
                                    indexOfSelectedCourse: widget.index),
                                offset: Offset(
                                  size.width / 2,
                                  size.height,
                                ),
                              );
                            } else if (widget.trackName == 'Power Track') {
                              setState(() {
                                track.setTrackType(1);
                              });
                              cPage.setCurrentPage(0);
                              circularNavigate(
                                context,
                                page: CoursesDataPage(
                                    indexOfSelectedCourse: widget.index),
                                offset: Offset(
                                  size.width / 2,
                                  size.height,
                                ),
                              );
                            } else if (widget.trackName == 'Mechanical Track') {
                              setState(() {
                                track.setTrackType(2);
                              });
                              cPage.setCurrentPage(0);
                              circularNavigate(
                                context,
                                page: CoursesDataPage(
                                    indexOfSelectedCourse: widget.index),
                                offset: Offset(
                                  size.width / 2,
                                  size.height,
                                ),
                              );
                            }
                          }
                        },
                        child: const Text(
                          'See Resources',
                          style: const TextStyle(color: Colors.white),
                          softWrap: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
/*---------------------------------------------------------------------------------------------*/
/*---------------------------------------  Course Logo  ---------------------------------------*/
/*---------------------------------------------------------------------------------------------*/
        Positioned(
          top: (size.height > 600) ? -30 : 0,
          left: 0,
          right: 0,
          child: CircleAvatar(
            radius: 38,
            backgroundColor: Constants.color2,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.logo == ''
                    ? FlutterLogo()
                    : Image.network(
                        widget.logo,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 15,
          right: 30,
          child: widget.where == "fav"
              ? IconButton(
                  onPressed: () {
                    Constants.deleteDataFromDatabase(context, name: widget.name);
                    setState(() {
                      _isDeleted = true;
                    });
                    roundedSnackBar(context,text: "Course removed from favourite with success state");
                  },
                  icon: _isDeleted
                      ? Icon(Icons.bookmark_border_outlined)
                      : Icon(Icons.bookmark),
                  iconSize: 30,
                )
              : IconButton(

                  onPressed: () {
                    // Constants.insertToDatabase(
                    //     trackName: widget.trackName,
                    //     courseName: widget.name,
                    //     des: widget.description,
                    //     logo: widget.logo,
                    //     index: widget.index)
                    //     .then((value) {
                    //   setState(() {
                    //     _isFavourite = true;
                    //   });
                    //
                    //   Constants.getDataFromDatabase(Constants.database)
                    //       .then((value) {
                    //     Constants.favourites = value;
                    //     // print(Constants.favourites);
                    //     roundedSnackBar(context,text: "Course added to favourite with success state");
                    //
                    //   });
                    // });
                    // for (var i =0 ; i<Constants.favourites.length; i++) {
                    //   if (Constants.favourites[i]["name"] == widget.name) {
                    //     setState(() {
                    //       _isExist = true;
                    //     });
                    //     break;
                    //   }
                    // }

                   if ( _isExist ==  false )  {
                     Constants.insertToDatabase(
                       context,
                         trackName: widget.trackName,
                         courseName: widget.name,
                         des: widget.description,
                         logo: widget.logo,
                         index: widget.index)
                         .then((value) {
                       setState(() {
                         _isExist = true;
                       });

                       Constants.getDataFromDatabase(Constants.database)
                           .then((value) {
                         Constants.favourites = value;
                         // print(Constants.favourites);

                       });
                     });
                    } else {
                   // Constants.confirmCopyLink(context, title: "Existing Course", content: "The Course is already existing in your bookmarks list,to delete it please go to the bookmarks list and delete it then refresh the app", defaultActionText: "Ok");
                     Constants.deleteDataFromDatabase(context, name: widget.name);
                     setState(() {
                       _isExist = false;
                     });
                     roundedSnackBar(context,text: "Course removed from favourite with success state");
                   }
                  },
                  icon: //Icon (Icons.add),
                  _isExist ==true
                      ? Icon(Icons.bookmark)
                      : Icon(Icons.bookmark_border_outlined),
                  iconSize: 30,
                ),
        ),
      ],
    );
  }

  Future<String> best(name) async {
    print(name);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    /**********************************************************/
    /*********************** writing data *********************/
    /**********************************************************/
    preferencesFavouriteName.add(name.toString());

    prefs.setStringList("Pixels Book Mark", preferencesFavouriteName);
    return "done";
  }

}
