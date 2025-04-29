import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  final specialChar =
      RegExp(r'[!@#\$%\^&\*\(\)_\+\-=\[\]\{\};:",\.<>\/\?\\|`~]');
  final numbers = RegExp(r'[0-9]');
  final capitalLetter = RegExp(r'[A-Z]');
  final smallLetter = RegExp(r'[a-z]');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Email...",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email is required";
                    } else if (value!.contains("@") == false) {
                      return "Email is invalid";
                    }
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Password...",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password is required";
                    } else if (specialChar.hasMatch(value) == false) {
                      return "Use at least one special character";
                    } else if (numbers.hasMatch(value) == false) {
                      return "Use at least one number";
                    } else if (capitalLetter.hasMatch(value) == false) {
                      return "Use at least one capital letter";
                    }
                  },
                ),
                SizedBox(height: 20),
                CupertinoButton(
                  color: Colors.yellow,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  child: Center(child: Text("Save")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
