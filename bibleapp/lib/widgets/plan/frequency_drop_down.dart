import 'package:flutter/material.dart';

class FrequencyDropDown extends StatefulWidget {
  String? selected = "Everyday";
  FrequencyDropDown({
    super.key,
  });

  @override
  State<FrequencyDropDown> createState() => _FrequencyDropDownState();
}

class _FrequencyDropDownState extends State<FrequencyDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFAFAFA),
      child: DropdownButton(
        value: widget.selected,
        isExpanded: true,
        onChanged: (value) {
          setState(() {
            widget.selected = value;
          });
        },
        items: ["Everyday", "Sometimes", "usually"]
            .map(
              (e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        underline: Container(
          // Remove the underline by setting it to an empty Container
          height: 0,
        ),
        icon: Icon(
          Icons.arrow_drop_down,
          color: Color(0xFF3498DB),
        ),
      ),
    );
  }
}
