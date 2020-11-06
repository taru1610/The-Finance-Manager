import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:provider/provider.dart';

import 'models/preference.dart';
class UserScreen extends StatefulWidget {
  UserScreen({this.onSignedOut});
  final VoidCallback onSignedOut;
  @override
  _UserScreenState createState() => _UserScreenState(onSignedOut);
}

class _UserScreenState extends State<UserScreen> {
  final VoidCallback onSignedOut;
  _UserScreenState(this.onSignedOut);

  Future<void> _signOut(BuildContext context) async {
    try {
      final BaseAuth auth = AuthProvider.of(context).auth;
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }
  String name;
  Future<String> uidfunction() async{
    //String uid = await auth.
    final BaseAuth auth = AuthProvider.of(context).auth;
    //String uid= await context.read<AuthServuc>().getCurrentUID();
    final uid = await auth.currentUser();
    //print(uid);
    DocumentSnapshot ds= await FirebaseFirestore.instance.collection('users').doc(uid).get();
    print('LALALALALALALAL');
    name=ds.data()['name'];
    return name;
    //return name;//collection('userinfo').where('uid',isEqualTo: uid).snapshots();
  }
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar:  AppBar(title: Text('Profile')
          , actions:<Widget>[
            IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){
              _signOut(context);
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width:10),
                                    Icon(Icons.payment,color: Colors.white,),
                                    SizedBox(width:10),
                                    Text('75',style: TextStyle(fontSize: 20,color: Colors.white),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width:10),
                                    Icon(Icons.save_alt,color: Colors.white,),
                                    SizedBox(width:10),
                                    Text('4500',style: TextStyle(fontSize: 20,color: Colors.white),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width:10),
                                    Icon(Icons.card_giftcard,color:Colors.white),
                                    SizedBox(width:10),
                                    Text('5',style: TextStyle(fontSize: 20,color: Colors.white),),
                                  ],
                                ),
                              ],
                            ),
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
                       child: Text('Jennifer Smith', style:TextStyle(fontSize: 30,
                       fontWeight: FontWeight.w800,
                       color: Colors.white),
                   softWrap: true,),
                     ),
                     SizedBox(height: 30,),
                     Center(
                       child: Text('Rs. 450,000', style:TextStyle(fontSize: 20,
                           //fontWeight: FontWeight.w800,
                           color: Colors.white70),
                         softWrap: true,),
                     ),
                     SizedBox(height: 15,),
                     Center(
                       child: Text('jennifersmith@gmail.com', style:TextStyle(fontSize: 20,
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
