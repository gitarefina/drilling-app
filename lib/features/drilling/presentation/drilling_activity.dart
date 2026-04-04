import 'package:drilling_app/core/helper/custom_button.dart';
import 'package:drilling_app/core/helper/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrillingPage extends StatefulWidget {
  const DrillingPage({super.key});

  @override
  State<DrillingPage> createState() => _DrillingPageState();
}

class _DrillingPageState extends State<DrillingPage> {
  final TextEditingController holeIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomTextField(controller: holeIdController, hintText: "Hole ID"),
          CustomButton(text: "Accelerometer", onPressed: () {}),
          CustomButton(text: "Gyroscope", onPressed: () {}),
          CustomButton(text: "Take A Picture", onPressed: () {}),
          CustomButton(text: "Take A Picture", onPressed: () {}),
          Spacer(),
          CustomButton(text: "Save As Draft", onPressed: () {}),
          CustomButton(text: "Submit", onPressed: () {}),
        ],
      ),
    );
  }
}
