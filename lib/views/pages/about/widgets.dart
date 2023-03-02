import 'package:flutter/material.dart';


Widget multiChildLayout({
  required bool forTablet,
  required List<Widget> children,
}) {
  Widget result;
  if (!forTablet) {
    result = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  } else {
    result = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
  return result;
}

Widget buildInfoLine(String field, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: RichText(
      text: TextSpan(children: [
        TextSpan(
          text: "$field: ",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        TextSpan(
          text: value,
          style: TextStyle(color: Colors.black87, fontSize: 14),
        ),
      ]),
    ),
  );
}
