import 'dart:io';
import 'package:finance_manager/loginscreen.dart';
import 'package:finance_manager/models/locator.dart';
import 'package:finance_manager/models/user.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';import 'models/preference.dart';
import 'models/user_controller.dart';

class HomeScreen extends StatefulWidget{
  static const routeName = '/home';


  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{

  void logout() async {
    HelperFunctions.saveUserLoggedInSharedPreference(false);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
            (Route<dynamic> route) => false);
  }




// UserModel _currentUser = locator.get<UserController>().currentUser;

  File _image;

  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xFFB388FF);
  final Color logoGreen = Color(0xFF7C4DFF);
  @override
  Widget build(BuildContext context) {



    return //Scaffold(
      //body:
      Stack(
        children: [
          Column(
            children: [
              Container(
                height: 280,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [primaryColor, secondaryColor], ) , borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 20, right: 20.0,top:10.0), //top: 50),
                  child: Column(
                    children: [

                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children:[

                          Column(

                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Hello,",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Username",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                             /* Row(
                                children: [
                                  Icon(
                                    Icons.camera_front,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: "\$5320",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        children: [
                                          TextSpan(
                                              text: ".50",
                                              style: TextStyle(
                                                  color: Colors.white38))
                                        ]),
                                  )
                                ],
                              )*/
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,

                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.grey.shade100,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 65),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //padding: EdgeInsets.only(top: 75),
                        children: [
                          Text(
                            "Latest Transactions",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: 5,
                          ),


                            Container(
                              height: 120,
                              child: StreamBuilder( stream:FirebaseFirestore.instance.collection("Transaction").orderBy('date',descending:true).where(('date'),isLessThanOrEqualTo: new DateTime.now()).limit(10).snapshots(),

    builder: (context,snapshot){
    if(snapshot.hasData){
    return ListView.builder(itemCount: snapshot.data.documents.length,
     scrollDirection: Axis.horizontal,
    itemBuilder: (context,index){

    DocumentSnapshot documentSnapshot =snapshot.data.docs[index];
    Timestamp date = documentSnapshot.data()["date"];
    return Container(
      margin: EdgeInsets.all(10),
      height: 90,
      width: 90,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('\u{20B9}',style: TextStyle(color: Colors.white70, fontSize: 15)),
              Text(
                  documentSnapshot.data()["amount"].toString(),
                style: TextStyle(fontSize: 20,color: Colors.white70)
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            documentSnapshot.data()["title"].toString(),
            style:
            TextStyle(color: Colors.white70,fontSize: 15),
          ),
          Text(
            documentSnapshot.data()["category"].toString(),
            style:
            TextStyle(color: Colors.white70,fontSize: 10),
          )
        ],
      ),
    );});}
    else{
    return Container(
      width:double.infinity,
      height: 100,
      child:Text('No Transactions Today'),
    );
    }}),
                            ),

                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Statistics",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          buildCategoryCard(Icons.fastfood, "Food", 120, 20),
                          buildCategoryCard(Icons.flash_on, "Utilities", 430, 17),
                          buildCategoryCard(Icons.fastfood, "Food", 120, 20),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 195,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              width: MediaQuery.of(context).size.width * 0.85,
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.white,
                  /*boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 8,
                      spreadRadius: 3,
                      offset: Offset(0, 10),
                    ),*/

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(50),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Income",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.arrow_upward,
                                color: logoGreen,
                              )
                            ],
                          ),
                          Text(
                            "\$2 170.90",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.black87),
                          )
                        ],
                      ),
                      Container(width: 1, height: 50, color: Colors.grey),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Expenses",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.arrow_downward,
                                color: logoGreen,
                              )
                            ],
                          ),
                          Text(
                            "\$1 450.10",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.black87),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "You saved \$ 1,494 this month",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors. black45,
                        //fontStyle: FontStyle.italic,
                      ), textAlign: TextAlign.center,),
                  ),

                  SizedBox(
                    height: 3,
                  ),
                  /*Text(
                    "Let's see the cost statistics for this period",
                    style: TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                    ),
                  ),*/

                  /*Container(
                    height: 1,
                    width: double.maxFinite,
                    color: Colors.grey.withOpacity(0.5),
                  ),*/
                  /*SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Tell me more",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: logoGreen),
                    ),*/

                ],
              ),
            ),
          )
        ],
      );
    //);
  }

  Container buildCategoryCard(
      IconData icon, String title, int amount, int percentage) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 85,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                      icon,
                      color: logoGreen),

                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "\$$amount",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "($percentage%)",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Stack(
            children: [
              Container(
                height: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.grey.shade300),
              ),
              Container(
                height: 5,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: logoGreen),
              ),
            ],
          )
        ],
      ),
    );
  }

  GestureDetector buildActivityButton(
      IconData icon, String title, Color backgroundColor, Color iconColor) {
    return GestureDetector(
      onTap: () {

      },// Navigator.of(context).push(
      // MaterialPageRoute(builder: (BuildContext context) => TransferPage())),
      child: Container(
        margin: EdgeInsets.all(10),
        height: 90,
        width: 90,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style:
              TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

