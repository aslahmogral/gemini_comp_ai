import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:gemini_comp_ai/constant/const_file.dart';
import 'package:gemini_comp_ai/service/api-integration/post_create_user.dart';
import 'package:gemini_comp_ai/service/shared_preference/shared_prference.dart';
import 'package:gemini_comp_ai/widgets/bottom_sheet_selector.dart';
import 'package:gemini_comp_ai/widgets/button_widgets.dart';
import 'package:intl/intl.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool loading = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController reminderTime = TextEditingController();

  Future<void> createUserResponse() async {
    setState(() {
      loading = true;
    });
    final response = await createUserAccount(
      reminderDateTime: time,
      reminderTime: formattedTime ?? "",
      userName: nameController.text,
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
    }
    setState(() {
      loading = false;
    });
  }

  DateTime time = DateTime.now();
  String? formattedTime;

  setPickedTime(DateTime pickedTime) {
    setState(() {
      reminderTime.text = pickedTime.toString();
      time = pickedTime;
      formattedTime = DateFormat('HH:mm:ss').format(pickedTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Theme(
              data: ThemeData(
                primaryColor: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 160),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      prefixIcon: Icon(Icons.person),
                      labelText: "name",
                      hintText: 'Enter User Name',
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      prefixIcon: Icon(Icons.email),
                      labelText: "email",
                      hintText: 'Enter Email',
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
                  SizedBox(height: 15),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      border: greyBorder,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Set Reminder Time",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Divider(color: Colors.white),
                        Text(timerSetupText, style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      bottomSheet(
                        context: context,
                        childWidget: SizedBox(
                          height: 350,
                          child: Column(
                            children: [
                              TimePickerSpinner(
                                is24HourMode: false,
                                spacing: 50,
                                itemHeight: 80,
                                isForce2Digits: true,
                                onTimeChange: (time) {
                                  setPickedTime(time);
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: primaryButtonWidget(
                                  context: context,
                                  buttonAction: () {
                                    Navigator.pop(context);
                                  },
                                  buttonText: "Save Time",
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      enabled: false,
                      controller: reminderTime,
                      decoration: InputDecoration(
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          prefixIcon: Icon(Icons.alarm),
                          labelText: "alarm time",
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 20),
                  primaryButtonWidget(
                    context: context,
                    buttonAction: () {
                      createUserResponse();
                    },
                    buttonText: loading ? "Loading.." : "Create Account",
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "login_screen");
                    },
                    child: Text("You have an account? Login here"),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
