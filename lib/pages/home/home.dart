import 'package:flutter/material.dart';

import 'package:pixels/widgets/dices.dart';
import 'package:pixels/pages/home/hint_circle.dart';
import 'package:pixels/pages/home/home_header.dart';

import 'package:pixels/widgets/three_buttons.dart';



enum RegistrationType { Home, Contact }

class Home extends StatefulWidget {
  static const String routeName = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox.expand(child: VariousDiscs()),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeHeader(isHome: true),
                _home(context),
                HintCircle(),
              ],
            ),
          ],
        ),
      ),
    );
  }




  _home ( BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: size.height*0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: InteractiveViewer(
                scaleEnabled: true,
                child: Image.asset(
                  'assets/pixels_comm.jpg',
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 25),
        ThreeMainButtons()
      ],
    );
  }

}



