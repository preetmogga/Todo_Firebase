import 'package:flutter/material.dart';
import 'package:todo_firebase/UI/Screen/HomeScreen/app_Bar.dart';
import 'package:todo_firebase/UI/Screen/HomeScreen/update-Item.dart';
import 'package:todo_firebase/UI/Style/m_color.dart';
import 'package:todo_firebase/Validator/data_Base.dart';

class EditScreen extends StatefulWidget {
  final String currentTitle;
  final String curentdescription;
  final String currentId;
  EditScreen({
    Key? key,
    required this.currentTitle,
    required this.curentdescription,
    required this.currentId,
  }) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final FocusNode _titlefocusNode = FocusNode();
  final FocusNode _descriptionfocusNode = FocusNode();
  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        _titlefocusNode.unfocus();
        _descriptionfocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: MyColor.bccolor,
        appBar: AppBar(
          title: MyAppBar(sectionName: ' CRUD'),
          actions: [
            _isDeleting
                ? Padding(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 10, right: 15),
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.redAccent),
                      strokeWidth: 3,
                    ),
                  )
                : IconButton(
                    onPressed: () async {
                      setState(() {
                        _isDeleting = true;
                      });
                      await DataBase.deleteItem(docId: widget.currentId);

                      setState(() {
                        _isDeleting = false;
                        Navigator.of(context).pop();
                      });
                    },
                    icon: Icon(Icons.delete_forever,
                        color: Colors.redAccent, size: 32),
                  ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20),
            child: UpdateItem(
              currentId: widget.currentId,
              currentTitle: widget.currentTitle,
              currentDescription: widget.curentdescription,
              descriptionFousnode: _descriptionfocusNode,
              titleFousnode: _titlefocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
