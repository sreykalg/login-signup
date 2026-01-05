import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup/auth_helper.dart';

import 'routes_name.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //* controller
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey[700],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Login to your account',
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () async {
                    final user = await AuthHelper.instance.signIn(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );

                    if (user != null) {
                      print("Successfully logged in!");
                      Get.toNamed(RoutesName.initial);
                    } else {
                      print("Login failed");
                      Get.toNamed(RoutesName.signup);
                    }
                  },
                  child: Text("Log in"),
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
