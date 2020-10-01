import 'package:finance_manager/category_items.dart';
import 'package:flutter/material.dart';
import 'financescreen.dart';

class AddTransactions extends StatelessWidget {
  final   List<String> Categories=['Food','Utilities','Taxes','Shopping','Healthcare','Misc','Transport','Rent/Loan', 'Personal Payments'];
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

                //padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                /*child: Center(
                  child: Text('CATEGORIES', style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.fade,

                  ),
                ),*/
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
            itemBuilder: (ctx,i)=> CategoryItem(title:Categories[i], categoryId: i.toString()),


            //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.5/0.5,crossAxisSpacing: 10,mainAxisSpacing: 10),
            ),
          ),
        ),
      ),

    ]);



  }
}
