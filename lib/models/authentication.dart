import 'dart:convert';
import 'package:finance_manager/models/http_exception.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class Authentication with ChangeNotifier{
  
   
    Future<void> signUp(String email,String password ) async{
        const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCoHFJNCLRgr9b5zh0Vx9scGewP1RVz5sA';
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

}
