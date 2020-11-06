/*
import 'package:flutter/material.dart';
import 'auth_provider.dart';
import 'auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/transaction.dart';


class Piechart extends StatefulWidget {
  @override
  _PiechartState createState() => _PiechartState();
}

class _PiechartState extends State<Piechart> {

   final   List<String> Categories=['Food','Utilities','Taxes','Shopping','Healthcare','Misc','Transport','Rent/Loan', 'Personal Payments'];
   final List <Map<String,Object>> _categories =[{'CATEGORY':'Food','AMOUNT':0},{'CATEGORY':'Utilities','AMOUNT':0},{'CATEGORY':'Taxes','AMOUNT':0},{'CATEGORY':'Shopping','AMOUNT':0},{'CATEGORY':'Heathcare','AMOUNT':0},{'CATEGORY':'Misc','AMOUNT':0},{'CATEGORY':'Transport','AMOUNT':0},{'CATEGORY':'Rent/Loan','AMOUNT':0},{'CATEGORY':'Personal Payments','AMOUNT':0}];
    int amount=0;

  @override

  // ignore: missing_return
  Widget build(BuildContext context) {
    final BaseAuth auth = AuthProvider.of(context).auth;
    void func() async{
      for (var i=0;i< _categories.length;i++)
      {
        List<transaction> A= await CategoryFunction(context,_categories[i]['CATEGORY'],auth);
        for(var i=0;i< A.length;i++)
        {

        }

      }
    }
    return Container(
      height: 10,
      width: 10,
      child: Text('lalal')



    );

  }

Future<Stream<List<transaction>>> CategoryFunction(BuildContext context, String category, BaseAuth auth)async
{
  final uid = await auth.currentUser();
 Stream<QuerySnapshot> stream = Firestore.instance.collection('userdata').doc(uid).collection('transactions').where('category', isEqualTo:category).snapshots();
   return stream.map((snap) => snap.docs.map((doc) => transaction(amount:doc.data()['amount'],description: doc.data()['description'],title: doc.data()['title'],date: doc.data()['date'])).toList());

}}

*/
