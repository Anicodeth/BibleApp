import 'package:bibleapp/views/plan_screen/plan_detail_view.dart';
import 'package:bibleapp/widgets/plan/book_drop_down.dart';
import 'package:bibleapp/widgets/plan/customize_date_field.dart';
import 'package:bibleapp/widgets/plan/customize_drop_down_menu.dart';
import 'package:bibleapp/widgets/plan/customize_text_field.dart';
import 'package:bibleapp/widgets/plan/frequency_drop_down.dart';
import 'package:bibleapp/widgets/plan/plan_task_card.dart';
import 'package:flutter/material.dart';

class PlanView extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final book_drop_down booksWidget = book_drop_down();
  final FrequencyDropDown frequencyWidget = FrequencyDropDown();

  PlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const ListTile(
            title: Text("My Plans"),
            leading: Icon(
              Icons.calendar_today,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlanDetailView(),
                  ),
                );
              },
              child: PlanTaskCard(),
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: ListView(
                      children: [
                        Center(
                          child: Text(
                            "Create a new plan",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomizeTextField(
                          textEditingController: titleController,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomizeDropDownMenu(
                          label: "Books",
                          dropDown: booksWidget,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomizeDropDownMenu(
                          label: "frequency",
                          dropDown: frequencyWidget,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomizeDateField(
                          textEditingController: startDateController,
                          label: "Start Date",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomizeDateField(
                          textEditingController: endDateController,
                          label: "End Date",
                        ),
                        SizedBox(
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
                                child: Text("Cancel"),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 3,
                              child: ElevatedButton(
                                onPressed: () {
                                  print(booksWidget.selectedBooks);
                                  print(frequencyWidget.selected);
                                },
                                child: Text("Done"),
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
            label: Text('Create Plan'),
            icon: Icon(Icons.add),
            backgroundColor: Color(0xFF3498DB),
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