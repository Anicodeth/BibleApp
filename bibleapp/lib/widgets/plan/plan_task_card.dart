import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PlanTaskCard extends StatelessWidget {
  const PlanTaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("you have some text to make"),
                      Text("you have some text to make"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          booksRepr(),
                          booksRepr(),
                          booksRepr(),
                          booksRepr(),
                        ],
                      )
                    ],
                  ),
                ),
                CircularPercentIndicator(
                  radius: 40.0,
                  lineWidth: 8.0,
                  percent: 0.6,
                  center: const Text("60%"),
                  progressColor: Colors.green,
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        )
      ],
    );
  }
}

class booksRepr extends StatelessWidget {
  const booksRepr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text("book"),
      padding: EdgeInsets.all(3),
      margin: EdgeInsets.only(right: 3),
    );
  }
}
