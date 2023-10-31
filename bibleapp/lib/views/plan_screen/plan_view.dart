import 'package:bibleapp/controllers/note_screen_controller/bloc/note_bloc.dart';
import 'package:bibleapp/controllers/plan_screen_controller/bloc/plan_bloc.dart';
import 'package:bibleapp/models/plan/plan.dart';
import 'package:bibleapp/views/plan_screen/plan_detail_view.dart';
import 'package:bibleapp/widgets/plan/book_drop_down.dart';
import 'package:bibleapp/widgets/plan/customize_date_field.dart';
import 'package:bibleapp/widgets/plan/customize_drop_down_menu.dart';
import 'package:bibleapp/widgets/plan/customize_text_field.dart';
import 'package:bibleapp/widgets/plan/frequency_drop_down.dart';
import 'package:bibleapp/widgets/plan/plan_task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanView extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final List<DateTime> startDateController = [DateTime.now()];
  final List<DateTime> endDateController = [DateTime.now()];
  final book_drop_down booksWidget = book_drop_down();
  final FrequencyDropDown frequencyWidget = FrequencyDropDown();

  PlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const ListTile(
            title: Text(
              "My Plans",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            leading: Icon(
              Icons.calendar_today,
              color: Color(0xFF3498DB),
            ),
          ),
        ),
        body: BlocBuilder<PlanBloc, PlanState>(
          builder: (context, state){
            if (state is PlansLoaded){

              if (state.plans.length == 0){
                return Center(
                  child: Text("No Plans Created"),
                );
              }

              return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: state.plans.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlanDetailView(plan: state.plans[index]),
                      ),
                    );
                  },
                  child: PlanTaskCard(plan: state.plans[index]),
                ),
              ),
            );
            }else{
              return Center(
                child: Text("Error while loading data"),
              );
            }
          },
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                      children: [
                        const Center(
                          child: Text(
                            "Create a new plan",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomizeTextField(
                          textEditingController: titleController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomizeDropDownMenu(
                          label: "Books",
                          dropDown: booksWidget,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomizeDropDownMenu(
                          label: "frequency",
                          dropDown: frequencyWidget,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomizeDateField(
                          textEditingController: startDateController,
                          label: "Start Date",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomizeDateField(
                          textEditingController: endDateController,
                          label: "End Date",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel"),
                              ),
                            ),
                            const Expanded(
                              flex: 4,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 3,
                              child: ElevatedButton(
                                onPressed: () {
                                  print(titleController.text);
                                  print(startDateController[0]);

                                  BlocProvider.of<PlanBloc>(context).add(
                                    AddPlan(plan: Plan(
                                      title: titleController.text,
                                      books: booksWidget.selectedBooks,
                                      frequency: frequencyWidget.selected,
                                      startDate: startDateController[0],
                                      endDate: endDateController[0],
                                      days: [],
                                      ),),);

                                },
                                child: const Text("Done"),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            label: const Text('Create Plan'),
            icon: const Icon(Icons.add),
            backgroundColor: const Color(0xFF3498DB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
