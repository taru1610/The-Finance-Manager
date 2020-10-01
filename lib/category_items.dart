import 'package:finance_manager/category_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CategoryItem extends StatelessWidget {
  final String title;
  final String categoryId;
  CategoryItem({this.title,this.categoryId});

  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(CategoryTransaction.routeName, arguments: {'id': categoryId,'title':title});

  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selectCategory(context),
      splashColor: Color(0xff18203d),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding:const EdgeInsets.all(15),
        margin: EdgeInsets.all(10.0) ,
        child: Text(title, style: TextStyle(color: Colors.white)),

        //decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.black54,Colors.black12] ,begin: Alignment.topLeft,end: Alignment.bottomRight), borderRadius: BorderRadius.circular(5)),

      ),

    );
  }
}