import 'package:flutter/material.dart';
import 'package:flutter_auth_project/screens/login_screen.dart';
import 'package:flutter_auth_project/models/user.dart';
import 'package:flutter_auth_project/utils/server.dart';
import 'package:flutter_auth_project/screens/dashboard_screen.dart';

class Signup extends StatefulWidget {
  static const namedRoute = "signup-screen";
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String _username = "";
  String _email = "";
  String _password = "";
  String _error = "";

  void _signup() async {
    try {
      User? createduser =
          await ApiService().addUser(_email, _username, _password);
      if (createduser != null) {
        // navigate to the dashboard.
        Navigator.pushNamed(context, Dashboard.namedRoute);
      }
    } on Exception catch (e) {
      setState(() {
        _error = e.toString().substring(11);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Account'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 150,
                        ),
                        Text("Strapi App"),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  )),
              if (_error.isNotEmpty)
                Column(
                  children: [
                    Text(
                      _error,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),

              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _username = value;
                    });
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      hintText: 'Enter valid username e.g. Paul'),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 50,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () => _signup(),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  // navigate to the signup screen
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Login()));
                },
                child: const Text(
                  'Already have an account? Login',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ));
  }
}