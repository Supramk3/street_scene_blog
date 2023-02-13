import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:street_scene_blog/models/user_model.dart';
import 'package:street_scene_blog/screens/login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.onSignOut});

  final VoidCallback onSignOut;

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is home screen'),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                _signOut();
              },
              child: Text('Log out'))
        ],
      )),
    );
  }
}
