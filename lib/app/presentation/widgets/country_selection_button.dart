import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants.dart';

class CountrySelectionButton extends StatelessWidget {
  final VoidCallback onTap;

  const CountrySelectionButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const List<String> list = <String>[
      'One',
      'Two',
      'Three',
      'Four',
      'One',
      'Two',
      'Three',
      'Four',
      'One',
      'Two',
      'Three',
      'Four',
      'One',
      'Two',
      'Three',
      'Four',
      'One',
      'Two',
      'Three',
      'Four',
      'One',
      'Two',
      'Three',
      'Four',
      'One',
      'Two',
      'Three',
      'Four',
      'One',
      'Two',
      'Three',
      'Four',
      'One',
      'Two',
      'Three',
      'Four',
      'One',
      'Two',
      'Three',
      'Four'
    ];
    return Container(
      height: 47.h,
      width: 304.w,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: DropdownButton(
        dropdownColor: const Color(0xFF1A1A1A),
        // style: TextStyle(fontSize: 16.sp, color: const Color(0xFF8C8C8C)),

        // focusColor: Color(0xFFF5F5F5),
        hint: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text('Select your Country', style: TextStyle(fontSize: 16.sp, color: const Color(0xFF8C8C8C))),
        ),
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: const TextStyle(color: Colors.white, fontSize: 16.0)),
          );
        }).toList(),
        onChanged: (value) {},
        icon: const Icon(Icons.chevron_right, size: 32.0, color: kYellowColor),
        isExpanded: true,
      ),
    );

    // return GestureDetector(
    //   onTap: onTap,
    //   child: Container(
    //     height: 47.h,
    //     width: 304.w,
    //     decoration: BoxDecoration(
    //       color: const Color(0xFFF5F5F5),
    //       borderRadius: BorderRadius.circular(4.r),
    //     ),
    //     child: Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 16.w),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [Text('Select your Country', style: TextStyle(fontSize: 16.sp, color: const Color(0xFF8C8C8C))), const Icon(Icons.chevron_right, size: 32.0, color: kYellowColor)],
    //       ),
    //     ),
    //   ),
    // );
  }
}
