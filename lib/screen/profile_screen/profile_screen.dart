import 'package:flutter/material.dart';
import 'package:gemini_comp_ai/constant/const_file.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName ="";
  String userEmail ="";


  getUserData() async {
    SharedPreferences userLoginCredential = await SharedPreferences.getInstance();
    setState(() {
      userName = userLoginCredential.getString("userName") ??"";
      userEmail = userLoginCredential.getString("email") ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    Size widgetSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: widgetSize.width,
            height: widgetSize.height / 2.4,
            // decoration: const BoxDecoration(color: Colors.black),
            child: Column(
              children: [
                const SizedBox(height: 40),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "asset/image/avatar.jpg",
                    height: widgetSize.height / 7,
                    width: widgetSize.width / 3.5,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  userName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  userEmail,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: widgetSize.height / 3.5, bottom: 20),
            width: widgetSize.width,
            // height: widgetSize.height / 2,
            decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    onTap: () {
                      // Navigator.pushNamed(context, "about_us_screen");
                    },
                    leading: Icon(Icons.info),
                    title: const Text("About Us"),
                    subtitle: const Text("Read About Us"),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.logout),
                    title: const Text("Logout"),
                    subtitle: const Text("Logout from your account"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
