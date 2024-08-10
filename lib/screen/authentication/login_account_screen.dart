import 'package:flutter/material.dart';
import 'package:gemini_comp_ai/service/api-integration/auth_user.dart';
import 'package:gemini_comp_ai/service/shared_preference/shared_prference.dart';
import 'package:gemini_comp_ai/widgets/button_widgets.dart';

class LoginAccountScreen extends StatefulWidget {
  const LoginAccountScreen({super.key});

  @override
  State<LoginAccountScreen> createState() => _LoginAccountScreenState();
}

class _LoginAccountScreenState extends State<LoginAccountScreen> {
  bool loading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> authUserResponse() async {
    setState(() {
      loading = true;
    });
    final response = await userLogin(
      password: passwordController.text,
      email: emailController.text,
    );
    if (response.isSuccessful == true) {
      userLoginCredential(
        userId: response.data!.objectId,
        email: response.data!.email,
        userName: response.data!.userName,
        reminderDateTime: response.data!.reminderDateTime.toString(),
        reminderTime: response.data!.reminderTime,
      );
      Navigator.pushNamed(context, "home_screen");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.message ?? "Failed")));
      // show snak bar with error
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Image.asset("asset/image/app_logo.jpg"),
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  prefixIcon: Icon(Icons.email),
                  labelText: "Email",
                  hintText: 'Enter User Name',
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                style: TextStyle(color: Colors.white),
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  labelText: "password",
                  hintText: 'Enter User Password',
                ),
              ),
              SizedBox(height: 20),
              primaryButtonWidget(
                context: context,
                buttonAction: () {
                  authUserResponse();
                },
                buttonText: loading ? 'Loading...' : 'Login',
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "create_account_screen");
                },
                child: Text("You are a new User please create account"),
              )
            ],
          ),
        ));
  }
}
