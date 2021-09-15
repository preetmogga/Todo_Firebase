import 'package:flutter/material.dart';
import 'package:todo_firebase/UI/Screen/LogInScreen/custom_form_field.dart';
import 'package:todo_firebase/UI/Style/m_color.dart';
import 'package:todo_firebase/Validator/data_Base.dart';
import 'package:todo_firebase/Validator/validator.dart';

class UpdateItem extends StatefulWidget {
  final FocusNode titleFousnode;
  final FocusNode descriptionFousnode;
  final String currentId;
  final String currentTitle;
  final String currentDescription;
  UpdateItem({
    Key? key,
    required this.titleFousnode,
    required this.descriptionFousnode,
    required this.currentId,
    required this.currentTitle,
    required this.currentDescription,
  }) : super(key: key);

  @override
  _UpdateItemState createState() => _UpdateItemState();
}

class _UpdateItemState extends State<UpdateItem> {
  final _addItemsFormKey = GlobalKey<FormState>();
  bool _isProessing = false;
  String updateTitle = "";
  String updateDescription = "";

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _addItemsFormKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Title',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: MyColor.bccolor),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  CustomFormField(
                    initalValue: widget.currentTitle,
                    isLabelEnable: false,
                    controller: _titleController,
                    focusNode: widget.titleFousnode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    label: 'Title',
                    hint: 'Write your title',
                    validator: (value) {
                      Validator.validaterField(value: value);
                      updateTitle = value;
                    },
                  ),
                  SizedBox(height: 24),
                  Text(
                    'descripition',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: MyColor.bccolor),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    initalValue: widget.currentDescription,
                    isLabelEnable: false,
                    maxLines: 10,
                    controller: _descriptionController,
                    focusNode: widget.descriptionFousnode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    label: 'descripiion',
                    hint: 'Write your Note',
                    validator: (value) {
                      Validator.validaterField(value: value);
                      updateDescription = value;
                    },
                  ),
                ],
              ),
            ),
            _isProessing
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(MyColor.orgin),
                    ),
                  )
                : Container(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_addItemsFormKey.currentState!.validate()) {
                          setState(() {
                            _isProessing = true;
                          });
                          await DataBase.updateItem(
                              title: updateTitle,
                              description: updateDescription,
                              docId: widget.currentId);

                          setState(() {
                            _isProessing = true;
                            Navigator.of(context).pop();
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                        child: Text(
                          'Update Data',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.blueGrey),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyColor.orgin),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
