import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'package:provider/provider.dart';
class SignUpView extends StatefulWidget {

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);
  final Color logoGreen = Color(0xff25bcbb);
  bool passwordVisible = true;
  bool pass = true;

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
      //_scaffoldKey.currentState.showSnackBar(snackBar);
    }
    return Scaffold(appBar: AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    ),
    backgroundColor: Colors.deepPurple,
    body: Container(
    alignment: Alignment.topCenter,
    margin: EdgeInsets.symmetric(horizontal: 30),
    child: SingleChildScrollView(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
    Text(
    'Sign Up',
    textAlign: TextAlign.center,
        ),
    /*SizedBox(
                  height: 50,
                )*/
    SizedBox(height: 20),

    Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
      context.read<AuthService>().CreateUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        name: nameController.text
      );
    }

    },
    color: logoGreen,
    child: Text('Sign up',
    style: TextStyle(color: Colors.white, fontSize: 16)),
    textColor: Colors.white,
    )])
    )));}
}
