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
  // var _type = RegistrationType.Home;
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
              // MediaQuery.of(context).size.height > 700 ? EveryPixelIsAKnowledgeHeaderBox(color: Colors.transparent) : Container(),
              //  _switchStudyMode(context),
               // _type == RegistrationType.Home ?
                _home(context),
              //  _contact(context),
                HintCircle(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // _switchStudyMode (context) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       MaterialButton(
  //         minWidth: MediaQuery.of(context).size.width * 0.35,
  //         padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
  //         child: Text(
  //           'Home',
  //           style: Theme.of(context).textTheme.button.copyWith(
  //             color: (_type == RegistrationType.Home)
  //                 ? Colors.black
  //                 : Colors.white,
  //           ),
  //         ),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.only(
  //             topRight: Radius.circular(35),
  //             bottomLeft: Radius.circular(35),
  //           ),
  //         ),
  //         color: (_type == RegistrationType.Home)
  //             ? Color(0xFFFFDFDF)
  //             : Colors.redAccent,
  //         onPressed: () {
  //           setState(() {
  //             makeDiscs();
  //             _type = RegistrationType.Home;
  //           });
  //         },
  //       ),
  //       const SizedBox(width: 5),
  //       MaterialButton(
  //         minWidth: MediaQuery.of(context).size.width * 0.35,
  //         padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
  //         child: Text(
  //           'Contact us',
  //           style: Theme.of(context).textTheme.button.copyWith(
  //             color: (_type == RegistrationType.Contact)
  //                 ? Colors.black
  //                 : Colors.white,
  //           ),
  //         ),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(35),
  //             bottomRight: Radius.circular(35),
  //           ),
  //         ),
  //         color: (_type == RegistrationType.Contact)
  //             ?Color(0xFFFFDFDF)
  //             : Colors.redAccent,
  //         onPressed: () {
  //           setState(() {
  //             makeDiscs();
  //             _type = RegistrationType.Contact;
  //           });
  //         },
  //       ),
  //     ],
  //   );
  // }



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

        // Column(
        //   children: [
        //     OutlinedButton(
        //       child: const Text(
        //         'Courses Resources',
        //         style: const TextStyle(color: Colors.white),
        //         softWrap: true,
        //       ),
        //       style: OutlinedButton.styleFrom(
        //         side: BorderSide(color: Constants.color2, width: 2),
        //         padding: const EdgeInsets.symmetric(
        //             horizontal: 30, vertical: 12),
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(10)),
        //       ),
        //       onPressed: () {
        //         circularNavigate(
        //           context,
        //           page: CourcesResourcesPage(),
        //           offset: Offset(size.width / 2, size.height / 2),
        //         );
        //       },
        //     ),
        //     OutlinedButton(
        //       child: const Text(
        //         'Pixels News',
        //         style: const TextStyle(color: Colors.white),
        //         softWrap: true,
        //       ),
        //       style: OutlinedButton.styleFrom(
        //         side: BorderSide(color: Constants.color2, width: 2),
        //         padding: const EdgeInsets.symmetric(
        //             horizontal: 30, vertical: 12),
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(10)),
        //       ),
        //       onPressed: () {
        //         circularNavigate(
        //           context,
        //           page: NewsPage(),
        //           offset: Offset(size.width / 2, size.height / 2),
        //         );
        //       },
        //     ),
        //     OutlinedButton(
        //       child: const Text(
        //         'online Courses Excel Sheet',
        //         style: const TextStyle(color: Colors.white),
        //         softWrap: true,
        //       ),
        //       style: OutlinedButton.styleFrom(
        //         side: BorderSide(color: Constants.color2, width: 2),
        //         padding: const EdgeInsets.symmetric(
        //             horizontal: 30, vertical: 12),
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(10)),
        //       ),
        //       onPressed: () {
        //         circularNavigate(
        //           context,
        //           page: NoorExcelSheetPage(),
        //           offset: Offset(size.width / 2, size.height / 2),
        //         );
        //       },
        //     ),
        //   ],
        // ),
      ],
    );
  }


  // _contact (BuildContext context) {
  //   return BlurFilter(
  //     sigma: 5.0,
  //     borderRadius: BorderRadius.only(
  //         topRight: Radius.circular(20),
  //         bottomLeft: Radius.circular(20)),
  //     child: Container(
  //       width: MediaQuery.of(context).size.width*0.9,
  //       padding: const EdgeInsets.symmetric(vertical: 15),
  //       // decoration: BoxDecoration(
  //       //   borderRadius: BorderRadius.circular(35),
  //       //   //color: Constants.color2, //Colors.white.withOpacity(0.65),
  //       // ),
  //       decoration: BoxDecoration(
  //         border: Border.all(color: Colors.pink[700], width: 2),
  //         borderRadius: BorderRadius.only(
  //             topRight: Radius.circular(20),
  //             bottomLeft: Radius.circular(20)),
  //         //color: Colors.white.withOpacity(0.2),
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 15),
  //         child: Column(
  //           children: [
  //             SizedBox(
  //               height: 20,
  //             ),
  //             Text(
  //               "Pixels Contacts",
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 27,
  //               ),
  //             ),
  //             Divider(
  //               thickness: 2,
  //               height: 20,
  //               color: Colors.pink[800],
  //             ),
  //             _buildOptionIcons(context: context),
  //             SizedBox(
  //               height: 5,
  //             ),
  //             Padding(
  //               padding: EdgeInsets.only(top: 5.0),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: <Widget>[
  //                   Container(
  //                     decoration: BoxDecoration(
  //                       gradient: new LinearGradient(
  //                           colors: [
  //                             Colors.white10,
  //                             Colors.white,
  //                           ],
  //                           begin: const FractionalOffset(0.0, 0.0),
  //                           end: const FractionalOffset(1.0, 1.0),
  //                           stops: [0.0, 1.0],
  //                           tileMode: TileMode.clamp),
  //                     ),
  //                     width: 100.0,
  //                     height: 1.0,
  //                   ),
  //                   Padding(
  //                     padding: EdgeInsets.only(left: 15.0, right: 15.0),
  //                     child: Text(
  //                       "Or",
  //                       style: TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 16.0,
  //                           fontFamily: "WorkSansMedium"),
  //                     ),
  //                   ),
  //                   Container(
  //                     decoration: BoxDecoration(
  //                       gradient: new LinearGradient(
  //                           colors: [
  //                             Colors.white,
  //                             Colors.white10,
  //                           ],
  //                           begin: const FractionalOffset(0.0, 0.0),
  //                           end: const FractionalOffset(1.0, 1.0),
  //                           stops: [0.0, 1.0],
  //                           tileMode: TileMode.clamp),
  //                     ),
  //                     width: 100.0,
  //                     height: 1.0,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(
  //               height: 5,
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 15.0)
  //                   .copyWith(bottom: 8.0),
  //               child: Row(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   BlurFilter(
  //                     sigma: 5.0,
  //                     borderRadius: BorderRadius.only(
  //                         topLeft: Radius.circular(20),
  //                         bottomRight: Radius.circular(20)),
  //                     child: TextButton(
  //                       style: TextButton.styleFrom(
  //                         padding: const EdgeInsets.symmetric(
  //                             vertical: 8.0),
  //                         shape: RoundedRectangleBorder(
  //                           side: BorderSide(
  //                               color: Colors.pink[700],
  //                               width: 2),
  //                           borderRadius: BorderRadius.only(
  //                               topLeft: Radius.circular(20),
  //                               bottomRight: Radius.circular(20)),
  //                         ),
  //                         backgroundColor:
  //                         Colors.white.withOpacity(0.2),
  //                       ),
  //                       child: Text(
  //                         "  Write a Feedback  ",
  //                         style: TextStyle(
  //                             color: Colors.greenAccent,
  //                             fontSize: 30.0),
  //                       ),
  //                       onPressed: (){
  //                         doorNavigateToPage(context, page: FeedbackScreen());
  //                       },
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }




  // Widget _buildOptionIcons({@required BuildContext context}) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Container(
  //         decoration: BoxDecoration(
  //           color: Colors.indigo.withOpacity(0.3),
  //           borderRadius: BorderRadius.circular(30),
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.all(12.0),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               ActionIcon(
  //                 onTap: () {} ,
  //
  //                //---------------------Message function ---------------/
  //                 // async {
  //                 //   // Android
  //                 //   const uri = 'sms:+39 348 060 888?body=hello%20there';
  //                 //   if (await canLaunch(uri)) {
  //                 //     await launch(uri);
  //                 //   } else {
  //                 //     // iOS
  //                 //     const uri = 'sms:0039-222-060-888?body=hello%20there';
  //                 //     if (await canLaunch(uri)) {
  //                 //       await launch(uri);
  //                 //     } else {
  //                 //       throw 'Could not launch $uri';
  //                 //     }
  //                 //   }
  //                 // },
  //                 title: "github",
  //                 iconData: FeatherIcons.github,
  //                 color: Color(0xFF9599B3),
  //               ),
  //               Spacer(),
  //               ActionIcon(
  //                 onTap: () {
  //                 },
  //                 title: 'twitter',
  //                 iconData: FeatherIcons.twitter,
  //                 color:Color(0xFFD47FA6),
  //               ),
  //               Spacer(),
  //               ActionIcon(
  //                 onTap: () {},
  //                 title: "Instagram",
  //                 iconData: FeatherIcons.instagram,
  //                 color:Color(0xFF8856AC),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //       Divider(
  //         color: Colors.greenAccent,
  //         height: 24.0,
  //       ),
  //       Container(
  //         //height: height * 0.15,
  //         decoration: BoxDecoration(
  //           color: Colors.pink[800].withOpacity(0.3),
  //           borderRadius: BorderRadius.circular(30),
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.all(12.0),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               ActionIcon(
  //                 onTap: () {
  //                   launch("https://www.facebook.com/");
  //                 },
  //                 title: "Facebook",
  //                 iconData: FeatherIcons.facebook,
  //                 color: Color(0xFF8856AC),
  //               ),
  //               Spacer(),
  //               ActionIcon(
  //                 onTap: () {},
  //                 title: "website",
  //                 iconData: FeatherIcons.chrome,
  //                 color: Color(0xFF817889),
  //               ),
  //               Spacer(),
  //               ActionIcon(
  //                 onTap: () {},
  //                 title: "LinkedIn",
  //                 iconData: FeatherIcons.linkedin,
  //                 color: Color(0xFFD47FA6),
  //               ),
  //             ],
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }
}



