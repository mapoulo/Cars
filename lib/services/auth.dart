import 'package:cars/model/user.dart';
import 'package:cars/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String error = "";

  User _userFromFirebase(FirebaseUser user){
    return user == null ? null : User(userUid: user.uid);
  }


  Stream<User> get user{
    return _auth.onAuthStateChanged.map((FirebaseUser user){
      return _userFromFirebase(user);
    });
  }


  Future registerUser(String email, String password)async{
      
      try{

      AuthResult  result = await _auth.createUserWithEmailAndPassword(email: email, password: password);

       FirebaseUser user = result.user;
       return await DatabaseServices(uid: user.uid).updateData("name", "surname");
      }catch(e){

      }
  }


  Future signIn(String email, String password)async{
    
    try{
     AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
     FirebaseUser user = result.user;
     return _userFromFirebase(user);
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