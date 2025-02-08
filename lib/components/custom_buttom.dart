import 'package:flutter/material.dart';
class CustomButtom extends StatelessWidget {
  final String elevetedButtonText;
  final String fieldButtonText;
  final VoidCallback clickElevated;
  final VoidCallback clickField;

  const CustomButtom({super.key,
    required this.elevetedButtonText,
    required this.fieldButtonText,
    required this.clickElevated,
    required this.clickField});

  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [
        SizedBox(height: 30,),
        ElevatedButton(onPressed:  clickElevated  , child: Text(elevetedButtonText)),
        SizedBox(height: 30,),
        TextButton(onPressed: clickField, child: Text(fieldButtonText))
      ],
    );
  }
}
