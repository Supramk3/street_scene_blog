import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:street_scene_blog/screens/login_screen.dart';
import 'package:street_scene_blog/screens/register_screen.dart';
import 'package:street_scene_blog/screens/wrapper.dart';
import 'authentication/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
      ],
      child: MaterialApp(
        title: 'Street Scene',
        theme: ThemeData(primarySwatch: Colors.grey),
        initialRoute: '/',
        routes: {
          '/': (context) => const Wrapper(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => const RegisterScreen(),
        },
      ),
    );
  }
}
