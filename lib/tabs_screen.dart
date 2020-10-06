import 'package:finance_manager/paymentscreen.dart';
import 'package:finance_manager/profile.dart';
import 'package:flutter/material.dart';
import 'financescreen.dart';
import 'package:provider/provider.dart';
import 'add_transact.dart';

import 'package:finance_manager/loginscreen.dart';
import 'home.dart';
import 'dart:io';
import 'auth_service.dart';
import 'loginpagenew.dart';
import 'package:provider/provider.dart';


import 'models/preference.dart';


class TabScreen extends StatefulWidget {
  static const String routeName = '/TabScreen';
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List <Map<String,Object>> _pages =[{'page':HomeScreen(),'title':'Home'},{'page':AddTransactions(),'title':'Add Transactions'},{'page':PaymentScreen(),'title':'Pay'}];
  int _selectedPageIndex=0;
  void _selectpage(int index){
    setState(() {
      _selectedPageIndex=index;

    });
  }
  void logout() async {
    context.read<AuthService>().signOut();

  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'])
      , actions:<Widget>[
        IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){
          logout();
        })
      ],
    ),
        drawer:Drawer(child: Text('The Drawer'),),
        body:_pages[_selectedPageIndex]['page'],
        bottomNavigationBar:BottomNavigationBar(onTap:_selectpage,

         // unselectedItemColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor:Color(0xFFB388FF) ,
          currentIndex: _selectedPageIndex,
          backgroundColor:Color(0xff18203d),items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('Home')),
            BottomNavigationBarItem(icon: Icon(Icons.add_box),title: Text('Add Transaction')),
            BottomNavigationBarItem(icon: Icon(Icons.payment),title: Text('Pay')),
          ],)

    );
  }
}