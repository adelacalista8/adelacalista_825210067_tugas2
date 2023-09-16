import 'package:flutter/material.dart';
import 'stopwatch.dart';


class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen>createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loggedIn = false;
  void _validate() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => StopWatch()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar (
          title: Text('Login'),
        ),
        body: Center(
          child: _buildLoginForm(),
        )
    );
  }

  Widget _buildLoginForm() {
    return Form (
      child: Padding (
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Runner'),
              validator: (text) => text!.isEmpty ? 'Enter the runner\'s name.' : null,
            ),

            TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Enter email.' ;
                  }
                  final regex = RegExp('[^@+@[^\.]+\..+');
                  if (!regex.hasMatch(text)) {
                    return 'Enter a valid email';
                  }
                  return null;
                }
            ),

            SizedBox(height: 20),
            ElevatedButton(
                onPressed: _validate,
                child: Text('Continue'))


          ],
        ),
      ),
    );
  }
}