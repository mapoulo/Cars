

import 'package:cars/model/user.dart';
import 'package:cars/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user){
    return user == null ? null : User(uid: user.uid);
  }


  Stream<User> get userStream{
    return _auth.onAuthStateChanged.map(_userFromFirebase);
  }


Future register(String email, String password)async{
  try{
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return DatabaseService(uid: user.uid).updateDate("name", "surname");
  }catch(e){

  }
}


Future login(String email, String password)async{
  try{
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
  }catch(e){

  }
}

Future logOut()async{
try{
  await _auth.signOut();
}catch(e){

}

}


}