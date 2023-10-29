import 'package:bibleapp/models/bible/bible.dart';
import 'package:bibleapp/models/chapter/chapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/bible_reading_controller/bloc/bible_reading_bloc.dart';

class SectionHeader extends StatelessWidget {
  
  final String bibleName;
  const SectionHeader({super.key, required this.bibleName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: ()=>{
                  BlocProvider.of<BibleReadingBloc>(context).add(BiblesLoaded())
                },
              icon: Icon(Icons.arrow_back)
              ),

              Container(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                child: Text(
                  bibleName,
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
