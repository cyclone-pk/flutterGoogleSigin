import 'package:flutter/material.dart';
import 'package:googlesignin/services/authservice.dart';
import 'package:googlesignin/view/loginScreen.dart';
import 'package:googlesignin/view/logout_screen.dart';

class MainWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuthService().signIn,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return snapshot.data != null ? LogOutScreen() : LoginScreen();
        }
        if (snapshot.hasError) {
          print(snapshot.error.toString());
          return Text(snapshot.error.toString());
        } else {
          return Center(
            child: Container(
                height: 30, width: 30, child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
