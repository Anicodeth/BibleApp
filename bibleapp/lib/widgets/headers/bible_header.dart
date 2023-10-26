import 'package:bibleapp/models/bible/bible.dart';
import 'package:bibleapp/models/chapter/chapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BibleHeader extends StatelessWidget {
  const BibleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                child: const Text(
                  "Holy Bible",
                  style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
