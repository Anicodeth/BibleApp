import 'package:bibleapp/views/bible_screen/bible_page.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/bible_reading_controller/bloc/bible_reading_bloc.dart';
>>>>>>> origin/shamil

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar: Container(
            color: Colors.white,
<<<<<<< HEAD
            child: const BottomAppBar(
=======
            child: BottomAppBar(
>>>>>>> origin/shamil
              shadowColor: Colors.black,
              child: TabBar(
                indicatorColor: Colors.black,
                labelColor: Colors.white,
                tabs: [
                  Tab(
                      icon: Column(
                    children: [
<<<<<<< HEAD
                      Icon(Icons.menu_book_outlined, color: Colors.black),
=======
                      GestureDetector(
                        child:
                            Icon(Icons.menu_book_outlined, color: Colors.black),
                        onTap: () {
                          BlocProvider.of<BibleReadingBloc>(context)
                              .add(BiblesLoaded());
                        },
                      ),
>>>>>>> origin/shamil
                      Text(
                        "Bible",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  )),
                  Tab(
                      icon: Column(
                    children: [
                      Icon(Icons.search, color: Colors.black),
                      Text(
                        "Search",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  )),
                  Tab(
                      icon: Column(
                    children: [
                      Icon(Icons.calendar_month_outlined, color: Colors.black),
                      Text(
                        "Plans",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  )),
                  Tab(
                      icon: Column(
                    children: [
                      Icon(
                        Icons.bookmark_border,
                        color: Colors.black,
                      ),
                      Text(
                        "My Notes",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  )),
                ],
              ),
            ),
          ),
          // TODO: This contents will be screens
<<<<<<< HEAD
          body: const TabBarView(
            children: [
              Center(child: Text("Bible")),
=======
          body: TabBarView(
            children: [
              BiblePage(),
>>>>>>> origin/shamil
              Center(child: Text("Search")),
              Center(child: Text("Plans")),
              Center(child: Text("My Notes")),
            ],
          ),
        ),
      ),
    );
  }
}
