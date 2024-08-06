import 'package:flutter/material.dart';
import 'package:gemini_comp_ai/service/api-integration/auth_user.dart';
import 'package:gemini_comp_ai/service/shared_preference/shared_prference.dart';

class LoginAccountScreen extends StatefulWidget {
  const LoginAccountScreen({super.key});

  @override
  State<LoginAccountScreen> createState() => _LoginAccountScreenState();
}

class _LoginAccountScreenState extends State<LoginAccountScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> authUserResponse() async {
    final response = await userLogin(
      password: passwordController.text,
      email: emailController.text,
    );
    if (response.isSuccessful == true) {
      userLoginCredential(userId: response.data!.objectId);
      Navigator.pushNamed(context, "home_screen");
    }else{
      // show snak bar with error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Enter User Name',
          ),
        ),
        TextFormField(
          controller: passwordController,
          decoration: InputDecoration(
            hintText: 'Enter User Password',
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            authUserResponse();
          },
          child: Text("Login"),
        )
      ],
    ));
  }
}
