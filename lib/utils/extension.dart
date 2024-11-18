import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

extension SizedBoxExt on num {
  Widget get sH => SizedBox(
        height: toDouble().h,
      );
  Widget get sW => SizedBox(
        width: toDouble().w,
      );
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String getInitials() {
    // Split the input string by spaces
    List<String> nameParts = split(' ');

    // Check if the list of name parts is not empty
    if (nameParts.isNotEmpty) {
      // Check if the first name part is not empty before accessing the first character
      String firstNameInitial =
          nameParts[0].isNotEmpty ? nameParts[0][0].toUpperCase() : '';

      // Initialize the last name initial as an empty string
      String lastNameInitial = '';

      // If there's more than one part and the second part is not empty, take the first letter of the second part
      if (nameParts.length > 1 && nameParts[1].isNotEmpty) {
        lastNameInitial = nameParts[1][0].toUpperCase();
      }

      // Return the concatenated initials
      return '$firstNameInitial$lastNameInitial';
    } else {
      // Return an empty string if the input is empty or invalid
      return '';
    }
  }
}

extension Navigatorrr on Widget {
  void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => this),
    );
  }
}

// extension BottomSheetExt on Widget {
//   void showSheet(BuildContext context) => {
//         showModalBottomSheet(
//           useRootNavigator: true,
//           isScrollControlled: true,
//           backgroundColor: AppColors.vibeazyWhite,
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(25),
//               topRight: Radius.circular(25),
//             ),
//           ),
//           context: context,
//           builder: (context) => Padding(
//             padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 2.sH,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 3,
//                       width: 30,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(3),
//                         color: Colors.grey.shade400,
//                       ),
//                     ),
//                   ],
//                 ),
//                 2.sH,
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 6.w),
//                   child: this,
//                 )
//               ],
//             ),
//           ),
//         )
//       };
// }
