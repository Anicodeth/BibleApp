import 'package:bibleapp/views/bible_screen/bible_page.dart';
import 'package:flutter/material.dart';

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
            child: const BottomAppBar(
              shadowColor: Colors.black,
              child: TabBar(
                indicatorColor: Colors.black,
                labelColor: Colors.white,
                tabs: [
                  Tab(
                      icon: Column(
                    children: [
                      Icon(Icons.menu_book_outlined, color: Colors.black),
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
          body: TabBarView(
            children: [
              Text("Bible"),
              Text("Search"),
              Text("Plans"),
              Text("My Notes"),
            ],
          ),
        ),
      ),
    );
  }
}
