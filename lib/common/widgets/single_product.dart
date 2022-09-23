// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;

  const SingleProduct({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(10),
      width: 180,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 1.5),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
