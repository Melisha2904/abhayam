import 'package:abhayam/helper_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'helper_function.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void login() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Email Field
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),

                  // Phone Number Field
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 20),

                  // Password Field
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),

                  // Sign In Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: Text('Sign In', style: TextStyle(fontSize: 18)),
                  ),

                  // Forgot Password Button
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot-password');
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
