import 'package:flutter/material.dart';
import 'package:todo_firebase/UI/Screen/HomeScreen/add_Screen.dart';
import 'package:todo_firebase/UI/Screen/HomeScreen/app_Bar.dart';
import 'package:todo_firebase/UI/Screen/HomeScreen/home_Itme_List.dart';

import 'package:todo_firebase/UI/Style/m_color.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.bccolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColor.bccolor,
        title: MyAppBar(
          sectionName: 'CRUD',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddScreen()));
        },
        child: Icon(
          Icons.add,
          size: 16.0,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: HomeItem(),
        ),
      ),
    );
  }
}
