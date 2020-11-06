/*
import 'dart:io';
import 'package:finance_manager/loginscreen.dart';
import 'package:finance_manager/models/locator.dart';
import 'package:finance_manager/models/user.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'models/preference.dart';
import 'models/user_controller.dart';

class FinanceScreen extends StatefulWidget{
  static const routeName = '/finance';
  @override
  State<StatefulWidget> createState() => _FinanceScreenState();
}


class _FinanceScreenState extends State<FinanceScreen> with TickerProviderStateMixin{

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
    
        Future getImage() async{
          // ignore: deprecated_member_use
        _image =  await ImagePicker.pickImage(source : ImageSource.gallery);

        //upload Image
        // await locator.get<UserController>().uploadProfilePicture(_image);

        //set state
        setState(() {
          
        });
        }
    
        return //Scaffold(
          //body:
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [primaryColor, secondaryColor]),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20.0,top:10.0), //top: 50),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              */
/*Text(
                                "Available balance",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),*//*

                          */
/*GestureDetector(
                            onTap: (){
                               logout();
                            },
                                                             child: Icon(
                                   Icons.exit_to_app,
                                  color: Colors.white,
                                ),
                            ),*//*

                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children:[
                              Stack(
                              children:[
                                  Container(
                                    width: 80.0,
                                    height: 80.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF7C4DFF),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withOpacity(.1),
                                            blurRadius: 8,
                                            spreadRadius: 3)
                                      ],
                                      border: Border.all(
                                        width: 1.5,
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    padding: EdgeInsets.all(5),
                                    child: ClipOval(
                                      child: (_image != null)?Image.file(_image,fit:BoxFit.fill)
                                      :Image.network(
                                          "https://images.pexels.com/photos/2167673/pexels-photo-2167673.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
                                          fit:BoxFit.fill,
                                      ),
                                    ),
                                  ),
                            Positioned(
                            bottom: 0,
                            right: 2,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2,
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                ),
                                color: Colors.green,
                              ),
                              child:IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                onPressed:(){
                                  getImage();
                                }
                              ),
                            ),
                          ),
                        ]
                      ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        " abcd",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 10,
                                  ),
                                      Row(
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
                                 )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.grey.shade100,
                      child: ListView(
                        padding: EdgeInsets.only(top: 75),
                        children: [
                          Text(
                            "Activity",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
*/
                         /*   children: [
                              buildActivityButton(Icons.card_membership, "My Card",
                                  Colors.blue.withOpacity(0.2), Color(0XFF01579B)),
                              buildActivityButton(
                                  Icons.transfer_within_a_station,
                                  "Transfer",
                                  Colors.cyanAccent.withOpacity(0.2),
                                  Color(0XFF0097A7)),
                              buildActivityButton(
                                  Icons.pie_chart,
                                  "Statistics",
                                  Color(0XFFD7CCC8).withOpacity(0.4),
                                  Color(0XFF9499B7)),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Categories",
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
                  )
                ],
              ),
              Positioned(
                top: 185,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 160,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.05),
                          blurRadius: 8,
                          spreadRadius: 3,
                          offset: Offset(0, 10),
                        ),
                      ],
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
                        height: 10,
                      ),
                      Text(
                        "You spent \$ 1,494 this month",
                        style: TextStyle(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Let's see the cost statistics for this period",
                        style: TextStyle(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,
                        width: double.maxFinite,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Tell me more",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: logoGreen),
                        ),
                      )
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
  
*/