import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' ;
import 'package:flutter_session/flutter_session.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';
import 'auth.dart';

class NewTransaction extends StatefulWidget {
  final String category;

  NewTransaction(this.category);

  @override

  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {

  final titleController =TextEditingController();
  final descriptionController =TextEditingController();
  final amountController =TextEditingController();
  final db= FirebaseFirestore.instance;

  @override

  Widget build(BuildContext context) {
    final BaseAuth auth = AuthProvider.of(context).auth;

    /*FutureBuilder(future: FlutterSession().get('token'),
    builder:(context,token) {
      userid= token.data.toString();
      print('lalalaal'+userid);
      return Container();

    }
    );*/

    return SingleChildScrollView(
      child: Card(
        elevation: 10,
          child: Container(

            padding: EdgeInsets.only(top:10.0,left: 10,right:10,
                bottom: MediaQuery.of(context).viewInsets.bottom+100),

            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(labelText:'Title'),
                  controller: titleController ,
                ),



                TextField(
                  decoration: InputDecoration(
                      labelText: 'Amount'
                  ),
                  keyboardType: TextInputType.number,
                  controller: amountController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Description'),
                  controller: descriptionController ,
                ),
                SizedBox(height:20,),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    elevation: 0,
                    minWidth: double.maxFinite,
                    height: 50,
                  onPressed:() async{
                    final uid= await auth.currentUser();//context.read<AuthService>().getCurrentUID();
                      /*DocumentSnapshot ds= await FirebaseFirestore.instance.collection('userdata').doc(uid).collection('amounts').doc(widget.category).get();
                      int initial= ds.data()['amount'];*/
                      Map <String, dynamic> transaction ={
                        "title":titleController.text,
                        "amount":amountController.text,
                        "description":descriptionController.text,
                        "category": widget.category,
                        "date": DateTime.now(),
                        //"user":userid,
                      };
                     /* int amount =int.parse(amountController.text);
                      Map<String,dynamic> categories={
                        "amount":amount+initial
                      };*/
                      print(uid);
                      await db.collection('userdata').doc(uid).collection(widget.category+'transactions').add(transaction);
                     /* await db.collection('userdata').doc(uid).collection('amounts').doc(widget.category).update(categories);*/
                      //await db.collection('userdata').doc(uid).collection('total').add(transaction);
                      //documentReference.set(transaction).whenComplete(() => print("created"));
                  //widget.addTX(titleController.text, double.parse(amountController.text));
                  Navigator.of(context).pop();
                }, child:Text('Add transaction'), color: Colors.grey[300], ),
              ],
            ),
          )
      ),
    );
  }
}