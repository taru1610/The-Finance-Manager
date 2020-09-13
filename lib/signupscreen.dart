import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'main.dart';
import 'package:provider/provider.dart';
import 'models/authentication.dart';
import 'financescreen.dart';


class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState>_formKey = GlobalKey();

  Map<String,String> _authData = {
    'email' : '',
    'password': '',
  };

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

  Future<void> _signup() async{

    if(!_formKey.currentState.validate()){
      return;
    }
    _formKey.currentState.save();

    try{
      await Provider.of<Authentication>(context, listen: false).signUp(
      _authData['email'],
      _authData['password'],
    );

    Navigator.of(context).pushReplacementNamed(FinanceScreen.routeName);
    
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
                  'Sign Up and continue',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.openSans(color: Colors.white, fontSize: 28),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(height: 20),
                
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
              controller: nameController,
              style: TextStyle(color: Colors.white),
              keyboardType:TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: secondaryColor),
                ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white),
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                  // prefix: Icon(icon),
                  
                  ),
                  validator: (value){
                    if(value.isEmpty || !value.contains('@')){
                      return 'invalid email';
                    }
                    return null;
                  },
                onSaved: (value){
                  _authData['email'] = value;
                },
        ),
        SizedBox(height:30),
         TextFormField(
          controller: passwordController,
          style: TextStyle(color: Colors.white),
          keyboardType:TextInputType.emailAddress,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.white),
              icon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              // prefix: Icon(icon),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: secondaryColor),
                ),
              ),
              validator: (value){
                if(value.isEmpty || value.length <= 5){
                  return 'invalid password';
                }
                return null;
              },
              onSaved: (value){
                _authData['password'] = value;
              },
        ),
          SizedBox(height:30),
        TextFormField(
          controller: passwordController,
          style: TextStyle(color: Colors.white),
          keyboardType:TextInputType.emailAddress,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              labelText: 'Confirm Password',
              labelStyle: TextStyle(color: Colors.white),
              icon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              // prefix: Icon(icon),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: secondaryColor),
                ),
              ),
              validator: (value){
                if(value.isEmpty || value!= passwordController.text){
                  return 'invalid password';
                }
                return null;
              },
              onSaved: (value){

              },
        ),
            ],
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
                    _signup();
                  },
                  color: logoGreen,
                  child: Text('Sign up',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                  textColor: Colors.white,
                ),
                SizedBox(height:50),
                Row(
                  children: <Widget>[
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal:10.0),
                      child:Container(
                      height:1.0,
                      width:143.0,
                      color:Colors.grey,),
                      ),
                Text(
                  'or',
                  textAlign: TextAlign.center,
                  style:TextStyle(color: Colors.white,fontSize:16),
                ),
                Padding(
                padding:EdgeInsets.symmetric(horizontal:10.0),
                  child:Container(
                  height:1.0,
                  width:143.0,
                  color:Colors.grey,),
                  ),
                  ]
                ),
                SizedBox(height: 30),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () async{
                  //Here goes the logic for Google SignIn discussed in the next section
                    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
                    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
                    // ignore: deprecated_member_use
                    final AuthCredential credential = GoogleAuthProvider.getCredential(
                      idToken: googleAuth.idToken, accessToken: googleAuth.accessToken
                    );
                    // ignore: deprecated_member_use
                    final FirebaseUser user =(await firebaseAuth.signInWithCredential(credential)).user;
                  },
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.google),
                      SizedBox(width: 10),
                      Text('Sign-in using Google',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
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
        ));
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
          padding: const EdgeInsets.only(left: 15.0),
          child: Text('The Finance Manager',
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
