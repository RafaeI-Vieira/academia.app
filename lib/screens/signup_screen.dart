import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> _saveSignUpInfo() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _nameController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('password', _passwordController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sign up information saved!')),
    );
  }

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
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
        ),
        title: Text(
          'Create Account',
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Let\'s Start!',
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 20),
              Container(
                color: Color(0xFFB3A0FF).withOpacity(0.7),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Full name',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextField(
                      controller: _nameController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Your Name',
                        labelStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email or Mobile Number',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextField(
                      controller: _emailController,
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: '+123 567 89000',
                        labelStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Password',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextField(
                      controller: _passwordController,
                      style: TextStyle(color: Colors.black),
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: '********',
                        labelStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Confirm Password',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextField(
                      controller: _confirmPasswordController,
                      style: TextStyle(color: Colors.black),
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: '********',
                        labelStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Text(
                'By continuing, you agree to',
                style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                    },
                    child: Text(
                      'Terms of Use',
                      style: TextStyle(color: const Color(0xFFE2F163)),
                    ),
                  ),
                  Text(
                    ' and ',
                    style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  TextButton(
                    onPressed: () {
                    },
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(color: const Color(0xFFE2F163)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () async {
                  await _saveSignUpInfo();
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'or sign up with',
                style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                    },
                    icon: Image.asset('assets/images/Google Icon.png'),
                    iconSize: 50,
                  ),
                  IconButton(
                    onPressed: () {
                    },
                    icon: Image.asset('assets/images/Facebook Icon.png'),
                    iconSize: 50,
                  ),
                  IconButton(
                    onPressed: () {
                    },
                    icon: Image.asset('assets/images/Fingerprint Icon.png'),
                    iconSize: 50,
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text(
                  'Already have an account? Log in',
                  style: TextStyle(color: Colors.greenAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
