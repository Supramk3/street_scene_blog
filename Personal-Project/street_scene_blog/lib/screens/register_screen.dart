import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_scene_blog/screens/home_screen.dart';

import '../authentication/auth_service.dart';

// class RegistrationScreen extends StatelessWidget {
//   RegistrationScreen({super.key});

//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final authService = Provider.of<AuthService>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Create Account'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _CreateAccountEmail(emailController: _emailController),
//             const SizedBox(
//               height: 30.0,
//             ),
//             _CreateAccountPassword(passwordController: _passwordController),
//             const SizedBox(
//               height: 30.0,
//             ),
//             _SubmitButton(
//               email: _emailController.text,
//               password: _passwordController.text,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _CreateAccountEmail extends StatelessWidget {
//   _CreateAccountEmail({
//     Key? key,
//     required this.emailController,
//   }) : super(key: key);
//   final TextEditingController emailController;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width / 2,
//       child: TextField(
//         controller: emailController,
//         decoration: const InputDecoration(hintText: 'Email'),
//       ),
//     );
//   }
// }

// class _CreateAccountPassword extends StatelessWidget {
//   _CreateAccountPassword({
//     Key? key,
//     required this.passwordController,
//   }) : super(key: key);
//   final TextEditingController passwordController;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width / 2,
//       child: TextField(
//         controller: passwordController,
//         obscureText: true,
//         decoration: const InputDecoration(
//           hintText: 'Password',
//         ),
//       ),
//     );
//   }
// }

// class _SubmitButton extends StatelessWidget {
//    _SubmitButton({
//     required this.email,
//     required this.password,
//   });
//   final String email, password;

//   @override
//   Widget build(BuildContext context) {

//     return ElevatedButton(
//       onPressed: () async {
//         try {
//           await _authService.createUserWithEmailAndPassword(
//             email,
//             password,
//           );
//           Navigator.of(context).pushReplacement(
//             MaterialPageRoute(
//               builder: (context) => HomePage(),
//             ),
//           );
//         } catch (e) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(e.toString()),
//             ),
//           );
//         }
//       },
//       child: const Text('Create Account'),
//     );
//   }
// }

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();

    // void dispose() {
    //   firstNameController.dispose();
    //   lastNameController.dispose();
    //   emailController.dispose();

    // }

    Future addUserDetails(
      String firstName,
      String lastName,
      String email,
      String userId,
    ) async {
      await FirebaseFirestore.instance.collection('users').add({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'userId': userId
      });
    }

    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  hintText: 'First Name',
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  hintText: 'Last Name',
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () async {
                var user = await authService.createUserWithEmailAndPassword(
                  emailController.text,
                  passwordController.text,
                );
                if (user != null) {
                  addUserDetails(firstNameController.text,
                      lastNameController.text, emailController.text, user!.uid);

                  Navigator.pop(context);
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
