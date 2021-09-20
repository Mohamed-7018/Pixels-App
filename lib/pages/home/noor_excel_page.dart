import 'package:flutter/material.dart';
import 'package:pixels/widgets/web_view.dart';


class NoorExcelSheetPage extends StatelessWidget {
  const NoorExcelSheetPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text("Pixels Online Courses") ,
        centerTitle: true,
      ),
      body: SafeArea (
        child: WebViewExample (
          link: 'https://docs.google.com/spreadsheets/u/1/d/e/2PACX-1vRzetMjrKtSigrMR5XI7UKbL2q1Owe4ZXjwjpIvMX4eHWdTjAXQ_pIuD7kLkhmIeFwnPwMexL3VB7d2/pubhtml?gid=0&single=true',
        ),
      ),
    );
  }
}
