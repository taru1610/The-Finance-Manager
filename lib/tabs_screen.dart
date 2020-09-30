import 'package:finance_manager/profile.dart';
import 'package:flutter/material.dart';
import 'financescreen.dart';
import 'add_transact.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List <Map<String,Object>> _pages =[{'page':FinanceScreen(),'title':'Finance'},{'page':AddTransactions(),'title':'Add Transactions'},{'page':UserProfile(),'title':'Profile'}];
  int _selectedPageIndex=0;
  void _selectpage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title']),
    ),
        drawer:Drawer(child: Text('The Drawer'),),
        body:_pages[_selectedPageIndex]['page'],
        bottomNavigationBar:BottomNavigationBar(onTap: _selectpage,
         // unselectedItemColor: Colors.black,
          //selectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          backgroundColor: Theme.of(context).primaryColorDark,items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('Home')),
            BottomNavigationBarItem(icon: Icon(Icons.add_box),title: Text('Add Transaction')),
            BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle),title: Text('Profile')),
          ],)

    );
  }
}