import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_firebase/UI/Screen/HomeScreen/home_Edit_Item.dart';
import 'package:todo_firebase/UI/Style/m_color.dart';
import 'package:todo_firebase/Validator/data_Base.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: DataBase.readItems(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went worng');
          // ignore: unnecessary_null_comparison
        } else if (snapshot.hasData) {
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 16.0,
            ),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var noteInfo =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              // ignore: unused_local_variable
              String docId = snapshot.data!.docs[index].id;
              String title = noteInfo['title'];
              String description = noteInfo['description'];
              if (noteInfo.isNotEmpty) {}
              return Ink(
                decoration: BoxDecoration(
                  color: MyColor.bccolor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditScreen(
                          currentTitle: title,
                          curentdescription: description,
                          currentId: docId,
                        ),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  title: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(MyColor.fire),
          ),
        );
      },
    );
  }
}
