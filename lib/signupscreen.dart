import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_manager/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:finance_manager/models/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'main.dart';
import 'models/auth_repo.dart';
import 'models/auth_repo.dart';
import 'models/locator.dart';
import 'financescreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}
GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final _scaffoldKey = GlobalKey<ScaffoldState>();
class _SignupScreenState extends State<SignupScreen> with TickerProviderStateMixin {
  bool passwordVisible = true;
  bool pass = true;
 

  

 TextEditingController nameController = TextEditingController();
 TextEditingController emailController = TextEditingController();
 TextEditingController passwordController = TextEditingController();
 TextEditingController confirmController = TextEditingController();



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
bool validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
bool isLoading= false;
   final databaseReference = FirebaseFirestore.instance;
AuthRepo authMethods= AuthRepo();
String val;
void _signUp(String email, String pass) async{
    setState(() {
      isLoading=true;
    });
   await authMethods.signUpwithEmailAndPassword(email, pass).then((value){
      
     if(value!=null){
    databaseReference.collection("register")
        .add({
          'name': nameController.text,
          'email': email,
        }).then((onValue){
                   setState(() {
      isLoading=false;
    });
             Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                       LoginScreen()),
                                                ModalRoute.withName('/'),
                                              );
        });
     }
     //ending if
     
    }).catchError((onError){
          print(onError);
          switch(onError.toString()){
   case 'PlatformException(ERROR_NETWORK_REQUEST_FAILED, A network error (such as timeout, interrupted connection or unreachable host) has occurred., null)':
       val= "Check your connection!";
       break;
    case 'PlatformException(ERROR_EMAIL_ALREADY_IN_USE, The email address is already in use by another account., null)':  
       val="User already registered!";
       break;
    default: val= "Something went wrong!";
          }

      Alert(
            context: context,
            
            type: AlertType.error,
            title: "ERROR",
            style:AlertStyle(
      animationType: AnimationType.fromTop,
      backgroundColor: Theme.of(context).cardColor,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontSize: 18,color: Theme.of(context).textSelectionColor),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
         // color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        fontWeight: FontWeight.bold,
       color: Theme.of(context).textSelectionColor
      ),
    ),
            desc: val,
            buttons: [
              DialogButton(
                color: Color(0xff3671a4),
                child: Text(
                  "OK",
                  style: TextStyle(fontSize: 20,color: Colors.white),
                ),
                onPressed: () => Navigator.of(context).pop()
              )
            ],
          ).show();
