
import 'package:cars/model/car_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
   
  String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection = Firestore.instance.collection("users");

  final CollectionReference carCollection = Firestore.instance.collection("cars");


  List<CarModel> _carList(QuerySnapshot snapshot){
     return snapshot.documents.map((doc){
       return CarModel(
         carImage: doc.data['carImage'],
         carName: doc.data['carName'],
         founder: doc.data['founder'],
         description: doc.data['description']
       );
     }).toList();
  }

  Stream<List<CarModel>> get carStream{
    return carCollection.snapshots().map(_carList);
  }

  Future updateDate(String name, String surname)async{
     try{
        return await carCollection.document(uid).setData({
          'name': name,
          'surname': surname
        });
     }catch(e){

     }
  }
   
}