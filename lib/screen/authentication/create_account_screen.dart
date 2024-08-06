import 'package:flutter/material.dart';
import 'package:gemini_comp_ai/service/api-integration/post_create_user.dart';
import 'package:gemini_comp_ai/service/shared_preference/shared_prference.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> createUserResponse() async {
    final response = await createUserAccount(
      userName: nameController.text,
      password: passwordController.text,
      email: emailController.text,
    );
    if (response.isSuccessful == true) {
      // userLoginCredential(userId: response.data!.objectId);
      Navigator.pushNamed(context, "login_screen");
    } else {
      // show snak bar with error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(
            hintText: 'Enter User Name',
          ),
        ),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Enter Email Name',
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
            createUserResponse();
          },
          child: Text("Create"),
        )
      ],
    ));
  }
}
