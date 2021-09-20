import 'package:flutter/material.dart';
import 'package:pixels/widgets/star_widget.dart';

class TracksHeader extends StatelessWidget {
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
          Hero(
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
