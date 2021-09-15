import 'package:flutter/material.dart';
import 'package:todo_firebase/UI/Style/m_color.dart';

class MyAppBar extends StatelessWidget {
  final String sectionName;
  const MyAppBar({
    Key? key,
    required this.sectionName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "images/log.png",
          height: 20,
        ),
        SizedBox(width: 10),
        Text(
          'flutterFire',
          style: TextStyle(color: MyColor.fire, fontSize: 18),
        ),
        Text(
          '$sectionName',
          style: TextStyle(color: MyColor.orgin, fontSize: 18),
        ),
      ],
    );
  }
}
