// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String label;
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize:const Size(double.infinity, 50),
      ),
      child: Text(label),
    );
  }
}
