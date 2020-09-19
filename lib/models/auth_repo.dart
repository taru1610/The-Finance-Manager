  
import 'package:finance_manager/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthRepo();

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =(await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  Future<UserModel> signInWithEmailAndPassword(
      {String email, String password}) async {
    var authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return UserModel(authResult.user.uid,displayName: authResult.user.displayName);
  }

  Future<UserModel> signUpWithEmailAndPassword(
      {String email, String password}) async {
    var authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return UserModel(authResult.user.uid,displayName: authResult.user.displayName);
  }

  Future<UserModel> getUser() async {
    var firebaseUser = await _auth.currentUser;
      return UserModel(firebaseUser.uid, displayName: firebaseUser.displayName);
  }

  Future resetPass(String email) async{
    return await _auth.sendPasswordResetEmail(email: email);
  }

  Future signOut()async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
    }
  }

}