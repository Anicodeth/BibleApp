import 'package:bibleapp/models/plan/plan.dart';
import 'package:bibleapp/widgets/note/tag_card.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PlanTaskCard extends StatelessWidget {

  final Plan plan;

  const PlanTaskCard({super.key, required this.plan});

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
                SizedBox(
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plan.title,
                        style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      Text(
                        '${plan.endDate.day - plan.startDate.day} Days, ${plan.frequency}',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Color.fromARGB(255, 95, 95, 95)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: plan.books.map((item) => TagCard(tageName: item)).toList(),
                      )
                    ],
                  ),
                ),
                CircularPercentIndicator(
                  radius: 40.0,
                  lineWidth: 8.0,
                  percent: plan.progress,
                  center: Text('${plan.progress * 100}%'),
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
