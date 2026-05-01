  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';
  import '../home_screen.dart';
  import 'signup_screen.dart';
  import 'forgot_password.dart';
  import '../../providers/theme_provider.dart';
  import '../../providers/profile_provider.dart';
  
  class LoginScreen extends StatefulWidget {
    const LoginScreen({super.key});
  
    @override
    State<LoginScreen> createState() => _LoginScreenState();
  }
  
  class _LoginScreenState extends State<LoginScreen> {
    final _formKey = GlobalKey<FormState>();
    final _identifierController = TextEditingController();
    final _passwordController = TextEditingController();
  
    @override
    void dispose() {
      _identifierController.dispose();
      _passwordController.dispose();
      super.dispose();
    }
  
    void _handleLogin() {
      if (_formKey.currentState!.validate()) {
        final identifier = _identifierController.text.trim();
        final password = _passwordController.text;
  
  
        context.read<ProfileProvider>().setProfile(
          displayName: identifier,
          identifier: identifier,
          password: password,
        );
  
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      }
    }
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "NovaPlay",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text("Your Game Store", style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: _identifierController,
                    decoration: const InputDecoration(labelText: "Username or Email"),
                    validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Enter username or email' : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: "Password"),
                    validator: (value) =>
                    value == null || value.isEmpty ? 'Enter your password' : null,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()),
                        );
                      },
                      child: const Text("Forgot Password?"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _handleLogin,
                      child: const Text("Login"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignupScreen()),
                      );
                    },
                    child: const Text("Create an account"),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }