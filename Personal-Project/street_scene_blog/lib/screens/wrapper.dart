import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_scene_blog/screens/home_screen.dart';
import 'package:street_scene_blog/screens/login_screen.dart';
import 'package:street_scene_blog/screens/register_screen.dart';
import 'package:street_scene_blog/screens/sign_in_page.dart';

import '../authentication/auth_service.dart';
import '../models/user_model.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            return user == null
                ? SignInPage()
                : HomePage(
                    onSignOut: () => LoginScreen(),
                  );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
