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
      height: MediaQuery.of(context).size.height * 0.65,
      child: Theme(
        data: Theme.of(context).copyWith(
          accentColor: const Color(0xFFFCB69F).withOpacity(0.2),
        ),
        child: Center(
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
      const Step(step: 1, title: 'RGB Pixel', message: '''
        كلنا طول الوقت بنبص على شاشات (موبايل، لابتوب، الخ) وسمعنا مصطلح resolution او الكاميرا دية كام ميجا بيكسل.
في الأساس الPixel هي اصغر جزء بيكون الصوره الرقمية، فا أي صوره عشان تكمل محتاج يكون فيها Pixels كتير، و كل Pixel من دول بيتكون من 3 الوان اساسيه هي الي بتدي اللون النهائي (Red-Green-Blue) او اختصارا RGB وده اختيارنا لأسم الايفنت.
احنا في بيكسلز شايفين ان كل شخص ممكن يكون عنده اكتر من لون و معرفه باكتر من مجال وده الي بيميز كل واحد فينا، و هنديلك الفرصة انك تعرف اكتر عن كل مجال و كل سوق عمل من خلال مجموعة الكورسات الي هنوفرهالك و تقدر تشارك معانا فيها.
All of us spend most of our times looking at screens (phones, laptop, etc.) and are familiar with the term “resolution” or how much megapixels this camera is.
A pixel is the smallest building unit of a digital picture, and each picture needs many pixels, each pixel itself consists of 3 main colors that give each pixel its unique color (Red-Green-Blue) or for short RGB.
We at pixels believe that each is as unique as a different pixel with knowledge in multiple paths, and we’re giving you the opportunity to colorize your own pixel with our courses.
        '''),
      const Step(
          step: 2,
          title: 'PSC',
          message: '“Don’t be a programmer”\n'
              'Many people in the world can code, but the whole notion of why someone got into programming has completely changed. The world doesn’t give a damn about whether you’re good in Java, Go, python or C++ as long as you can’t solve any real-world problem.\n'
              'In pixels’22 we give you the chance to practice more and more by organizing a problem solving contest.The contest is divided into two main levels.\n'),
      const Step(
          step: 3, title: 'Google HashCode | Pixels\'22 hub', message: '''
        حلم الشغل في جوجل مش بعيد, لأن شركة جوجل مقدمه فرصة للطلاب في أوروبا و الشرق الأوسط انهم يتنافسوا في مسابقة Google HashCode.
طب ايه هي HashCode الأول؟
- هي عبارة عن مسابقة على مستوى العالم في الProblem Solving ، وده عبارة عن مسائل أو مشكلة انت بتحاول تحلها باستخدام أي لغة برمجة بتعرف تشتغل بيها او تفضلها، و المسابقة فكرتها انك بتكون Team من 2 ل 4 أشخاص و تبدأوا تحلوا المسائل مع بعض بأي لغة برمجة انتم تختاروها.
- افضل واقوي الفرق هيتم دعوتهم للمشاركه في نهائيات العالم.
- اول خطوه انك تسجل من هنا:
https://codingcompetitions.withgoogle.com/hashcode
- JOIN OUR PIXELS’22 HUB NOW!
*When Registering teams don’t forget to choose our hub*
أخر معاد للتسجيل 23/2/2022 الساعة 1:00 ظهراً.

- المسابقة ستكون يوم 24/2/2022 من الساعة 7:30 مساءً وحتى 11:30 مساءً.

Visiting and working at Google is now one step closer to you, Google Hashcode is coming back to Pixels this year!!
Hash Code is a team-programming competition created by Google for students across Europe and the Middle East to allow them to participate in a worldwide challenge through a local hub.
        '''),
      const Step(
        step: 4,
        title: 'PIXERA 6.0 - Potential',
        message: '''
        Nothing is indifferent, nothing is powerless in the universe; Choose your crystal, use your potential, and get your full power.
This time we’re going big with our mega Event “PIXERA 6.0”.
This is when and where we share every knowledge, project, feeling, photo, and research with you.
Do not miss the opportunity to share a moment with us and to know more about our courses, workshops, and news.
        ''',
      ),
      const Step(
        step: 5,
        title: 'RBM V2.0 - Retrofit',
        message: '''
        RBM stands for:
Robotics Bound Makers
RBM is a public robotics competition that helps students to implement knowledge and fabrication principles and make students think about real industry problems.
Aims to increase makers' community and strengthen the making path through Electronics, Mechanical, and Fabrication workshops.
That's what we said makers,
There is a lot of practical work and application, using machines can be the first time you use them.
The competition simulates a line follower factory robot. This robot can solve one of the problems of reality going through many consequences until reaching the end point. we apply all the lessons we have learned so that we can make a robot that solves the problem and can compete with the rest of the contestants.
        ''',
      ),
      const Step(
          step: 6,
          title: 'Academic Juniors',
          message:
              ' Organizing the technical engineering sessions in schools.'),
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
            return TimelineDivider(
              color: Constants.color2, //Color(0xFFCB8421),
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
            beforeLineStyle: LineStyle(
              color: Constants.color2, //Color(0xFFCB8421),
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
      decoration: BoxDecoration(
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
                  )),
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
