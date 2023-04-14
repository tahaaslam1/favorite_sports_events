import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants.dart';

class SingleMatchScreen extends StatelessWidget {
  const SingleMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kAppBarBackgroundColor,
        appBar: AppBar(
          toolbarHeight: 81.h,
          backgroundColor: kFloatingActionButtonActiveColor,
          title: Text('Event', style: TextStyle(color: Colors.white, fontSize: 18.0.sp, fontWeight: FontWeight.w600)),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(left: 24.0.w),
              child: Icon(Icons.arrow_circle_left_outlined, size: 28.h),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 17.0.h),
              child: Text('12:00', style: TextStyle(color: kYellowColor, fontSize: 22.0.sp, fontFamily: 'Open Sans', fontWeight: FontWeight.w600)),
            ),
            SizedBox(
              height: 36.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 38.h,
                  width: 120.w,
                  child: Text(
                    'ut dignissim minim',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 14.0.sp, fontFamily: 'Open Sans', fontWeight: FontWeight.w400),
                  ),
                ),
                Text(
                  'vs',
                  style: TextStyle(color: Colors.white, fontSize: 18.0.sp, fontFamily: 'Open Sans', fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 38.h,
                  width: 120.w,
                  child: Text(
                    'iusto ullamcorper dolor',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 14.0.sp, fontFamily: 'Open Sans', fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(height: 58.0.h),
            Icon(
              Icons.star,
              size: 42.h,
              color: const Color(0xFF7A7A7A),
            )
          ],
        ),
      ),
    );
  }
}
