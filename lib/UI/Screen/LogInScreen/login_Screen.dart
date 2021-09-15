import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_firebase/UI/Screen/LogInScreen/login_Form.dart';
import 'package:todo_firebase/UI/Style/m_color.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _focusNode = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.cyan,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Image.asset('images/log.png'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'flutterFire',
                      style: TextStyle(fontSize: 25, color: MyColor.fire),
                    ),
                    Text(
                      'CRUD',
                      style: TextStyle(fontSize: 2, color: MyColor.yellow),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: _initializeFirebase(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('data');
                  } else {
                    return LogInForm(focusNode: _focusNode);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
