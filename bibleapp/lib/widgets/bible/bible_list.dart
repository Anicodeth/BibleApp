import 'package:bibleapp/models/bible/bible.dart';
import 'package:bibleapp/widgets/chapter/chapters.dart';
import 'package:bibleapp/widgets/headers/bible_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

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
            padding: EdgeInsets.all(10),
            width: 0.97 * screenWidth, // Set the width of the card
            constraints: BoxConstraints(maxHeight: 0.25 * screenHeight),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 21, 119, 199), Color.fromARGB(255, 132, 183, 235)], // Define your gradient colors
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10), // Set the border radius
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
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
            margin: EdgeInsets.only(top:  screenHeight * 0.4),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1.2,
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
                          Container(
                            constraints: BoxConstraints.expand(),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.transparent,
                              image: DecorationImage(image: AssetImage('assets/images/images${index + 1}.jpg'))
                            ),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              // children: [
                              //   Text(
                              //     bibles[index].name,
                              //     style: const TextStyle(
                              //         fontSize: 18,
                              //         color: Colors.black,
                              //         fontWeight: FontWeight.bold),
                              //   ),
                              //   SizedBox(height: 30,),
                              //   Text(
                              //     " ${bibles[index].sections.length} Sections",
                              //     style: TextStyle(
                              //       fontSize: 16,
                              //       color: Colors.grey.shade700,
                              //     ),
                              //   ),
                              // ],
                            ),
                          ),
                      );
              },
            )),
      ],
    );
  }
}
