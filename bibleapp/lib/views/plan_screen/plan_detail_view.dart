import 'package:flutter/material.dart';

class PlanDetailView extends StatelessWidget {
  const PlanDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Text(
            "plan detail view",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            right: 20,
            left: 20,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                        flex: 4,
                        child: SizedBox(
                          height: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Next Reading"),
                              Text("James 1:1 - 1:8"),
                            ],
                          ),
                        )),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          child: Text("Read"),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 2,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("3 of 30 sessions completed"),
                    LinearProgressIndicator(
                      minHeight: 6,
                      value: 0.1,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    ElevatedButton(
                      child: Text("View"),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 16,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Reading"),
                        Text("Reading"),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) => const PlanDayCard(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlanDayCard extends StatelessWidget {
  const PlanDayCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 60,
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Day 4"),
            Text("James 1:1 - 1:8"),
            Icon(
              Icons.menu_book,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
