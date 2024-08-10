import 'package:flutter/material.dart';

Widget primaryButtonWidget({
  required BuildContext context,
  required void Function() buttonAction,
  required String buttonText,
   Color? buttonColor,
   Color? textColor,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: buttonColor ?? Colors.white,
      fixedSize: Size(
        MediaQuery.of(context).size.width,
        50,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    onPressed: buttonAction,
    child: Text(buttonText,style: TextStyle(color: textColor ?? Colors.black),),
  );
}
