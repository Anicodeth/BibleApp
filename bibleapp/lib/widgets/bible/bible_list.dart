import 'package:bibleapp/models/bible/bible.dart';
import 'package:bibleapp/widgets/chapter/chapters.dart';
import 'package:bibleapp/widgets/headers/bible_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../../controllers/bible_reading_controller/bloc/bible_reading_bloc.dart';

class Bibles extends StatelessWidget {
  final List<BibleModel> bibles;
  const Bibles({super.key, required this.bibles});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        const BibleHeader(),
         Container(

            margin: EdgeInsets.only(top: screenHeight * 0.1),
            padding: EdgeInsets.all(screenWidth * 0.04),
            width: 0.87 * screenWidth, // Set the width of the card
            constraints: BoxConstraints(maxHeight: 0.25 * screenHeight),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 74, 121, 159),Color.fromRGBO(153, 170, 207, 1)], // Define your gradient colors
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.4, 1]
              ),
              borderRadius: BorderRadius.circular(10), // Set the border radius
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: Text(
                      "Today's Verse",
                      style: TextStyle(color: Colors.white),
                      ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Jhon 1:1",
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 203, 199, 199).withOpacity(0.3),
                          borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Text(
                          "NASB",
                          style: TextStyle(color: Colors.white),
                          ),
                      ),
                    ],
                  ),
                  Text(
                    "In the begining was a Word, and the Word was with God, and the word was God",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                      "Start Reading",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16,)
                    ],
                  )
                ],
                )
            ),
          ),
        Container(
          width: screenWidth,
          margin: EdgeInsets.only(top: screenHeight * 0.36, left: screenWidth * 0.07),
          child: Text(
              "Bible Versions",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  
          ),
        ),
        Container(
            width: 0.87 * screenWidth,
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
             ),
            margin: EdgeInsets.only(top:  screenHeight * 0.4),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: screenWidth * 0.01,
                mainAxisSpacing: screenWidth * 0.01,
                childAspectRatio: 0.85,
                ),
              scrollDirection: Axis.vertical,
              itemCount: bibles.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return TextButton(
                        onPressed: () {
                          BlocProvider.of<BibleReadingBloc>(context).add(
                              SectionsLoaded(
                                  bibles[index].sections, bibles[index].name));
                        },
                        child:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: screenWidth * 0.4,
                                height: screenWidth * 0.4,
                                constraints: BoxConstraints(maxHeight: screenWidth * 0.4,maxWidth: screenWidth * 0.4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.transparent,
                                  image: DecorationImage(image: AssetImage('assets/images/images${index + 1}.jpg'))
                                ),
                                child: Text("")
                              ),
                              Text(bibles[index].name)
                            ],
                          ),
                      );
              },
            )),
      ],
    );
  }

String formatDate(DateTime date) {
  final formatter = DateFormat('MMMM d, y');
  return formatter.format(date);
}
}
