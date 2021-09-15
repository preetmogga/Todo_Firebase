import 'package:flutter/material.dart';
import 'package:todo_firebase/UI/Screen/LogInScreen/login_Screen.dart';
import 'package:todo_firebase/UI/Style/MyTheme.dart';

void main() {
  runApp(MaterialApp(
    title: 'Todo',
    theme: MyTheme.lighttheme,
    home: LoginScreen(),
  ));
}
