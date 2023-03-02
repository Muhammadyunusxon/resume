import 'package:cv/views/widget/base_page.dart';
import 'package:cv/views/widget/page_title.dart';
import 'package:flutter/material.dart';

import '../../app_const.dart';
import 'about_page.dart';

class MySkillPage extends StatefulWidget {
  MySkillPage(GlobalKey key) : super(key: key);

  @override
  _MySkillPageState createState() => _MySkillPageState();
}

class _MySkillPageState extends State<MySkillPage> {
  Widget _buildSkillItem(String skill) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11), color: Color(0xff989DA6)),
      child: Text(
        skill,
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 13, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      color: Colors.white,
      child: Padding(
        padding: PAGE_CONTENT_PADDING,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PageTitle("My skills"),
            SizedBox(height: 32),
            Text(
              SKILLS,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 24),
            LayoutBuilder(
              builder: (_, constrain) {
                final maxWidth = constrain.maxWidth;
                final widthForTablet = 500;
                final skillWidth =
                    maxWidth > widthForTablet ? (maxWidth - 24) / 2 : maxWidth;
                return Wrap(
                  spacing: 11,
                  runSpacing: 11,
                  children: skills.map((it) => _buildSkillItem(it)).toList(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

final skills = [
  "Flutter",
  "Dart",
  "RestApi",
  "Firebase",
  "Provider",
  "Clean architecture",
  "Google and Yandex map",
  "MVC architecture",
  "OOP",
  "Hive",
  "Bloc",
  "Cubit",
  "Python",
  "C",
  "MySQL",
  "Android Studio",
];
