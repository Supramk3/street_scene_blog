import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_scene_blog/screens/register_screen.dart';
import 'package:street_scene_blog/authentication/auth_service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    // const urlImage = 'https://i.ytimg.com/vi/COgQUP8hvQY/maxresdefault.jpg';

    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   'assets/images/streetscenelogo.jpg',
            //   width: 300,
            //   height: 150,
            //   color: Colors.grey,
            //   colorBlendMode: BlendMode.darken,
            // ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'email',
                ),
              ),
            ),
           
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'password',
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                authService.signWithEmailAndPassword(
                    emailController.text, passwordController.text);
                Navigator.pushNamed(context, '/');
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Register'),
            )
          ],
        ),
      ),
    );
  }
}
