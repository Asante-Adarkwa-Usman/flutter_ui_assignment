import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _passwordvisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //Vet Records Logo
              Image.asset(
                'assets/images/vet_records_logo.jpg',
                width: 120,
                height: 120,
              ),
              const Text(
                'Welcome to a \n Vet Records',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    //Email TextField
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            autofocus: true,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter email',
                              hintStyle: const TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(
                                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                                  ).hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          //Password TextField
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _passwordvisible ? false : true,
                            autofocus: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter password',
                              hintStyle: const TextStyle(color: Colors.grey),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _passwordvisible = !_passwordvisible;
                                  });
                                },
                                child: Icon(
                                  _passwordvisible
                                      ? Icons.visibility
                                      : Icons.visibility_off_rounded,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              if (!RegExp(
                                r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$',
                              ).hasMatch(value)) {
                                return 'Password must contain at least one uppercase letter, \n one lowercase letter, and one number';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              //Forgot Password and Reset Texts
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle reset password action
                    },
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              //const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Need an account?',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Row(
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Handle register action
                        },
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //Divider
              const Divider(
                color: Colors.grey,
                thickness: .5,
                endIndent: 30,
                indent: 30,
              ),
              const SizedBox(height: 20),
              //Login Button
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle login action
                    if (_formKey.currentState!.validate()) {
                      // Perform login action
                      String email = _emailController.text;
                      String password = _passwordController.text;
                      // Add your login logic here
                      print('Email: $email, Password: $password');
                      //Toast message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Login successful!'),
                          duration: Duration(seconds: 4),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 3,
                  ),
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
