import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

class CountrySelectionButton extends StatelessWidget {
  const CountrySelectionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.h,
      width: 304.w,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Select your Country', style: TextStyle(fontSize: 16.sp, color: const Color(0xFF8C8C8C))),
            const Icon(
              Icons.chevron_right,
              size: 32.0,
              color: kYellowColor,
              // weight: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
