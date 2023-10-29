import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';

class book_drop_down extends StatefulWidget {
  List<String> selectedBooks = [];
  book_drop_down({
    super.key,
  });
  @override
  State<book_drop_down> createState() => _book_drop_downState();
}

class _book_drop_downState extends State<book_drop_down> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFAFAFA),
      child: DropDownMultiSelect(
        options: ["Joh", "Gen", "Mat"],
        selectedValues: widget.selectedBooks,
        onChanged: (value) {
          setState(() {
            widget.selectedBooks = value;
          });
        },
        whenEmpty: "tap to select books",
      ),
    );
  }
}
