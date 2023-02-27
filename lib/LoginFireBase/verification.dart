import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myproject/LoginFireBase/until.dart';
import 'package:myproject/try.dart';

import '../pages/cartpage.dart';


class VerificationEmail extends StatefulWidget {
  @override
  State<VerificationEmail> createState() {
    return VerificationEmailState();
  }
}

class VerificationEmailState extends State<VerificationEmail> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(
        Duration(seconds: 3),
            (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  Widget build(BuildContext context) => isEmailVerified
      ? Favourite()
      : Scaffold(
    appBar: AppBar(
      title: Text("VERIFY"),
    ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text('CHECK YOUR MAIL'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              maximumSize: Size.fromHeight(50),
            ),
            icon: Icon(
              Icons.email,
              size: 32,
            ),
            label: Text(
              'RESET EMAIl',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: canResendEmail ? sendVerificationEmail : null,
          ),
          SizedBox(
            height: 30,
          ),
          TextButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text(
                'CANCEL',
                style: TextStyle(fontSize: 24),
              ))
        ],
      ),
    ),
  );
}
