import 'package:cv/views/widget/page_title.dart';
import 'package:cv/views//widget/animated_text.dart';
import 'package:cv/views/widget/react_button.dart';
import 'package:flutter/material.dart';

import '../../app_const.dart';
import '../../widget/base_page.dart';

final projects = [
  Project(
    imagePath: "image/projects/pinance.png",
    name: "Pinance - exchange rates",
    time: "12/2022 - 01/2023",
    code: "code",
    release: "release",
    technologies: ["RestApi,", "a Local store"],
  ),
  Project(
    imagePath: "image/projects/translate.png",
    name: "Translate",
    time: "01/2023 - 01/2023",
    code: "code",
    release: "release",
    technologies: ["RestApi", "a Local store", "Provider"],
  ),
  Project(
    imagePath: "image/projects/eshop.png",
    name: "E-shop",
    time: "02/2023 - 02/2023",
    code: "code",
    release: "release",
    technologies: ["Firebase", "Provider", "Dynamic link", "MVC architecture"],
  ),
  Project(
    imagePath: "image/projects/almahbub.png",
    name: "Al Mahbub - online store",
    time: "01/2023 - Present",
    code: "code",
    release: "release",
    technologies: [
      "Firebase",
      "a Local store",
      "Provider",
      "Dynamic link",
      "DDD architecture",
      "Yandex map"
    ],
  ),
];

class ProjectsPage extends StatefulWidget {
  ProjectsPage(GlobalKey key) : super(key: key);

  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  Widget _buildCompany(Project project) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              height: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 5 / 4,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Text(
                            project.time,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                      ReactButton(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.grey.withAlpha(24),
                          child: Image.asset(project.imagePath,
                              fit: BoxFit.fitHeight, height: 70),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            AnimatedText(
              text: project.name,
              onTap: () {},
            ),
          ],
        ),
        SizedBox(width: 12)
      ],
    );
  }

  Widget _buildCompanies() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: HORIZONTAL_PAGE_PADDING),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: projects.reversed.map((e) => _buildCompany(e)).toList(),
      ),
    );
  }

  Widget build(BuildContext context) {
    return BasePage(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: VERTICAL_PAGE_PADDING,
              right: VERTICAL_PAGE_PADDING,
              top: VERTICAL_PAGE_PADDING,
            ),
            child: PageTitle("Personal Projects"),
          ),
          SizedBox(height: 64),
          _buildCompanies(),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

class Project {
  String imagePath;
  String name;
  String time;
  String code;
  String release;
  List<String> technologies;

  Project({
    required this.imagePath,
    required this.name,
    required this.time,
    required this.code,
    required this.release,
    required this.technologies,
  });
}
