import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_scene_blog/screens/register_screen.dart';
import 'package:street_scene_blog/authentication/auth_service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login here')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(hintText: 'Email'),
//             ),
//             const SizedBox(
//               height: 30.0,
//             ),
//             TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 hintText: 'Password',
//               ),
//             ),

//             // _LoginPassword(
//             //   passwordController: passwordController,
//             // ),
//             const SizedBox(
//               height: 30.0,
//             ),
//             _SubmitButton(
//                 email: emailController.text, password: passwordController.text),
//             SizedBox(
//               height: 30.0,
//             ),
//             CreateAccountButton(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _LoginEmail extends StatelessWidget {
//   const _LoginEmail({
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

// class _LoginPassword extends StatelessWidget {
//   _LoginPassword({
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
//   const _SubmitButton({Key? key, required this.email, required this.password})
//       : super(key: key);

//   final String email, password;

//   @override
//   Widget build(BuildContext context) {
//     final authService = Provider.of<AuthService>(context);
//     return ElevatedButton(
//       onPressed: () async {
//         authService.signWithEmailAndPassword(email, password);
//         Navigator.pushNamed(context, '/');
//       },
//       child: Text('Loginnnnn'),
//     );
//   }
// }

// class CreateAccountButton extends StatelessWidget {
//   const CreateAccountButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () {
//         Navigator.of(context).push(MaterialPageRoute(
//           builder: (context) => RegisterScreen(),
//         ));
//       },
//       child: const Text('Create Account'),
//     );
//   }
// }
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
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: TextField(
            //     controller: emailController,
            //     decoration: const InputDecoration(
            //         fillColor: Colors.white,
            //         filled: true,
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.all(
            //             Radius.circular(18),
            //           ),
            //         ),
            //         labelText: "Email"),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: TextField(
            //     controller: passwordController,
            //     decoration: InputDecoration(
            //         fillColor: Colors.white,
            //         filled: true,
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(10.0),
            //         ),
            //         labelText: "Password"),
            //   ),
            // ),
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
