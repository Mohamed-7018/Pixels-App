import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../constants.dart';
import '../../../widgets/blur_filter.dart';
import '../../news/post_boxes/post_description.dart';

class SuccessTimeline extends StatefulWidget {
  @override
  _SuccessTimelineState createState() => _SuccessTimelineState();
}

class _SuccessTimelineState extends State<SuccessTimeline> {
  List<Step> _steps;

  @override
  void initState() {
    _steps = _generateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.65,
      child: Theme(
        data: Theme.of(context).copyWith(
          accentColor: const Color(0xFFFCB69F).withOpacity(0.2),
        ),
        child:  Center(
            child: Column(
              children: <Widget>[
                _Header(),
                Expanded(
                  child: CustomScrollView(
                    slivers: <Widget>[_TimelineSteps(steps: _steps)],
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),

    );
  }

  List<Step> _generateData() {
    return <Step>[
      const Step(
        step: 1,
        title: 'GAP',
        message:
        "What we learn and what we know, are we really using this knowledge and technical skills to its full potential?\n"
            'May be it is hard to invest the time to think to make a solution, but it is harder to make a creative and innovative one.\n'
            "By making this great achievement we can really close the gap!",
      ),
      const Step(
        step: 2,
        title: 'Pixels’21 Hub | Google Hash Code V4',
        message:
        'Do you want to work in Google!!\n'
         " Do you think you have enough programming skills to work in oogle!!\n"
      "Have you ever been dreaming of visiting google and even getting the opportunity to work there.\n"
          "It’s your chance...you are one step away!\n"
      "Google hashcode is coming to Pixels for the fourth year!\n"
      "Google hashcode is Google’s team-based programming competition, it allows you to share your skills and connect with other coders as you work together to solve a problem modeled off a real Google engineering challenge! In small teams of two to four, coders all over the world will tackle the first problem through Online Qualifications.\n"
         " Though this round is hosted online, teams can come together virtually to compete side-by-side in locally coordinated Hash Code Hubs.\n"
      "The top teams from this round are invited to join us for the virtual World Finals.",
      ),
      const Step(
        step: 3,
        title: 'RBM',
        message:
        '“ There is no glory in practice but without practice there is no glory “\n'
        '  Pixels believe that practice is the best way to achieve excellence, as excellence is not an art, it is the habit of practice. In pixels’21 we want to take the practice to another level!\n'
     ' We are glad to announce that we are organizing a robotics competition and add it to our great course. The event name is RBM.\n'
    '  RBM is the first competition of its type in pixels. We are so glad to add such a great event to our wonderful workshops.'

      ),
      const Step(
        step: 4,
        title: 'PSC',
        message:
        '“Don’t be a programmer”\n'
          'Many people in the world can code, but the whole notion of why someone got into programming has completely changed. The world doesn’t give a damn about whether you’re good in Java, Go, python or C++ as long as you can’t solve any real-world problem.\n'
      'In pixels’21 we give you the chance to practice more and more by organizing a problem solving contest.The contest is divided into two main levels.\n'

      ),
      const Step(
        step: 5,
        title: 'Start & Hunt: Way To Career',
        message:
        'Reaching success starts with building your personality.\n'
         ' Pixels is giving you the opportunity to decide what you’re looking for and plan your future.\n'
      'Online talks will be given by experts sharing their knowledge and experience in many fields and more to come.\n',
      ),
      const Step(
        step: 6,
        title: 'PIXERA 5.0: Neutrons',
        message:"Nothing is indifferent, nothing is powerless in the universe; an atom might destroy everything, an atom might save everything.\n"
            "Even though, this time we’re going big with our mega Event “PIXERA”."
            "This is when and where we share every knowledge, project, feeling, photo and research with you.\n"
            "Do not miss the opportunity to share a moment with us and to know more about our courses, workshops and news.\n"
            'As Atoms taught us that, every little thing does count, even a single NEUTRON.\n'
      ),
      const Step(
        step: 7,
        title: 'Academic Juniors',
        message:
        ' Organizing the technical engineering sessions in schools.'
      ),
    ];
  }
}

class _TimelineSteps extends StatelessWidget {
  const _TimelineSteps({Key key, this.steps}) : super(key: key);

  final List<Step> steps;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          if (index.isOdd)
            return  TimelineDivider(
              color: Constants.color2,//Color(0xFFCB8421),
              thickness: 5,
              begin: 0.1,
              end: 0.9,
            );

          final int itemIndex = index ~/ 2;
          final Step step = steps[itemIndex];

          final bool isLeftAlign = itemIndex.isEven;

          final child = _TimelineStepsChild(
            title: step.title,
            subtitle: step.message,
            isLeftAlign: isLeftAlign,
          );

          final isFirst = itemIndex == 0;
          final isLast = itemIndex == steps.length - 1;
          double indicatorY;
          if (isFirst) {
            indicatorY = 0.2;
          } else if (isLast) {
            indicatorY = 0.8;
          } else {
            indicatorY = 0.5;
          }

          return TimelineTile(
            alignment: TimelineAlign.manual,
            endChild: isLeftAlign ? child : null,
            startChild: isLeftAlign ? null : child,
            lineXY: isLeftAlign ? 0.1 : 0.9,
            isFirst: isFirst,
            isLast: isLast,
            indicatorStyle: IndicatorStyle(
              width: 40,
              height: 40,
              indicatorXY: indicatorY,
              indicator: _TimelineStepIndicator(step: '${step.step}'),
            ),
            beforeLineStyle:  LineStyle(
              color: Constants.color2,//Color(0xFFCB8421),
              thickness: 5,
            ),
          );
        },
        childCount: max(0, steps.length * 2 - 1),
      ),
    );
  }
}

class _TimelineStepIndicator extends StatelessWidget {
  const _TimelineStepIndicator({Key key, this.step}) : super(key: key);

  final String step;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        shape: BoxShape.circle,
        color: Constants.color2, //Color(0xFFCB8421),
      ),
      child: Center(
        child: Text(
          step,
          style: GoogleFonts.architectsDaughter(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _TimelineStepsChild extends StatelessWidget {
  const _TimelineStepsChild({
    Key key,
    this.title,
    this.subtitle,
    this.isLeftAlign,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final bool isLeftAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isLeftAlign
          ? const EdgeInsets.only(right: 32, top: 16, bottom: 16, left: 10)
          : const EdgeInsets.only(left: 32, top: 16, bottom: 16, right: 10),
      child: Column(
        crossAxisAlignment:
        isLeftAlign ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            textAlign: isLeftAlign ? TextAlign.right : TextAlign.left,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 16),
          BlurFilter(
            sigma: 8,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              bottomLeft: Radius.circular(40),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                  border: Border.all(
                    color: Constants.color2,
                  )
              ),
              child: PostDescription(description: subtitle),

            ),
          ),
          // Text(
          //   subtitle,
          //   textAlign: isLeftAlign ? TextAlign.right : TextAlign.left,
          //   style: GoogleFonts.architectsDaughter(
          //     fontSize: 16,
          //     color: const Color(0xFFFFFFFF),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              'Pixels\'21 Successful Events',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5.copyWith(
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Step {
  const Step({
    this.step,
    this.title,
    this.message,
  });

  final int step;
  final String title;
  final String message;
}
