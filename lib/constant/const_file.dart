import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

String profileImage =
    "https://images.generated.photos/U1rX3NVWoersFNBJQFB9ocjkyfFGkGMhsZkWDBMZQSA/rs:fit:256:256/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92Ml8w/NTk3NDUzLmpwZw.jpg";

// GradientBoxBorder gradientBorder = const GradientBoxBorder(
//   gradient: LinearGradient(
//     colors: [
//       Color.fromARGB(255, 20, 56, 255),
//       Color.fromARGB(255, 9, 87, 255),
//       Color.fromARGB(255, 100, 83, 252),
//       Color.fromARGB(255, 230, 101, 230)
//     ],
//     tileMode: TileMode.mirror,
//     begin: Alignment.topCenter,
//     transform: GradientRotation(10),
//   ),
//   width: 1,
// );

GradientBoxBorder gradientBorder = const GradientBoxBorder(
  gradient: LinearGradient(
    colors: [
      Color.fromARGB(255, 126, 49, 214),
      Color.fromARGB(255, 126, 49, 214),
    ],
    tileMode: TileMode.mirror,
    begin: Alignment.topCenter,
    transform: GradientRotation(10),
  ),
  width: 1,
);

Border whiteBorder = Border.all(color: Colors.white);

Border greyBorder = Border.all(color: Colors.grey);

ShapeBorder bottomSheetShape = const RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(15),
    topRight: Radius.circular(15),
  ),
);

String timerSetupText = "This Gemini AI-powered app helps you create a life journal by automatically opening at your set reminder times and asking thoughtful questions. You can set reminders for any time and frequency.";

String demoJournal =
    "Yesterday began at 7:00 AM with the soft chime of my alarm. I eased into the day with some light stretching and deep breathing exercises, followed by a refreshing shower. I brewed a cup of coffee and sipped it slowly while reading a few pages from my current book. For breakfast, I kept it simple—a bowl of oatmeal topped with fresh berries and a drizzle of honey.";
