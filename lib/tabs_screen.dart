import 'package:finance_manager/paymentscreen.dart';
import 'package:flutter/material.dart';
import 'financescreen.dart';
import 'package:provider/provider.dart';
import 'add_transact.dart';
import 'auth_provider.dart';
import 'home.dart';
import 'dart:io';
import 'auth.dart';

import 'package:provider/provider.dart';


import 'models/preference.dart';


class TabScreen extends StatefulWidget {
  static const String routeName = '/TabScreen';
  TabScreen({this.onSignedOut});
  final VoidCallback onSignedOut;
  @override
  _TabScreenState createState() => _TabScreenState(onSignedOut);
}

class _TabScreenState extends State<TabScreen> {
  final VoidCallback onSignedOut;
  _TabScreenState(this.onSignedOut);
  final List <Map<String,Object>> _pages =[{'page':HomeScreen(),'title':'Home'},{'page':AddTransactions(),'title':'Add Transactions'},{'page':PaymentScreen(),'title':'Pay'}];
  int _selectedPageIndex=0;
  void _selectpage(int index){
    setState(() {
      _selectedPageIndex=index;

    });
  }


  Future<void> _signOut(BuildContext context) async {
    try {
      final BaseAuth auth = AuthProvider.of(context).auth;
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }
  /*void logout() async {
    context.read<AuthService>().signOut();

  }*/
  @override

  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'])
      , actions:<Widget>[
        IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){
        _signOut(context);
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
            BottomNavigationBarItem(icon: Icon(Icons.add_box),title: Text('Add Transacion')),
            BottomNavigationBarItem(icon: Icon(Icons.payment),title: Text('Pay')),
          ],)

    );
  }
}