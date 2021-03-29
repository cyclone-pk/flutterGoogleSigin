import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User> handleGoogleSignIn(BuildContext context) async {
    try {
      ///this line of code check if the google user is alraedy login or not
      ///if the user is login then we will not see the popup which ask for email and password
      ///if the user is not login then we will see webview pop up and we need to enter google email and password
      ///in either case we capture the google credentials in secure manner and store it in below variable
      final _googleSignInAccount = await _googleSignIn.signIn();

      ///now we need information about authentication that,s why we called  authentication method on the googlesignin accouny
      ///as the _googleSignInAccount variable contain many information but we only need data about authentication
      final googleSignInAuthentication =
          await _googleSignInAccount.authentication;

      EasyLoading.show(status: 'Authentication Google User Please Wait...');

      ///the authentication information we get above contain access token, id token, server authtoken
      ///we only need access token and id token to generate AuthCredential which can be used to signin in firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      ///we used the Credential that generate above and pass it to the signin with credential method to sign in .
      final UserCredential authResult =
          await _auth.signInWithCredential(credential);

      ///now the auth result contain user , auth credential which we have passed and additional user info.
      ///we are returning user here and you can used the user the way you want.

      EasyLoading.showSuccess('User Are now Login!');
      EasyLoading.dismiss();

      return authResult.user;
    } catch (e) {
      print(e.toString());
      EasyLoading.showError('Google Login Failed with Error');
      return null;
    }
  }

  ///logout user  / signout user from google account
  void handleSignOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  ///here we know if user is login or not and based on that we show login page or homepage.
  ///when user is null it mean that user is not login in if it return user than it means that user is login / authenticated
  Stream<User> get signIn => _auth.authStateChanges();
}
