import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'loginscreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future sendPasswordResetEmail(String email) async{
    return await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

class ResetScreen extends StatefulWidget{
  static const routeName = '/reset'; 
  @override
  State<StatefulWidget> createState() => ResetScreenState();
}

class ResetScreenState extends State<ResetScreen> {

  final GlobalKey<FormState>_formKey = GlobalKey();
  String email;
void _showErrorDialog(String msg){
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An error occured'),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(
          onPressed: (){
            Navigator.of(ctx).pop();
          },
          child: Text('Okay')
          )
        ],
      ),
    );
  }

  Future<void> _submit() async{

    if(!_formKey.currentState.validate()){
      return;
    }
    _formKey.currentState.save();

    try{
      await sendPasswordResetEmail(email);
      
    Alert(
      context: context,
      type: AlertType.success,
      title: "SUCCESS",
      style:AlertStyle(
        backgroundColor: Theme.of(context).cardColor,
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontFamily:'Zilla Slab',fontSize: 18),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
         // color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(fontFamily:'Zilla Slab',
        fontWeight: FontWeight.bold,
       color: Theme.of(context).textSelectionColor
      ),
    ),
            desc: "Pawword Reset Link Sent!",
            buttons: [
              DialogButton(
                color: Color(0xff3671a4),
                child: Text(
                  "OK",
                  style: TextStyle(fontFamily:'Zilla Slab',fontSize: 20,color: Colors.white),
                ),
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false)
              )
            ],
          ).show();
    }catch(error){
      var errorMessage = 'Authentication Failed. Please try later.';
      _showErrorDialog(errorMessage);
    }
    
  }


  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);
  final Color logoGreen = Color(0xff25bcbb);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: primaryColor,
        body: Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Reset Password and continue',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.openSans(color: Colors.white, fontSize: 28),
                ),

                SizedBox(height: 50,),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Form(
                  key: _formKey,
                  child:
                      TextFormField(
                      controller: nameController,
                      style: TextStyle(color: Colors.white),
                      keyboardType:TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                          icon: Icon(
                          Icons.account_circle,
                          color: Colors.white,
                        ),
                      // prefix: Icon(icon),
                      border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: secondaryColor),
                ),
                    ),
                    validator: (value){
                      if(value.isEmpty || !value.contains('@')){
                    return 'invalid email';
                  }
                  return null;
                },
                onSaved: (value){
                  email = value;
                },
              ),
          ),
        ),
                SizedBox(height: 50),

                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () {
                    _submit();
                  },
                  color: logoGreen,
                  child: Text('Submit',
                   style: TextStyle(color: Colors.white, fontSize: 16)),
                   textColor: Colors.white,
                ),
                SizedBox(height : 20),
                FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                  child: Text('SignIn',
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 12)
                  ),
                  textColor: Colors.white,
                ),
                SizedBox(height: 100),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildFooterLogo(),
                )
              ],
            ),
          ),
        )
      );
  }

  _buildFooterLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'images/splash-image.png',
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left:15.0),
          child: Text('The Finance Manager ',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}