// lib/screens/login_screen.dart

import 'package:flutter/material.dart';
import '../widgets/custom_nav_bar.dart';
import '../services/auth_service.dart';
import '../providers/auth_provider.dart';
import '../models/user.dart';
import 'package:provider/provider.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/auth_strings.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<void> _login() async {
    try {
      final user = await _authService.login(
        _emailController.text,
        _passwordController.text,
      );
      if (user != null) {
        Provider.of<AuthProvider>(context, listen: false).login(user);
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed')));
    }
  }

  Future<void> _authenticateWithBiometrics() async {
    try {
      bool isAuthenticated = await _localAuth.authenticate(
        localizedReason: 'Please authenticate to access the app',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      if (isAuthenticated) {
        // Automatically log in the user
        // You can navigate to home screen or other actions
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Authentication failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
              style: ElevatedButton.styleFrom(primary: primaryColor),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _authenticateWithBiometrics,
              icon: Icon(Icons.fingerprint),
              label: Text('Login with Fingerprint'),
              style: ElevatedButton.styleFrom(primary: primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
