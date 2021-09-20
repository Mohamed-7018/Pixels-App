import 'package:flutter/material.dart';
import 'package:pixels/pages/info/components/info_header.dart';
import 'package:pixels/widgets/blur_filter.dart';
import 'package:pixels/widgets/star_widget.dart';
import '../../../constants.dart';

class InfoBoxOne extends StatelessWidget {
  final PageController controller;

  const InfoBoxOne({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
/*---------------------------------------------------------------------------------------*/
/*------------------------------------  Pixels Logo  ------------------------------------*/
/*---------------------------------------------------------------------------------------*/
          InfoHeader(),
/*---------------------------------------------------------------------------------------*/
/*------------------------------------  Pixels Star  ------------------------------------*/
/*---------------------------------------------------------------------------------------*/
          Hero(
            tag: 'pixelsStar',
            transitionOnUserGestures: true,
            child: Material(
              color: Colors.transparent,
              child: StarWidget(size: (size.height > 600) ? 60 : 50),
            ),
          ),
          const SizedBox(height: 10),
/*---------------------------------------------------------------------------------------*/
/*--------------------------------  Pixels Circle Info  ---------------------------------*/
/*---------------------------------------------------------------------------------------*/
          BlurFilter(
            sigma: 8,
            borderRadius: BorderRadius.circular(200),
            child: Container(
              width: (size.height > 600) ? size.width * 0.9 : size.width * 0.85,
              height:
                  (size.height > 600) ? size.width * 0.9 : size.width * 0.85,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "PIXELS",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    "is a non-profit organization established in faculty of Engineering in Helwan University in 2014, empowers individuals technically, academically and the required knowledge and projects in different engineering fields.",
                    style: TextStyle(
                      height: 1.7,
                      wordSpacing: 0.8,
                      letterSpacing: 1,
                      fontSize: (size.height > 600)
                          ? Theme.of(context).textTheme.subtitle1.fontSize
                          : Theme.of(context).textTheme.subtitle2.fontSize,
                    ),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          SizedBox(height: (size.height > 600) ? 30 : 20),
/*---------------------------------------------------------------------------------------*/
/*-----------------------------------  Arrow Down Btn  ----------------------------------*/
/*---------------------------------------------------------------------------------------*/
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Constants.color2, width: 3.5),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_downward_outlined),
              onPressed: () {
                controller.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.fastOutSlowIn,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
