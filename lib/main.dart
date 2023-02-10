import 'package:flutter/material.dart';
import 'package:flutter_auth_project/screens/dashboard_screen.dart';
import 'package:flutter_auth_project/screens/login_screen.dart';
import 'package:flutter_auth_project/screens/signup_screen.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    title: "Strapi App",
    home: const Login(),
    routes: {
     Dashboard.namedRoute: (ctx) => const Dashboard(),
     Login.namedRoute: (ctx) => const Login(),
     Signup.namedRoute: (ctx) => const Signup()
    },
    onGenerateRoute: (settings) {
     return MaterialPageRoute(builder: (context) => const Dashboard());
    },
    onUnknownRoute: (settings) {
     return MaterialPageRoute(builder: (context) => const Dashboard());
    },
   );
  }
}