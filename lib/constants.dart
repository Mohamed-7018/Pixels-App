import 'package:flutter/material.dart';
import 'package:pixels/widgets/rounded_snack_bar.dart';
import 'package:pixels/widgets/show_alert_dialog.dart';
import 'package:sqflite/sqflite.dart';
import 'package:url_launcher/url_launcher.dart';

class Constants {
  static const List tracksNames = [
    'CS & Comms Track',
    'Power Track',
    'Mechanical Track'
  ];

  static const List tracksDiscription = [
    'CS & Comms Track\nComputer Science & Communications Track',
    'Power Track\nPower Engineering Track',
    'Mechanical Track\nMechanical Engineering Track',
  ];

  static const String facebookUrl =
      'https://graph.facebook.com/PixelsEgyptOrg?fields=about,posts{created_time,full_picture,message,message_tags,attachments{media_type,url,description,subattachments,media,title,type}}&access_token=EAAFZCTUhVuBYBAAt1LiEYCPDgxLOvvLClXLXnBxiVSfzd58cdn1rSVvQLdfJGXUatgKu7qeXd8GJKHVZA9wkejpsWTZB17DuZBFij0C4EIZCxGktRvzf21N12qfMzzqvHowKKlkKZArbZCIhQCt2o1wetYmmUYgYCY3EFaxjSXZCeQZDZD';

  static const String csTrackUrl =
      'https://script.google.com/macros/s/AKfycbylNc7htZoK5dAJN46e-yxfJD7YnYYmvo2xAdglcQv-YnDtGCH-TG-OGeC4Gx9twLHE/exec';
  static const String powerTrackUrl =
      'https://script.google.com/macros/s/AKfycbznQl9P4dNE98pUrbdcrdNZrMM0cC2Lzyc-jUaeGjE0Igeg6bg3U_ojpQ/exec';
  static const String mechanicalTrackUrl =
      'https://script.google.com/macros/s/AKfycbzwGx8IndHddTgIH5p3eDb1lDvwCKmFRS4ZNxMB3UfqgYDSsfaCmwPV/exec';

  static const List titles = ['We Learn', 'We Make', 'We Share'];
  static const List contents = [
    'Providing you the best courses\nLearning from posts everyday\nDevelop in electronics, mechanics, programming, electricity and energy',
    'Providing workshops\nMaking projects at every course\nJoining committees to make by your own',
    'Sharing the knowledge\nSharing new technology at courses\nSpreading our missions to all community',
  ];


  //-------------------------------------------------------------------/
  //----------------- Pixels Media Constants --------------------------/
  //-------------------------------------------------------------------/
  static const String facebookLink  = "https://www.facebook.com/PixelsEgyptOrg";
  static const String websiteLink = "https://pixelseg.com/home";
  static const String twitterLink = "https://twitter.com/PixelsEgypt?fbclid=IwAR2JhIu7UKPkn_EURR_oKDFX67_XFQvA7A_op7zXJDAaWjgPh9wS-OywVRU";
  static const String instagramLink = "https://www.instagram.com/pixelsegypt/?fbclid=IwAR2z6cjCXbdDLJWcQ4upcjKmzVsPVj7lCo01-IhgVtueKFSoL6CZabcNUuI";
  static const String githubLink = "https://github.com/Pixels-HU?fbclid=IwAR26vJWfd6FyRo4_5rUX8pxL5HWl00u7yLwyoZjqSwJY5JC5KrGw1QJgKik";
  static const String linkedInLink = "https://www.linkedin.com/company/pixelsegyptorg?fbclid=IwAR0M_iEfOa-E6-_HFEY1k7sHsZIlZsGhcDJaO1VCU3btO29-k2EqpPKzI0k";



  static Future<void> launchUniversalLink(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }

  static final color2 = Colors.pink[800];



  /***************************************************************/
  /************************** sqflite ****************************/
  ////***************************************************************/
  static Database  database;
  static List<Map> favourites =[];

  //// *************************************************************///
   // ******************************* local databse function **********//
/// ********************************************************************/




  static void createDatabase () async {
    database = await openDatabase(
        "pixelsCourses.db",
        version: 1,
        onCreate:  (database, version)
        {
          print ("database created");
          database.execute("CREATE TABLE favourites (id INTEGER PRIMARY KEY , track TEXT, name Text, des TEXT, num INTEGER, logo TEXT)").then((value)
          {
            print ("table created");
          }).catchError((error){
            print ("Error when creating database ${error.toString()}");
          });
        },
        onOpen:  (database)
        {
          print ("database opened");
          // Constants.insertToDatabase(trackName: "trial", courseName: "trial")
          //     .then((value) {
          //   print("Course added to favourite with success state");
          // });
          getDataFromDatabase(database).then((value) {
            favourites = value;
            print(favourites);
          });
        }
    );
  }


  static Future  insertToDatabase (BuildContext context, {@required String trackName , @required String courseName, @required des, @required int  index, @required logo}) {
    return database.transaction((txn) {
      txn.rawInsert('INSERT INTO favourites(track, name, des, num, logo) VALUES ("$trackName","$courseName", "$des", "$index", "$logo")').then((value) {
        print ("$value inserted to database successfully");
        roundedSnackBar(context,text: "Course added to favourite with success state");
      }).catchError((error) {
        Constants.confirmCopyLink(context, title: "Error !", content: "error while inserting the course to favourite list, If you think there is a a problem in the app please report a problem to fix it", defaultActionText: "Ok");
        print ("error while inserting ${error.toString()}");
      });
      return null;
    });
  }


  static Future< List <Map>> getDataFromDatabase (database) async{
  return await  database.rawQuery('SELECT * FROM favourites');
  }


  static void deleteDataFromDatabase (BuildContext context, {@required String name}) async {
    await database.rawDelete(
      'DELETE FROM favourites WHERE name = ?', ["$name"]
    ).then((value) {
      getDataFromDatabase(database);
      print ("deleted from database");
    }).catchError((error) {
      Constants.confirmCopyLink(context, title: "Error !", content: "error while deleting the course from your favourite list, If you think there is a a problem in the app please report a problem to fix it", defaultActionText: "Ok");
      print ("error while deleting ${error.toString()}");
    });
  }


  static Future<void> confirmCopyLink (BuildContext context, {String link, @required String title, @required String content , @required String defaultActionText, String cancelActionText }) async {
    final dialogRequestSignOut = await showAlertDialogue(context,
        title: title,
        content: content,
        defaultactiontext: defaultActionText,
        cancelactiontext:  cancelActionText,
    );
    if (dialogRequestSignOut == true && link !=null)  { Constants.launchUniversalLink(link);}
    else { }
  }
}
