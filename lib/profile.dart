import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return
       Container(
           decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.black54, Colors.black45])),
         child: Stack(
            children:[
              Stack(
                  children: [
                    Positioned(top:0,left:0,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xff18203d), Color(0xFFB388FF)]), borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20),topLeft:Radius.circular(20),topRight: Radius.circular(20))),)),
                  ]),

                  Positioned(
                    top:50,
                    left: 20,
                    child: Container(width: double.infinity,
                     height:5,

                     decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xff18203d), Color(0xFFB388FF)])),
                        ),
                  ),
                  Container(
                    height:100,
                        width:double.infinity,
                  ),
                ],
              ),
       );


  }
}
