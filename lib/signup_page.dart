import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup/auth_helper.dart';

import 'routes_name.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  //* controller
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up Page", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey[700],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Please Sign Up for your account',
                  style: TextStyle(color: Colors.black87, fontSize: 22),
                ),
              ),
            ),
            SizedBox(height: 15),
            _buildTextField('Enter Your name', nameController),
            SizedBox(height: 15),
            _buildTextField(
              'Enter your email',
              emailController,
              keyboard: TextInputType.emailAddress,
            ),
            SizedBox(height: 15),
            _buildTextField(
              'Enter your password',
              passwordController,
              keyboard: TextInputType.visiblePassword,
            ),
            SizedBox(height: 15),
            _buildTextField(
              'Enter your confirm password',
              confirmPasswordController,
              keyboard: TextInputType.visiblePassword,
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () async {
                    String password = passwordController.text.trim();
                    String confirmPassword = confirmPasswordController.text
                        .trim();

                    if (password != confirmPassword) {
                      print("Passwords do not match!");
                      return;
                    }

                    final user = await AuthHelper.instance.signUp(
                      emailController.text.trim(),
                      password,
                    );

                    if (user != null) {
                      print("Account created!");
                      Get.toNamed(RoutesName.initial);
                    } else {
                      print("Signup failed");
                    }
                  },

                  child: Text("Sign Up"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //* textformfield widget
  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    TextInputType keyboard = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        keyboardType: keyboard,
      ),
    );
  }
}
