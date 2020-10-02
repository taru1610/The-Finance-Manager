  
import 'package:finance_manager/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_session/flutter_session.dart';
// class User{

//   String userId;

//   User({this.userId});
// }
class AuthRepo {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth= FirebaseAuth.instance;
// User _userFromFirebaseUser(FirebaseUser user){
// return user != null ? User(userId: user.uid): null;
// }


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

  

  Future<UserModel> getUser() async {
    var firebaseUser = await _auth.currentUser;
      return UserModel(firebaseUser.uid, name: firebaseUser.displayName);
  }

  Future signInWithEmailAndPassword(String email, String pass) async{
    final UserCredential authResult =await _auth.signInWithEmailAndPassword(email: email, password: pass);
  final User user= authResult.user;
   //final UserInfo curruser= ;
    /*var session =FlutterSession();
    await session.set("token",user.uid);*/
    //await session.set("name",user.displayName);
    print("signed in " + user.uid);


    return user;

 

}
Future signUpwithEmailAndPassword(String email, String pass)async{
  final UserCredential authResult =
  await _auth.createUserWithEmailAndPassword(email: email, password: pass);
  User user = authResult.user;
       return user;

       

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
