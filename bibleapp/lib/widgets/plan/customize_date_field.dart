import 'package:flutter/material.dart';

class CustomizeDateField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String label;
  const CustomizeDateField({super.key, required this.textEditingController, required this.label});

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
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 12), // Add some spacing between text and TextField
            Expanded(
              child: TextField(
                enabled: false,
                controller: textEditingController,
                decoration: const InputDecoration(
                  filled: true, // Set filled to true
                  fillColor: Color(0xFFFAFAFA),
                  hintText: "date",
                  hintStyle:  TextStyle(
                    color: Colors.grey,
                  ),
                  border:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.date_range,
                color: Color(0xFF3498DB),
              ),
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2024),
                ).then((value) => {
                      textEditingController.text =
                          value.toString().substring(0, 10)
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('Custom TextField Example'),
//       ),
//       body: Center(
//         child: CustomTextField(
//           labelText: 'Username',
//         ),
//       ),
//     ),
//   ));
// }

// class CustomTextField extends StatelessWidget {
//   final String labelText;

//   CustomTextField({required this.labelText});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4, // Add elevation to the card
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       child: Container(
//         padding: const EdgeInsets.all(8),
//         child: Row(
//           children: <Widget>[
//             Text(
//               labelText,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(width: 8), // Add some spacing between text and TextField
//             Expanded(
//               child: TextField(
//                 decoration: InputDecoration(
//                   border: InputBorder.none, // Remove TextField border
//                   hintText: 'Enter $labelText',
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

