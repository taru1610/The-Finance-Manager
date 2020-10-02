import 'package:finance_manager/category_items.dart';
import 'package:flutter/material.dart';
import 'financescreen.dart';
import 'category_transaction_item.dart';
import 'models/category.dart';

class AddTransactions extends StatelessWidget {
  final   List<Category> Categories=[
    Category(
      name:'Food',
      image:'https://image.freepik.com/free-vector/woman-choosing-healthy-unhealthy-food-concept-flat-illustration-fastfood-vs-balanced-menu-comparison-isolated-clipart-female-flat-cartoon-style-character-dieting-healthy-eating_126608-336.jpg'),
  Category(
  name:'Utilities',
  image:'https://image.freepik.com/free-vector/landing-page-with-house-searching-concept_23-2148296948.jpg'),
    Category(
        name:'Taxes',
        image:'https://image.freepik.com/free-vector/two-colleagues-analysis-tax-data-with-tablet-magnify-glass_1456-810.jpg'),
    Category(
        name:'Shopping',
        image:'https://image.freepik.com/free-vector/online-shopping-concept-landing-page_52683-22153.jpg'),
    Category(
        name:'Healthcare',
        image:'https://image.freepik.com/free-vector/checking-body-temperature-public-areas_23-2148554198.jpg'),
    Category(
        name:'Misc',
        image:'https://i.pinimg.com/originals/3e/8c/1d/3e8c1d2b366f9e98e99e93c6378496d0.jpg'),

    Category(
        name:'Transport',
        image:'https://image.freepik.com/free-vector/people-standing-sitting-bus-metro-train-isolated-flat-vector-illustration-men-women-using-subway_74855-8509.jpg'),
    Category(
        name:'Rent/Loan',
        image:'https://image.freepik.com/free-vector/bank-loan-consumer-credit-flat-vector-concept_82574-4239.jpg'),
    Category(
        name:'Personal Payments',
        image:'https://image.freepik.com/free-vector/savings-investments-motivation-finance_82574-4297.jpg'),
    ];

  @override
  final Color color= Colors.lightBlue;
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*ontainer(
          height: 100.0,
          width:double.infinity,
            decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xff18203d),Color(0xFFB388FF)] ,begin: Alignment.topLeft,end: Alignment.bottomRight )),
            //child: Image.network('https://image.freepik.com/free-vector/abstract-blue-geometric-background_1035-9810.jpg',
                //fit: BoxFit.cover, alignment:Alignment(-1.0,-1.0) ,color:Colors.white ,colorBlendMode: BlendMode.darken,),
          ),*/
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
               // topLeft: Radius.circular(15),
                //topRight: Radius.circular(15),

              ),
              /*child:Container(
                width:double.infinity,
                height:150,
                decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.grey,Colors.white38] ,begin: Alignment.topLeft,end: Alignment.bottomRight )),
              ),*/
              child: Image.network('https://img.freepik.com/free-vector/woman-choosing-bank-piggybank-budget-planning-concept-isolated-clipart-money-savings-investment-funding-bank-loan-economy-choice-financial-literacy-flat-illustration_126608-218.jpg?size=626&ext=jpg',height: 150,alignment:Alignment(-1.0,-1.0),width: double.infinity,fit: BoxFit.cover,) ,
            ),
            Positioned(
              top: 10,


              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[Container(
                width:320,


              ),
             //Center(child: IconButton(icon:Icon(Icons.add_circle, size: 50.0,), onPressed:(){})),
            ]
              )
    ),
        ]),
      



       Expanded(

        child: ClipRRect(

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),),


          child: Container(
            decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xff18203d),Color(0xFFB388FF)] ,begin: Alignment.topLeft,end: Alignment.bottomRight )),
            child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: Categories.length,
              //itemBuilder: (ctx,i)=> Cat,
            itemBuilder: (ctx,i)=> CategoryItem(title:Categories[i].name, categoryId: i.toString(),Images: Categories[i].image ),


            //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.5/0.5,crossAxisSpacing: 10,mainAxisSpacing: 10),
            ),
          ),
        ),
      ),

    ]);



  }
}
