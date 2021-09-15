import 'package:flutter/material.dart';
import 'package:todo_firebase/UI/Screen/LogInScreen/custom_form_field.dart';
import 'package:todo_firebase/UI/Screen/HomeScreen/home_Screen.dart';

import 'package:todo_firebase/UI/Style/m_color.dart';
import 'package:todo_firebase/Validator/data_Base.dart';
import 'package:todo_firebase/Validator/validator.dart';

class LogInForm extends StatefulWidget {
  final FocusNode focusNode;
  const LogInForm({
    Key? key,
    required this.focusNode,
  }) : super(key: key);

  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final TextEditingController _uidController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();
  String getId = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Column(
              children: [
                CustomFormField(
                    isObscure: true,
                    initalValue: "",
                    controller: _uidController,
                    focusNode: widget.focusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    label: 'unique user Id',
                    hint: 'Enter Your unique ID',
                    validator: (value) {
                      Validator.userId(uid: value);
                      getId = value;
                    }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  widget.focusNode.unfocus();
                  if (_loginFormKey.currentState!.validate()) {
                    DataBase.userId = getId;
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(MyColor.orgin),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
