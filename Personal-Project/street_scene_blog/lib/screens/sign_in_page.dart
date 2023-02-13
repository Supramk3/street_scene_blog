import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:street_scene_blog/screens/login_screen.dart';
import 'package:street_scene_blog/widgets/custom_button.dart';
import 'package:street_scene_blog/authentication/auth_service.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              borderRadius: 10,
              color: Colors.white,
              onPressed: () {
                signInWithGoogle();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('images/google-logo.png'),
                  Text('Sign in with Google'),
                  Opacity(
                      opacity: 0.0,
                      child: Image.asset('images/google-logo.png')),
                ],
              ),
            ),
            CustomButton(
              color: Color(0xFF334D92),
              borderRadius: 10,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('images/facebook-logo.png'),
                  Text(
                    'Sign in with Facebook',
                    style: TextStyle(color: Colors.white),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: Image.asset('images/facebook-logo.png'),
                  ),
                ],
              ),

              // child:  Text(
              //   'Sign in with Facebook',
              //   style: TextStyle(color: Colors.white),
              // ),
            ),
            CustomButton(
                child: Text('Sign in with Email'),
                color: Colors.green,
                borderRadius: 10,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}

signInWithGoogle() async {
  final GoogleSignInAccount? googleUser =
      await GoogleSignIn(scopes: <String>["email"]).signIn();

  final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  return await FirebaseAuth.instance.signInWithCredential(credential);
}
