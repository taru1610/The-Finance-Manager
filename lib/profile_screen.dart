import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loginscreen.dart';

import 'models/preference.dart';
class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  void logout() async {
    HelperFunctions.saveUserLoggedInSharedPreference(false);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
            (Route<dynamic> route) => false);}

  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar:  AppBar(title: Text('Profile')
          , actions:<Widget>[
            IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){
              logout();
            })
          ],
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.black87),
          
            child:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
              Expanded(
                child: Stack(
                    children: [
                      Positioned(
                        top:40,left:230,
                          child:Container(
                              decoration: BoxDecoration(border: Border.all(color: Colors.white70), shape: BoxShape.circle),
                              child: FlatButton(onPressed:(){},

                                  child: Icon(Icons.mode_edit,color: Colors.white,size:30,))),
                      ),
                      Positioned(top:30,left:30,
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFB388FF)/*(0xff18203d)*/, Colors.deepPurpleAccent]), borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20),topLeft:Radius.circular(20),topRight: Radius.circular(20))),)),

                  Positioned(top:100,left:130,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: new BoxDecoration(
                      //color: const Color(0xff7c94b6),
                      image: new DecorationImage(
                        image: new NetworkImage('https://image.freepik.com/free-vector/young-woman-sitting-couch-avatar-character_25030-18443.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: new BorderRadius.all(new Radius.circular(100.0)),
                      border: new Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    /*decoration: BoxDecoration(border: Border.all(color:Colors.white),shape: BoxShape.circle),
                    child: CircleAvatar(child: Image.network('https://image.freepik.com/free-vector/young-woman-sitting-couch-avatar-character_25030-18443.jpg')),*/
                ),
              ),])),

              //SizedBox(height: 5,),
              Center(
                child: Container(width: 200,
                height:2,

    decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xff18203d), Color(0xFFB388FF)]))),
              ),
                  SizedBox(height: 10,),
              Container(
                height:270,
                //decoration: BoxDecoration(color: Colors.black45),
                width:double.infinity,
                 child: Column( //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Center(
                       child: Text('Jane Doe', style:TextStyle(fontSize: 30,
                       fontWeight: FontWeight.w800,
                       color: Colors.white),
                   softWrap: true,),
                     ),
                     SizedBox(height: 30,),
                     Center(
                       child: Text('Income', style:TextStyle(fontSize: 20,
                           //fontWeight: FontWeight.w800,
                           color: Colors.white70),
                         softWrap: true,),
                     ),
                     SizedBox(height: 15,),
                     Center(
                       child: Text('email@gmail.com', style:TextStyle(fontSize: 20,
                           //fontWeight: FontWeight.w800,
                           color: Colors.white70),
                         softWrap: true,),
                     ),
                   ],
                 ),
              ),


        ]),
    ),
      );


  }
}
