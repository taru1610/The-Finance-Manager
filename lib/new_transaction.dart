import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' ;

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

  @override

  Widget build(BuildContext context) {

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
                  onPressed:() {
                      DocumentReference documentReference= FirebaseFirestore.instance.collection("Transaction").doc();
                      Map <String, dynamic> transaction ={
                        "title":titleController.text,
                        "amount":amountController.text,
                        "description":descriptionController.text,
                        "category": widget.category,
                        "date": DateTime.now(),
                      };
                      documentReference.set(transaction).whenComplete(() => print("created"));
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