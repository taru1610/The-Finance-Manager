//main file
import 'package:finance_manager/category_transaction.dart';
import 'package:finance_manager/financescreen.dart';

import 'package:finance_manager/models/preference.dart';
import 'package:finance_manager/resetscreen.dart';
import 'package:finance_manager/root_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

import 'tabs_screen.dart';
import 'auth.dart';

import 'login_page.dart';
import 'auth_provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
  class MyApp extends StatefulWidget {
        @override
        _MyAppState createState() => _MyAppState();
      }
class _MyAppState extends State<MyApp> {
     bool userIsLoggedIn;
@override
  void initState() {
    getLoggedInState();
    super.initState();
  }
       getLoggedInState()  {
     HelperFunctions.getUserLoggedInSharedPreference().then((value){
      setState(() {
        userIsLoggedIn  = value;
        print(value);
      });
    });
  //   HelperFunctions.saveAdminLoggedInSharedPreference(false);
  }
  @override
  Widget build(BuildContext context){
    return AuthProvider(
      auth:Auth(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Finance Manager',
          theme: ThemeData(
            //primarySwatch: Colors.purple,
              accentColor: Color(0xFFB388FF),
            primaryColor: Color(0xff18203d),


            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Montserrat'
          ),
          home:RootPage(),
          /*home: userIsLoggedIn != null ?  userIsLoggedIn ? TabScreen()
              : SplashScreen():MyHomePage(
      title: 'FinanceWiz'),*/
          routes: {
            //'/':(ctx)=> TabScreen(),
            TabScreen.routeName:(ctx)=> TabScreen(),
            //LoginScreen.routeName:(ctx) => LoginScreen(),
            //SignupScreen.routeName:(ctx) => SignupScreen(),
           // FinanceScreen.routeName:(ctx) => FinanceScreen(),
            CategoryTransaction.routeName:(ctx)=> CategoryTransaction(),
            //ResetScreen.routeName:(ctx) => ResetScreen(),
          },
      ),
    );
  }
}
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(child: Image.network('https://p1.hiclipart.com/preview/8/461/217/money-logo-finance-cash-loan-financial-services-cashback-reward-program-financial-plan-cash-app-png-clipart.jpg')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class _MyHomePageState extends State<MyHomePage> {

  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);
  final Color logoGreen = Color(0xFF7C4DFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold),)),
        backgroundColor: primaryColor,
      ),
      body:Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //We take the image from the assets
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://i.pinimg.com/736x/91/95/bb/9195bb65df0aaccfd9dc669ca2b1687a.jpg',
                    height: 230,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                //Texts and Styling of them
                Text(
                  'Welcome to The Finance Manager !',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 28),
                ),
                SizedBox(height: 20),
                /*Padding(
                  padding: const EdgeInsets.all(5.5),
                child:Text(
                  'A one-stop portal for you to learn the latest technologies from SCRATCH',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                ),*/
                SizedBox(
                  height: 20,
                ),
                //Our MaterialButton which when pressed will take us to a new screen named as
                //LoginScreen
                Padding(
                  padding: const EdgeInsets.only(left:30.0, right:30.0,top:30),
                  child: MaterialButton(
                    elevation: 0,
                    height: 50,
                    minWidth: double.maxFinite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginPage()));
                    },
                    color: primaryColor,
                    child:Text('LOGIN',
                          style: TextStyle(color: Colors.white, fontSize: 20)
                        ),
                    textColor: Colors.white,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: MaterialButton(
                    elevation: 0,
                    height: 50,
                    minWidth: double.maxFinite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    onPressed: () {

                    },
                    color: primaryColor,
                    child:Text('SIGNUP',
                          style: TextStyle(color: Colors.white, fontSize: 20)
                        ),

                    textColor: Colors.white,
                  ),
                )
              ],
            ),
    );

  }
}
/*class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key key,}): super(key:key);

  @override
  Widget build(BuildContext context) {
  final firebaseUser=context.watch<User>();
    if(firebaseUser!=null){
      //Navigator.pushAndRemoveUntil(context, newRoute, (route) => false)
      return TabScreen();
    }
    return MyHomePage(title:'FinanceWiz');
  }
}*/
/**/
/*
class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth=
  }
}*/

/*class Provider extends InheritedWidget{
  final AuthService auth;
  Provider({Key })
}*/
