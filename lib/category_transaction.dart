

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_manager/category_transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'auth.dart';
import 'package:provider/provider.dart';
import 'models/preference.dart';
import 'category_items.dart';
import 'new_transaction.dart';
import 'models/transaction.dart';
import 'auth_provider.dart';
class CategoryTransaction extends StatefulWidget {


  static const routeName = '/CategoryTransact';

  @override
  _CategoryTransactionState createState() => _CategoryTransactionState();

}

class _CategoryTransactionState extends State<CategoryTransaction> {

  @override
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
  void logout() async {
    context.read<Auth>().signOut();
  }

  @override
  Widget build(BuildContext context) {
    final BaseAuth auth = AuthProvider.of(context).auth;

    final routeargs = ModalRoute
         .of(context)
         .settings
         .arguments as Map<String, String>;
     final title = routeargs['title'];
     final ID = routeargs['id'];
     final Images = routeargs['image'];
     //final   List<Transaction> Transactions= DocumentReference.setData(title)
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

             Stack(
                 children: [
                   ClipRRect(
                     borderRadius: BorderRadius.only(
                       // topLeft: Radius.circular(15),
                       //topRight: Radius.circular(15),

                     ),

                     child: Image.network(Images,height: 170,alignment:Alignment(-1.0,-1.0),width: double.infinity,fit: BoxFit.cover,) ,
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
                   decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.blueGrey,Colors.grey] ,begin: Alignment.topLeft,end: Alignment.bottomRight )),
                   height: 100,


                   child: SingleChildScrollView(
                     child: Column(
                       children: [
                         Container(
                           height:300,


                                child:  StreamBuilder( stream: getUserTransactions(context, title.toString(), auth),
                                /*FirebaseFirestore.instance.collection('userdata').doc(uid).collection('transactions').orderBy('date',descending: true).where('category',isEqualTo:title.toString()).snapshots(),*/

    builder: (context,snapshot){
    if(snapshot.hasData){
    return ListView.builder(itemCount: snapshot.data.documents.length,

    itemBuilder: (context,index){

    DocumentSnapshot documentSnapshot =snapshot.data.docs[index];
    Timestamp date = documentSnapshot.data()["date"];
    return Container(
      padding:const EdgeInsets.all(15),
      margin: EdgeInsets.all(10.0) ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 40,
               decoration: BoxDecoration(border: Border.all(color: Colors.white12 ),borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomLeft: Radius.circular(20))),
                child:Column(
                  children: [
                    Text(date.toDate().day.toString(), style: TextStyle(fontSize:17,color:Colors.white70 ),),

                    Text(DateFormat.MMMM().format(date.toDate()).toString().substring(0,3), style: TextStyle(fontSize:15,color:Colors.white70 ),),
                  ],
                ),
                //child:Text(documentSnapshot.data()["date"].toString()),
              ),
              SizedBox(width: 15,),
              Column(
                children: [
                  Text(documentSnapshot.data()["title"].toString().toUpperCase(),style: TextStyle(color: Colors.black, fontSize: 15)),
                  Text(documentSnapshot.data()["description"].toString(), style: TextStyle(color: Colors.black45, fontSize: 10),textAlign: TextAlign.start, softWrap: true,),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,

          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
          //Icon(Icons.monetization_on,color: Colors.black54),
              Text('\u{20B9}',style: TextStyle(color: Color(0xff18203d), fontSize: 15)),
          Text(documentSnapshot.data()["amount"], style: TextStyle(color: Color(0xff18203d), fontSize: 15), softWrap: true,),
          ]),
        ],
      ),

      //decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.black54,Colors.black12] ,begin: Alignment.topLeft,end: Alignment.bottomRight), borderRadius: BorderRadius.circular(5)),

    );


    },
    );
    }
                                else{
                                  return Container(
                                    width: double.infinity,
                                    child:Center(child: Text('No Transaction Performed Yet')),
                                  );
                                }
    }
    //CategoryTransactionItem(docum);
    ),

                             //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.5/0.5,crossAxisSpacing: 10,mainAxisSpacing: 10),
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
  Stream<QuerySnapshot> getUserTransactions(BuildContext context, String title, BaseAuth auth) async*{
    //final uid= await context.read<Auth>()currentUser();
    final uid = await auth.currentUser();
    yield* Firestore.instance.collection('userdata').doc(uid).collection('transactions').where('category', isEqualTo:title).snapshots();
  }
}