setState(() {
      isLoading=false;
    });
    });

  


  }



  // Future<void> _signup() async{

  //   if(!_formKey.currentState.validate()){
  //     return;
  //   }
  //   _formKey.currentState.save();

  //   try{
  //     await locator.get<AuthRepo>()
  //       .signUpWithEmailAndPassword(
  //       email: nameController.text,
  //       password: passwordController.text,
  //     );
  //   Alert(
  //     context: context,
  //     type: AlertType.success,
  //     title: "SUCCESS",
  //     style:AlertStyle(
  //       backgroundColor: Theme.of(context).cardColor,
  //     animationType: AnimationType.fromTop,
  //     isCloseButton: false,
  //     isOverlayTapDismiss: false,
  //     descStyle: TextStyle(fontFamily:'Zilla Slab',fontSize: 18),
  //     animationDuration: Duration(milliseconds: 400),
  //     alertBorder: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(0.0),
  //       side: BorderSide(
  //        // color: Colors.grey,
  //       ),
  //     ),
  //     titleStyle: TextStyle(fontFamily:'Zilla Slab',
  //       fontWeight: FontWeight.bold,
  //      color: Theme.of(context).textSelectionColor
  //     ),
  //   ),
  //           desc: "Registered Successfully!",
  //           buttons: [
  //             DialogButton(
  //               color: Color(0xff3671a4),
  //               child: Text(
  //                 "OK",
  //                 style: TextStyle(fontFamily:'Zilla Slab',fontSize: 20,color: Colors.white),
  //               ),
  //               onPressed: () => Navigator.of(context).pushAndRemoveUntil(
  //       MaterialPageRoute(builder: (context) => FinanceScreen()),
  //       (Route<dynamic> route) => false)
  //             )
  //           ],
  //         ).show();
    
  //   }catch(error){
  //     switch(error.toString()){
  //  case 'PlatformException(ERROR_NETWORK_REQUEST_FAILED, A network error (such as timeout, interrupted connection or unreachable host) has occurred., null)':
  //      var val= "Check your connection!";
  //      _showErrorDialog(val);
  //      break;
  //   case 'PlatformException(ERROR_EMAIL_ALREADY_IN_USE, The email address is already in use by another account., null)':  
  //      var val="User already registered!";
  //      _showErrorDialog(val);
  //      break;
  //   default: var val= "Something went wrong!";
  //             _showErrorDialog(val);
  //     }
  //   }
  // }

  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);
  final Color logoGreen = Color(0xff25bcbb);

  @override
  Widget build(BuildContext context) {
     _displaySnackBar(BuildContext context, String a) {
      final snackBar = SnackBar(
        content: Text(a,
            style: TextStyle(
                color:  Colors.black,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
        backgroundColor: Colors.white,
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
    return isLoading?Container(color: Colors.white,child: Center(child:CircularProgressIndicator()),):Scaffold(
      key: _scaffoldKey,
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
              style: TextStyle(color: Colors.white),
              controller: nameController,
              keyboardType:TextInputType.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: secondaryColor),
                ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  labelText: 'Username',
                  hintText: "Username",
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                  // prefix: Icon(icon),
                  
                  ),
                 
        ),
        SizedBox(height:30),
              TextFormField(
              controller: emailController,
              style: TextStyle(color: Colors.white),
              keyboardType:TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: secondaryColor),
                ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  labelText: 'Email',
                  hintText: "Email",
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  // prefix: Icon(icon),
                  
                  ),
                 
        ),
        SizedBox(height:30),
         TextFormField(
          controller: passwordController,
          style: TextStyle(color: Colors.white),
          keyboardType:TextInputType.emailAddress,
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
              
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: secondaryColor),
                ),
              ),
            
        ),
          SizedBox(height:30),
        TextFormField(
          controller: confirmController,
          style: TextStyle(color: Colors.white),
          keyboardType:TextInputType.emailAddress,
          obscureText: pass,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              labelText: 'Confirm Password',
              hintText: 'ConfirmPassword',
              labelStyle: TextStyle(color: Colors.white),
              suffixIcon: IconButton(
                icon: Icon(
                  pass
                    ? Icons.visibility_off
                    : Icons.visibility,
                  color: Colors.white,
                  ),
                   onPressed: () {
                     setState(() {
                      pass = !pass;
                     });
                    },
                  ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: secondaryColor),
                ),
              ),
             
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
               print(emailController);
                            _formKey.currentState.save();
                             if(nameController.text.isEmpty) 
                              {
                                 {  _displaySnackBar(context, "Please enter Username");
                              
                                }
                              }

                            else if (emailController.text.isEmpty) {
                              _displaySnackBar(context, "Please enter your Email");
                            } else if (!RegExp(
                  r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(emailController.text))
                              _displaySnackBar(context, "Please Fill valid Email");
                            else if (passwordController.text.isEmpty)
                              _displaySnackBar(
                                  context, "Please enter your Password");
                            
                              else
if(passwordController.text.length<6)
                        _displaySnackBar(context, "Password must be atleast 6 characters long");
                        else
if(passwordController.text.length!=confirmController.text.length)
                        _displaySnackBar(context, "Entered password do not match");
                            
                        else{
                          _signUp(emailController.text,passwordController.text);
                        }
          
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
                  width:130.0,
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
