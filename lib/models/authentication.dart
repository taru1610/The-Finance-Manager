import 'dart:convert';
import 'package:finance_manager/models/http_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class User{
  String userId;
  User({this.userId});
}

class Authentication with ChangeNotifier{

final FirebaseAuth _auth= FirebaseAuth.instance;


Future<User> getUser(String id) async{
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=AIzaSyCoHFJNCLRgr9b5zh0Vx9scGewP1RVz5sA';
    try{
          final response = await http.post(url,body:json.encode(
          {
            'id': id,
            'returnSecureToken' : true,
          }
        )
        );
        final responseData = json.decode(response.body);
        if(responseData['error'] != null){
          throw HttpException(responseData['error']['message']);
        }
        //print(responseData);
        }catch(error){
          throw error;
        }
  }

  Future<void> updateProfile(String displayName,String photoUrl)async{
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyCoHFJNCLRgr9b5zh0Vx9scGewP1RVz5sA';
    try{
          final response = await http.post(url,body:json.encode(
          {
            'displayName' : displayName,
            'photoUrl' : photoUrl,
            'returnSecureToken' : true,
          }
        )
        );
        final responseData = json.decode(response.body);
        if(responseData['error'] != null){
          throw HttpException(responseData['error']['message']);
        }
        //print(responseData);
        }catch(error){
          throw error;
        }
  }

   
    Future<void> signUp(String email,String password ) async{
        const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCoHFJNCLRgr9b5zh0Vx9scGewP1RVz5sA';
        try{
          final response = await http.post(url,body:json.encode(
          {
            'email' : email,
            'password' : password,
            'returnSecureToken' : true,
          }
        )
        );
        final responseData = json.decode(response.body);
        if(responseData['error'] != null){
          throw HttpException(responseData['error']['message']);
        }
        //print(responseData);
        }catch(error){
          throw error;
        }
    }
  
    Future<void> logIn(String email,String password ) async{
        const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCoHFJNCLRgr9b5zh0Vx9scGewP1RVz5sA';
        try{
          final response = await http.post(url,body:json.encode(
          {
            'email' : email,
            'password' : password,
            'returnSecureToken' : true,
          }
        ));
        final responseData = json.decode(response.body);
        if(responseData['error'] != null){
          throw HttpException(responseData['error']['message']);
        }
        //print(responseData);
      }catch(error){
        throw error;
      }
    }

    Future signOut()async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
    }
  }
}
