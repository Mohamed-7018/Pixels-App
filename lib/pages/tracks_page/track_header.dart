import 'package:flutter/material.dart';
import 'package:pixels/pages/home/feedback.dart';
import 'package:pixels/widgets/star_widget.dart';

import '../../widgets/navigation.dart';

class TracksHeader extends StatelessWidget {
  final isCoursesPage ;

  const TracksHeader({Key key, this.isCoursesPage = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            iconSize: 30,
            onPressed: () => Navigator.of(context).pop(),
          ),
          CircleAvatar(
            radius: (MediaQuery.of(context).size.height > 600)
                ? MediaQuery.of(context).size.width * 0.165
                : MediaQuery.of(context).size.width * 0.13,
            child: Hero(
              tag: 'pixelsAbout',
              transitionOnUserGestures: true,
              child: Image.asset('assets/pixels_white.png'),
            ),
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
          ),

          isCoursesPage ?  Hero(
              tag: 'pixelsStar',
              transitionOnUserGestures: true,
              // ignore: deprecated_member_use
              child:FlatButton(
                onPressed:  () {
                  circularNavigate(
                    context,
                    page: FeedbackScreen(),
                    offset: Offset(MediaQuery.of(context).size.width-50, 100),
                  );
                },
                child: Icon (Icons.flag_outlined, size: 30,),
              )
          ) : Hero(
            tag: 'pixelsStar',
            transitionOnUserGestures: true,
            child: Material(
              color: Colors.transparent,
              child: StarWidget(size: 50),
            ),
          ),
        ],
      ),
    );
  }
}
