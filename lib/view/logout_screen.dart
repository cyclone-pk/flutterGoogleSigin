import 'package:flutter/material.dart';
import 'package:googlesignin/services/authservice.dart';

class LogOutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.red.shade200,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Text('Your Are Login Using Google Sign in')),
            InkWell(
                child: Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.login_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Logout'),
                      ],
                    )),
                onTap: () {
                  FirebaseAuthService().handleSignOut();
                })
          ],
        ),
      ),
    ));
  }
}
