import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    // Request permissions
    final statusInternet = await Permission.internet.status;
    final statusSms = await Permission.sms.status;

    if (!statusInternet.isGranted) {
      await Permission.internet.request();
    }

    if (!statusSms.isGranted) {
      await Permission.sms.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Welcome App')),
        body: Center(child: Text('Welcome to the app!')),
      ),
    );
  }
}
