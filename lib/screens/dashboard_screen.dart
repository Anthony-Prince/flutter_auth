import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  static const namedRoute = "dashboard-screen";
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Welcome',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
