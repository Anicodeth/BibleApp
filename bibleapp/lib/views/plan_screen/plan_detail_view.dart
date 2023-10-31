import 'package:bibleapp/controllers/note_screen_controller/bloc/note_bloc.dart';
import 'package:bibleapp/controllers/plan_screen_controller/bloc/plan_bloc.dart';
import 'package:bibleapp/models/plan/plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanDetailView extends StatelessWidget {

  final Plan plan;

  const PlanDetailView({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {

    final int numberOfDays = plan.endDate.difference(plan.startDate).inDays;
    
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
          actions: [
            PopupMenuButton<String>(
                  color: Colors.black,
                  onSelected: (value) {

                    if (value == 'delete') {

                      BlocProvider.of<PlanBloc>(context).add(
                        DeletePlan(plan: plan));
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Successfully Deleted")));

                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete'),
                      ),
                    ];
                  },
                ),
          ],
          title: Text(
            "plan detail view",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: BlocBuilder<PlanBloc, PlanState>(builder: (context, state){
          return 
          Padding(
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
                                  Text(plan.title),
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
                        Text("${plan.days.length} of ${numberOfDays} sessions completed"),
                        LinearProgressIndicator(
                          minHeight: 6,
                          value: (plan.days.length / numberOfDays),
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
                    flex: 10,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Reading Sessions",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                                ),
                            ),
                            Text(
                              "${numberOfDays - plan.days.length} sessions left",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14
                                ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: numberOfDays,
                            itemBuilder: (context, index) => PlanDayCard(days: plan.days, idx: index, title: plan.title,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
            },)
          ),
        );
  }
}

class PlanDayCard extends StatelessWidget {
  List<String> days;
  String title;
  int idx;
  PlanDayCard({
    super.key,
    required this.days,
    required this.idx,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlanBloc, PlanState>(builder: (context, state) {
      if (state is PlansLoaded){
        return Card(
          child: Container(
            color: days.contains("day${idx}") ? Color.fromARGB(255, 141, 190, 231) : Colors.white ,
            height: 60,
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Day ${idx}"),
                Text(title),
                Row(children: [
                  Icon(
                  Icons.menu_book,
                  color: Colors.blue,
                ),
                PopupMenuButton<String>(
                      onSelected: (value) {

                        if (value == 'Done') {

                          BlocProvider.of<PlanBloc>(context).add(
                            MarkAsDone(dayidx: idx, title: title));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Successfully Marked")));

                        } else if (value == 'Undo') {
                          BlocProvider.of<PlanBloc>(context).add(
                            UndoMark(dayidx: idx, title: title));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Successfully unmarked")));

                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                            value: 'Done',
                            child: Text('Done'),
                          ),
                          PopupMenuItem(
                            value: 'Undo',
                            child: Text('Undo'),
                          ),
                        ];
                      },
                    ),
                ],)
              ],
            ),
          ),
        );
      }else{
        return Center(child: Text("Error on Loading Plans"));
      }
      
    }
    ); 
  }
}
