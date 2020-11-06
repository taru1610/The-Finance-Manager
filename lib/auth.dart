import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {

  Future<String> currentUser();
  Future<String> signIn(String email, String password);
  Future<String> createUser(String email, String password,String name);
  Future<void> signOut();
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    User user = (await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user;
    return user.uid;
  }

  Future<String> createUser(String email, String password, String name) async {
    User user = (await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user;
    additionalinfo(name, user.uid,email);
    return user.uid;
  }

  Future<String> currentUser() async {
    User user =await (_firebaseAuth.currentUser);
    return user != null ? user.uid : null;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  void additionalinfo(String name,String uid,String email) async
  { Map<String,dynamic> user={'name':name,
    'uid':uid,
  'email': email,
  'income':"na",
    'expenses':"0"
  };
  await FirebaseFirestore.instance.collection('users').doc(uid).set(user);

  }

}