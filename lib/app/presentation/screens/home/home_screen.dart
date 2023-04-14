import 'package:favorite_sports_events/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kAppBarBackgroundColor,
        appBar: AppBar(
          toolbarHeight: 81.h,
          backgroundColor: kFloatingActionButtonActiveColor,
          leading: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(left: 24.0.w),
              child: Icon(Icons.calendar_month, size: 28.h),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(right: 24.0.w),
                child: Icon(Icons.settings, size: 28.h),
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            Container(
              color: const Color(0xFF525252),
              height: 44.h,
              child: Center(child: Text('05 March 2023', style: TextStyle(color: Colors.white, fontSize: 16.0.sp, fontWeight: FontWeight.w600))),
            ),
            SizedBox(
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
                          '12:00',
                          style: TextStyle(color: kYellowColor, fontSize: 12.0.sp, fontWeight: FontWeight.w400),
                        ),
                        Image.asset('assets/images/football.png', height: 16.h, width: 16.w),
                      ],
                    ),
                  ),
                  SizedBox(height: 6.0.h),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 16.0.w), child: Text('Team 1 name', style: TextStyle(color: Colors.white, fontSize: 14.0.sp, fontWeight: FontWeight.w400))),
                  SizedBox(height: 6.0.h),
                  Padding(padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w, bottom: 13.0.h), child: Text('Team 2 name', style: TextStyle(color: Colors.white, fontSize: 14.0.sp, fontWeight: FontWeight.w400))),
                ],
              ),
            ),
            Divider(
              color: const Color(0xFF4A4A4A),
              thickness: 1.0.h,
              height: 1.0.h,
            )
          ],
        ),
      ),
    );
  }
}
