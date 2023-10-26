import 'package:flutter/material.dart';

class TagCard extends StatelessWidget {
  final String tageName;
  const TagCard({super.key, required this.tageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xFFEFEFEF),
      ),
      
      child: Text(
        tageName,
        style: TextStyle(
          color: Color(0xFF393939),
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
