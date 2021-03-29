import 'package:flutter/material.dart';
import 'package:googlesignin/services/authservice.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Google Sign in Tutorial Presented By Top Tutorial',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              await FirebaseAuthService().handleGoogleSignIn(context);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              width: double.infinity,
              child: Center(
                  child: Text(
                'Google Sign In',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
