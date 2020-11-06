import 'package:flutter/material.dart';
/*import 'primary_button.dart';*/
import 'auth.dart';
import 'auth_provider.dart';
class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.auth, this.onSignIn}) : super(key: key);

  //final String title;
  final BaseAuth auth;
  final VoidCallback onSignIn;

  @override
  _LoginPageState createState() => new _LoginPageState();
}

enum FormType {
  login,
  register
}

class _LoginPageState extends State<LoginPage> {
  static final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;
  String _authHint = '';
  String _name;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        final BaseAuth auth = AuthProvider.of(context).auth;
        if (_formType == FormType.login) {

          final String userId = await auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          final String userId = await auth.createUser(_email, _password,_name);
          print('Registered user: $userId');
        }
        widget.onSignIn();
      }
      catch (e) {
        setState(() {
          _authHint = 'Sign In Error\n\n${e.toString()}';
        });
        print(e);
      }
    } else {
      setState(() {
        _authHint = '';
      });
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
      _authHint = '';
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
      _authHint = '';
    });
  }

  List<Widget> usernameAndPassword() {
    switch(_formType){
      case FormType.login:
        return[
          new Image.network('https://image.freepik.com/free-vector/financial-it-audit-concept_107173-16654.jpg'),
          new TextFormField(
            key: new Key('email'),
            decoration: new InputDecoration(labelText: 'Email'),
            autocorrect: false,
            validator: (val) => val.isEmpty ? 'Email can\'t be empty.' : null,
            onSaved: (val) => _email = val,
          ),
           new TextFormField(
            key: new Key('password'),
            decoration: new InputDecoration(labelText: 'Password'),
            obscureText: true,
            autocorrect: false,
            validator: (val) => val.isEmpty ? 'Password can\'t be empty.' : null,
            onSaved: (val) => _password = val,
          ),

        ];

      case FormType.register:
    return [
      new Image.network('https://image.freepik.com/free-vector/cheerful-people-investing-finance-illustration_179970-606.jpg'),

       new TextFormField(
        key: new Key('email'),
        decoration: new InputDecoration(labelText: 'Email'),
        autocorrect: false,
        validator: (val) => val.isEmpty ? 'Email can\'t be empty.' : null,
        onSaved: (val) => _email = val,
      ),
      new TextFormField(
        key: new Key('password'),
        decoration: new InputDecoration(labelText: 'Password'),
        obscureText: true,
        autocorrect: false,
        validator: (val) => val.isEmpty ? 'Password can\'t be empty.' : null,
        onSaved: (val) => _password = val,
      ),
       new TextFormField(
        key: new Key('Name'),
        decoration: new InputDecoration(labelText: 'Name'),

        autocorrect: false,
        validator: (val) => val.isEmpty ? 'Name can\'t be empty.' : null,
        onSaved: (val) => _name = val,
      ),
    ];
  }}

  List<Widget> submitWidgets() {
    switch (_formType) {
      case FormType.login:
        return [
          new SizedBox(height: 20,),
          new RaisedButton(
              key: new Key('login'),
              child: new Text("Login"),
              color: Colors.grey,
              onPressed: validateAndSubmit
          ),
          new RaisedButton(
              key: new Key('need-account'),
              child: new Text("Need an account? Register"),
              color: Colors.grey,
              onPressed: moveToRegister
          ),
        ];
      case FormType.register:
        return [
          new RaisedButton(
              key: new Key('register'),
              child: new Text("Sign Up"),
              color: Colors.grey,

              onPressed: validateAndSubmit
          ),
          new RaisedButton(
              key: new Key('need-login'),
              child: new Text("Have an account? Login"),
              color: Colors.grey,
              onPressed: moveToLogin
          ),
        ];
    }
    return null;
  }

  Widget hintText() {
    return new Container(
      //height: 80.0,
        padding: const EdgeInsets.all(32.0),
        child: new Text(
            _authHint,
            key: new Key('hint'),
            style: new TextStyle(fontSize: 18.0, color: Colors.grey),
            textAlign: TextAlign.center)
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Center(child: new Text('FinanceWiz')),

        ),
        backgroundColor:
    Color(0xff18203d),

        body: new SingleChildScrollView(child: new Container(
            padding: const EdgeInsets.all(30.0),
            child: new Column(
                children: [
                  new Card(
                      child: new Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Container(
                                padding: const EdgeInsets.all(16.0),
                                child: new Form(
                                    key: formKey,
                                    child: new Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: usernameAndPassword() +submitWidgets(),
                                    )
                                )
                            ),
                          ])
                  ),
                  hintText(),



                ]
            )
        ))
    );
  }

  Widget padded({Widget child}) {
    return new Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: child,
    );
  }
}
