import 'package:flutter/material.dart';
import 'package:todo_firebase/UI/Screen/HomeScreen/add_items.dart';
import 'package:todo_firebase/UI/Screen/HomeScreen/app_Bar.dart';
import 'package:todo_firebase/UI/Style/m_color.dart';

class AddScreen extends StatelessWidget {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: MyColor.bccolor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: MyColor.bccolor,
          title: MyAppBar(
            sectionName: ' CRUD',
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: AddItem(
              titleFocusNode: _titleFocusNode,
              descriptionFocusNode: _descriptionFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
