import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constants.dart';
import '../../../../models/category.dart';

class EventTile extends StatelessWidget {
  final DateTime eventStartTime;
  final String opp1;
  final String opp2;
  final Category category;
  // final Function()? onTap;
  const EventTile({
    super.key,
    required this.eventStartTime,
    required this.opp1,
    required this.opp2,
    required this.category,
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w, top: 13.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat.Hm().format(eventStartTime),
                  style: const TextStyle(color: kYellowColor, fontSize: 12.0, fontWeight: FontWeight.w400),
                ),
                Image.asset(category.categoryIcon, height: 16.h, width: 16.w),
              ],
            ),
          ),
          SizedBox(height: 6.0.h),
          Padding(
            padding: EdgeInsets.only(left: 16.0.w),
            child: Text(
              opp1,
              style: const TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 6.0.h),
          Padding(
            padding: EdgeInsets.only(left: 16.0.w, bottom: 13.0.h),
            child: Text(
              opp2,
              style: const TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
