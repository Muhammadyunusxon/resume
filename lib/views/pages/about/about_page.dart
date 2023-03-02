import 'package:cv/views/widget/page_title.dart';
import 'package:cv/views/pages/about/widgets.dart';
import 'package:flutter/material.dart';

import '../../app_const.dart';
import '../../widget/base_page.dart';
import '../../../domen/data/data.dart';

const INTRODUCE =
    "I am Muhammadyunusxon, I tried myself in several areas. And I chose the field of Mobile programming. I am currently a Flutter mobile developer";

const SKILLS = """
Flutter:
- Familiar with MVC, Clean architecture,...
- Familiar with Provider, RestApi, OOP, Firebase, Google map ...

Confident in Algorithm, OOP concepts, Design Pattern, SOLID principles,...
Proficient in using git.
""";

const AVATAR_SIZE = 108.0;

class AboutPage extends StatelessWidget {
  final VoidCallback? downloadCV;
  final VoidCallback? hireMe;

  AboutPage(GlobalKey key, this.downloadCV, this.hireMe) : super(key: key);

  bool _isTabletSize(double maxWidth) {
    return maxWidth > 4 * AVATAR_SIZE;
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Padding(
        padding: PAGE_CONTENT_PADDING,
        child: LayoutBuilder(
          builder: (_, constrain) {
            final maxWidth = constrain.maxWidth;
            final isTabletSize = _isTabletSize(maxWidth);
            const avatarSize = 108.0;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PageTitle("About Me"),
                SizedBox(height: 32),
                multiChildLayout(
                  forTablet: isTabletSize,
                  children: <Widget>[
                    SizedBox(width: 16),
                    SizedBox(
                      width: avatarSize,
                      height: avatarSize,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(Data.AVATAR),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(width: 36, height: 32),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Hello,",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(height: 24),
                          Text(
                            INTRODUCE,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 24),
                          LayoutBuilder(
                            builder: (_, constrains) => Wrap(
                              direction: Axis.horizontal,
                              children: Data.ABOUT_PAGE_INFO.entries
                                  .toList()
                                  .map(
                                    (pair) => SizedBox(
                                      width: constrains.maxWidth,
                                      child:
                                          buildInfoLine(pair.key, pair.value),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          SizedBox(width: 36, height: 16),
                          Wrap(
                            runSpacing: 12,
                            spacing: 12,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: <Widget>[
                              MaterialButton(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 42, vertical: 20),
                                onPressed: downloadCV,
                                color: SUB_COLOR,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(Icons.file_download,
                                        color: Colors.white, size: 16),
                                    SizedBox(width: 6),
                                    Text(
                                      "Download my CV",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              MaterialButton(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 42, vertical: 20),
                                onPressed: hireMe,
                                color: MAIN_COLOR,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      Icons.email,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      "Hire me",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
