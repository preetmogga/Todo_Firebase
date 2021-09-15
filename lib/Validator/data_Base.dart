import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('notes');

class DataBase {
  static String? userId;

  static Future<void> addItme({
    required String title,
    required String description,
  }) async {
    DocumentReference documentReference =
        _mainCollection.doc(userId).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      'title': title,
      'description': description,
    };

    await documentReference
        .set(data)
        .whenComplete(() => print('note is update'))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    required String title,
    required String description,
    required String docId,
  }) async {
    DocumentReference documentReference =
        _mainCollection.doc(userId).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      'title': title,
      'description': description,
    };
    await documentReference
        .set(data)
        .whenComplete(() => print('nots id update'))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesCollection =
        _mainCollection.doc(userId).collection('items');

    return notesCollection.snapshots();
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReference =
        _mainCollection.doc(userId).collection('items').doc(docId);

    await documentReference
        .delete()
        .whenComplete(() => print('itmes delete'))
        .catchError((e) => print(e));
  }
}
