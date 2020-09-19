
import 'package:finance_manager/models/user_controller.dart';
import 'package:finance_manager/resetscreen.dart';
import 'package:finance_manager/signupscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'financescreen.dart';
import 'models/locator.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login'; 
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = true;

  
  var  nameController = TextEditingController();
  var passwordController = TextEditingController();

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

  Future<void> _login() async{
    if(!_formKey.currentState.validate()){
      return;
    }
    _formKey.currentState.save();

    try{
      await locator.get<UserController>()
        .signInWithEmailAndPassword(
        email: nameController.text,
        password: passwordController.text,
      );
      Navigator.of(context).pushReplacementNamed(FinanceScreen.routeName);

    }catch(error){
      switch(error.toString()){
   case 'PlatformException(ERROR_NETWORK_REQUEST_FAILED, A network error (such as timeout, interrupted connection or unreachable host) has occurred., null)':
       var val= "Check your connection!";
       _showErrorDialog(val);
       break;
    default: var val= "Something went wrong!";
      _showErrorDialog(val);
      };
    }
    
  }

  showErrorDialog(String errormessage) => _showErrorDialog(errormessage);

  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);
  final Color logoGreen = Color(0xFF26A69A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
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
                  'Log in and continue',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.openSans(color: Colors.white, fontSize: 28),
                ),

                SizedBox(height: 50,),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                      controller: nameController,
                      style: TextStyle(color: Colors.white),
                      //keyboardType:TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        labelText: 'Email',
                        hintText: "Email",
                        labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                          Icons.email,
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
                  _authData['email'] = value;
                },
              ),

              SizedBox(height:30),

            TextFormField(
              controller: passwordController,
              style: TextStyle(color: Colors.white),
              //keyboardType:TextInputType.emailAddress,
              obscureText: passwordVisible,
              decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              labelText: 'Password',
              hintText: 'Password',
              labelStyle: TextStyle(color: Colors.white),
              suffixIcon: IconButton(
                icon: Icon(
                  passwordVisible
                    ? Icons.visibility_off
                    : Icons.visibility,
                    color: Colors.white,
                  ),
                  onPressed: () {
                     setState(() {
                      passwordVisible = !passwordVisible;
                     });
                    },
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
             ]
            )
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
                    _login();
                  },
                  color: logoGreen,
                  child: Text('Login',
                   style: TextStyle(color: Colors.white, fontSize: 16)),
                   textColor: Colors.white,
                ),
                SizedBox(height: 10),
                FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ResetScreen()));
                  },
                  child: Text('Forget Password ?',
                  textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 12)
                  ),
                  textColor: Colors.white,
                ),
                SizedBox(height : 20),
                FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SignupScreen()));
                  },
                  child: Text('Create an Account',
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
