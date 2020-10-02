import 'package:flutter/material.dart';

class CategoryTransactionItem extends StatelessWidget {
  final String title;
  final double amount;
  final String descrip;
  //final DateTime date;
  CategoryTransactionItem(this.title,this.amount,this.descrip);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(15),
      margin: EdgeInsets.all(10.0) ,
      child: Text(title, style: TextStyle(color: Colors.white)),

      //decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.black54,Colors.black12] ,begin: Alignment.topLeft,end: Alignment.bottomRight), borderRadius: BorderRadius.circular(5)),

    );
  }
}
