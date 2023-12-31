import 'package:flutter/material.dart';

class CustomizeTextField extends StatelessWidget {
  
  final String? title;
  final String? hintText;
  final TextEditingController textEditingController;

  const CustomizeTextField({super.key, required this.textEditingController, this.title, this.hintText});

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
              title != null ? title!: "title",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 8), // Add some spacing between text and TextField
            Expanded(
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  filled: true, // Set filled to true
                  fillColor: Color(0xFFFAFAFA),
                  border: InputBorder.none, // Remove TextField border
                  hintText: hintText != null ? hintText! : 'weekly devoation',
                ),
              ),
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

