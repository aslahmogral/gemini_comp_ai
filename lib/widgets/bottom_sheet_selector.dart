import 'package:flutter/material.dart';
import 'package:gemini_comp_ai/constant/const_file.dart';

bottomSheet({
  required BuildContext context,
  required Widget childWidget,
}) {
  showModalBottomSheet(
    showDragHandle: true,
    isScrollControlled: true,
    enableDrag: true,
    shape: bottomSheetShape,
    context: context,
    builder: (context) {
      return childWidget;
    },
  );
}