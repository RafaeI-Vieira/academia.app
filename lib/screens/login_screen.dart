import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFE2F163)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpScreen()),
            );
          },
        ),
        title: Text(
          'Log In',
          style: TextStyle(
            color: Color(0xFFE2F163),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Text(
                'Welcome',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              SizedBox(height: 15),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                style: TextStyle(color: Colors.white70, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Container(
                color: Color(0xFFB3A0FF).withOpacity(0.7),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildInputField(
                      label: 'Username or email',
                      controller: _emailController,
                      isPassword: false,
                      hintText: 'example@example.com',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    _buildInputField(
                      label: 'Password',
                      controller: _passwordController,
                      isPassword: true,
                      hintText: '*************',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 5),
                    _buildForgotPasswordButton(context),
                  ],
                ),
              ),
              SizedBox(height: 10),
              _buildLoginButton(context),
              SizedBox(height: 10),
              Text('or sign up with', style: TextStyle(color: Colors.white)),
              SizedBox(height: 5),
              _buildSocialLoginButtons(),
              SizedBox(height: 10),
              _buildSignUpButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required bool isPassword,
    required String hintText,
    required String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.black)),
        TextFormField(
          controller: controller,
          style: TextStyle(color: Colors.black),
          obscureText: isPassword,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 255, 255, 255),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildForgotPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
          );
        },
        child: Text('Forgot Password?', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
        side: BorderSide(color: Colors.white),
        padding: EdgeInsets.symmetric(vertical: 16.0),
        minimumSize: Size(double.infinity, 50),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Processing Login')),
          );
        }
      },
      child: Text('Log In', style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            // Logic for Google login
          },
          icon: Image.asset('assets/images/Google Icon.png'),
          iconSize: 50,
        ),
        IconButton(
          onPressed: () {
            // Logic for Facebook login
          },
          icon: Image.asset('assets/images/Facebook Icon.png'),
          iconSize: 50,
        ),
        IconButton(
          onPressed: () {
            // Logic for fingerprint login
          },
          icon: Image.asset('assets/images/Fingerprint Icon.png'),
          iconSize: 50,
        ),
      ],
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUpScreen()),
        );
      },
      child: Text(
        'Don\'t have an account? Sign Up',
        style: TextStyle(color: Colors.greenAccent),
      ),
    );
  }
}
