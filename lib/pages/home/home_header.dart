import 'package:flutter/material.dart';
import 'package:pixels/pages/home/contacts.dart';
import 'package:pixels/pages/info/info.dart';
import 'package:pixels/widgets/blur_filter.dart';
import 'package:pixels/widgets/star_widget.dart';
import '../../constants.dart';
import '../../widgets/navigation.dart';

class HomeHeader extends StatelessWidget {
  final bool isHome;

  const HomeHeader({Key key, this.isHome = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          (isHome)
              ? IconButton(
                  icon: const Icon(Icons.info_outline_rounded),
                  iconSize: 50,
                  onPressed: () {
                    circularNavigate(
                      context,
                      page: PixelsInfo(),
                      offset: Offset(50, 100),
                    );
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  iconSize: 30,
                  onPressed: () => Navigator.of(context).pop(),
                ),
          isHome
              ? SizedBox(
                  width: 10,
                )
              : Container(),
          HomeLogo(),
          !isHome ? SizedBox(
            width: 5,
          ) : Container(),
          isHome
              ? Hero(
                  tag: 'pixelsStar',
                  transitionOnUserGestures: true,
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: () {
                      circularNavigate(
                        context,
                        page: PixelsMedia(),
                        offset:
                            Offset(MediaQuery.of(context).size.width - 50, 100),
                      );
                    },
                    child: ImageIcon(
                      AssetImage("assets/media.png"),
                      size: 50,
                    ),
                  ))
              : Hero(
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

/*-------------------------------------  Home Logo  -------------------------------------*/

class HomeLogo extends StatefulWidget {
  @override
  _HomeLogoState createState() => _HomeLogoState();
}

class _HomeLogoState extends State<HomeLogo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Constants.color2, width: 5),
      ),
      child: BlurFilter(
        sigma: 5,
        borderRadius: BorderRadius.circular(150),
        child: CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.1),
          maxRadius: MediaQuery.of(context).size.width * 0.15,
          child: Image.asset('assets/logo_white.png'),
        ),
      ),
    );
  }
}
