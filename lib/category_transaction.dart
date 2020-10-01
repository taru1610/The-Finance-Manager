import 'package:flutter/material.dart';

import 'models/preference.dart';
import 'loginscreen.dart';
import 'category_items.dart';
import 'new_transaction.dart';

class CategoryTransaction extends StatefulWidget {


  static const routeName = '/CategoryTransact';

  @override
  _CategoryTransactionState createState() => _CategoryTransactionState();

}

class _CategoryTransactionState extends State<CategoryTransaction> {
  void logout() async {
    HelperFunctions.saveUserLoggedInSharedPreference(false);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
            (Route<dynamic> route) => false);}

  //void _addNewTransaction(String title, double amount, String description, String category){
    //final newTx= transact(title: title,amount: amount, date: DateTime.now(),description: description,category: category);

    //setState(() {
     // _userTransaction.add(newTx);
    //});
  //}
  void startAddNewTransaction( BuildContext ctx, String category){
    showModalBottomSheet(context: ctx, shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        isScrollControlled: true ,builder: (_){

      return GestureDetector(
          onTap: (){},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(category));

    });
  }
  final   List<String> Categories=['Food','Utilities','Taxes','Shopping','Healthcare','Misc','Transport','Rent/Loan', 'Personal Payments'];
   @override
  Widget build(BuildContext context) {
     final routeargs = ModalRoute
         .of(context)
         .settings
         .arguments as Map<String, String>;
     final title = routeargs['title'];
     final ID = routeargs['id'];

     return Scaffold(
       appBar: AppBar(title: Text(title)
         , actions:<Widget>[
           IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){
             logout();
           })
         ],
       ),
       body:
       Column(
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
                     child: Image.network('https://image.freepik.com/free-vector/woman-choosing-healthy-unhealthy-food-concept-flat-illustration-fastfood-vs-balanced-menu-comparison-isolated-clipart-female-flat-cartoon-style-character-dieting-healthy-eating_126608-336.jpg',height: 160,alignment:Alignment(-1.0,-1.0),width: double.infinity,fit: BoxFit.cover,) ,
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
                   decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.blueGrey,Colors.grey] ,begin: Alignment.topLeft,end: Alignment.bottomRight )),
                   height: 125,
                   child: SingleChildScrollView(
                     child: Column(
                       children: [
                         Container(
                           height:350,
                           child: ListView.builder(
                             padding: const EdgeInsets.all(10),
                             itemCount: Categories.length,
                             itemBuilder: (ctx,i)=> CategoryItem(title:Categories[i], categoryId: i.toString()),


                             //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.5/0.5,crossAxisSpacing: 10,mainAxisSpacing: 10),
                           ),
                         ),
                         SizedBox(height:10),
                         Container(
                           width:175,
     child:
     MaterialButton(
     shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(30)
     ),
     elevation: 0,
     minWidth: double.maxFinite,
     height: 50,
     onPressed: () {
       startAddNewTransaction(context, title);
     },
       color: Colors.black26,
       child: Text('Add Transaction',
           style: TextStyle(color: Colors.white, fontSize: 16)),
       textColor: Colors.white,
                         )),
                       ],
                     ),
                   ),
                 ),
               ),
             ),

           ])

     );



  }
}
