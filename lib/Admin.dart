/*

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design_pattern/Models/UserModel.dart';

class Admin {
  String? _userName;
  String? _email;
  String? _password;

  Admin._() {}

  String? get userName => _userName;
  set userName(String? userName) => _userName = userName;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get password => _password;
  set password(String? password) => _password = password;

  static Admin ? _admin ;

   static Admin getInstance(){
     _admin ??= Admin._();
     return _admin!;
   }

   //Manage categories
   void addCat (String catName){

   }

  void editCat (){

  }

  void deleteCat (){

  }
   Future addUser(User user)async{
     final newUser =FirebaseFirestore.instance.collection('User').doc();
     user.userId= newUser.id;
     final json = user.toJson();
    await newUser.set(json);


  }
  Future deleteUser(String userId )async{
    final deleteUser =FirebaseFirestore.instance.collection('User').doc(userId);
    await deleteUser.delete();
  }




}*/
