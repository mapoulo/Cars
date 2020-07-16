import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseServices{

  String uid;
  DatabaseServices({this.uid});

  final CollectionReference myCollection = Firestore.instance.collection("myCollection");

  Future updateData(String name, String surname)async{
    return await myCollection.document(uid).setData({
      "name": name,
      "surname": surname
    });
  }
  
}