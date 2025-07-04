import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/age_group_screen.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _emailError;
  String? _passwordError;
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  void _validateAndLogin() async {
    setState(() {
      _emailError = null;
      _passwordError = null;
    });

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    bool isValid = true;

    if (email.isEmpty) {
      setState(() => _emailError = 'Please enter your email');
      isValid = false;
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      setState(() => _emailError = 'Enter a valid email');
      isValid = false;
    }

    if (password.isEmpty) {
      setState(() => _passwordError = 'Please enter your password');
      isValid = false;
    } else if (password.length < 8) {
      setState(() => _passwordError = 'Password must be at least 8 characters');
      isValid = false;
    }

    if (!isValid) {
      Fluttertoast.showToast(
        msg: "Please fix the errors",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 2)); // simulate login delay

    setState(() => _isLoading = false);

    Fluttertoast.showToast(
      msg: "Login successful 🎉",
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AgeSelectionPage()),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: FadeInUp(
              duration: const Duration(milliseconds: 800),
              child: Column(
                children: [
                  // Healthcare Logo
                  Pulse(
                    duration: const Duration(milliseconds: 1500),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.medical_services,
                        size: 60,
                        color: Color(0xFF1A6FEE),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Login Card
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Welcome Back',
                              style: Theme.of(context).textTheme.headlineMedium,
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 8),

                            Text(
                              'Sign in to access your healthcare services',
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 32),

                            // Email Field
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Email Address',
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                errorText: _emailError,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                            ),

                            const SizedBox(height: 20),

                            // Password Field
                            TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                                errorText: _passwordError,
                              ),
                              obscureText: !_isPasswordVisible,
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (_) => _validateAndLogin(),
                            ),

                            const SizedBox(height: 16),

                            // Forgot Password
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Fluttertoast.showToast(
                                    msg: "Password reset initiated",
                                    backgroundColor: Colors.blue,
                                  );
                                },
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      color: Color(0xFF1A6FEE),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),

                            const SizedBox(height: 24),

                            // Login Button
                            ZoomIn(
                              duration: const Duration(milliseconds: 800),
                              child: ElevatedButton(
                                onPressed:
                                    _isLoading ? null : _validateAndLogin,
                                style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 18),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: _isLoading
                                    ? const SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 3,
                                          color: Colors.white,
                                        ),
                                      )
                                    : const Text(
                                        'Login',
                                        style: TextStyle(fontSize: 18),
                                      ),
                              ),
                            ),

                            const SizedBox(height: 24),

                            // Sign Up Prompt
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Fluttertoast.showToast(
                                      msg: "Sign up screen would open",
                                      backgroundColor: Colors.blue,
                                    );
                                  },
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        color: Color(0xFF1A6FEE),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Privacy Notice
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Your health data is securely encrypted and protected',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 12, color: Colors.grey.shade600),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


