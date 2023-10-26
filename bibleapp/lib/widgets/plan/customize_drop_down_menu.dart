import 'package:flutter/material.dart';

class CustomizeDropDownMenu extends StatefulWidget {
  final String label;
  final Widget dropDown;
  const CustomizeDropDownMenu({super.key, required this.label, required this.dropDown});

  @override
  State<CustomizeDropDownMenu> createState() => _CustomizeDropDownMenuState();
}

class _CustomizeDropDownMenuState extends State<CustomizeDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Add elevation to the card
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 16),
        child: Row(
          children: [
            Text(
              widget.label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: widget.dropDown,
            ),
          ],
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';

// /// Flutter code sample for [DropdownButton].

// const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

// void main() => runApp(const DropdownButtonApp());

// class DropdownButtonApp extends StatelessWidget {
//   const DropdownButtonApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('DropdownButton Sample')),
//         body: const Center(
//           child: DropdownButtonExample(),
//         ),
//       ),
//     );
//   }
// }

// class DropdownButtonExample extends StatefulWidget {
//   const DropdownButtonExample({super.key});

//   @override
//   State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
// }

// class _DropdownButtonExampleState extends State<DropdownButtonExample> {
//   String dropdownValue = list.first;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.deepPurple),
//       underline: Container(
//         height: 2,
//         color: Colors.deepPurpleAccent,
//       ),
//       onChanged: (String? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: list.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }
