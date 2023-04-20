import 'package:favorite_sports_events/app/presentation/widgets/category_button.dart';
import 'package:favorite_sports_events/app/presentation/widgets/country_selection_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kAppBarBackgroundColor,
        appBar: AppBar(
          toolbarHeight: 81.h,
          backgroundColor: kFloatingActionButtonActiveColor,
          title: Text('Settings', style: TextStyle(color: Colors.white, fontSize: 18.0.sp, fontWeight: FontWeight.w600)),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(left: 24.0.w),
              child: Icon(Icons.arrow_circle_left_outlined, size: 28.h),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 17.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your Country:',
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: kPrimaryTextColor,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              const CountrySelectionButton(
                countries: [],
              ),
              SizedBox(height: 27.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your Sports:',
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: kPrimaryTextColor,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13.h),
              Padding(
                padding: EdgeInsets.only(left: 17.0.w),
                child: SizedBox(
                  height: 50.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      // CategoryButton(categoryName: 'categoryName', categoryIcon: 'assets/images/football.png', onTap: () {}),
                      // SizedBox(width: 14.w),
                      // CategoryButton(categoryName: 'categoryName', categoryIcon: 'assets/images/football.png', onTap: () {}),
                      // CategoryButton(categoryName: 'categoryName', categoryIcon: 'assets/images/football.png', onTap: () {}),
                      // CategoryButton(categoryName: 'categoryName', categoryIcon: 'assets/images/football.png', onTap: () {}),
                      // CategoryButton(categoryName: 'categoryName', categoryIcon: 'assets/images/football.png', onTap: () {}),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 22.h),
              Container(height: 45.h, width: MediaQuery.of(context).size.width, color: const Color(0xFF212121), child: Center(child: Text('Favorite events', style: TextStyle(color: kYellowColor, fontFamily: 'Inter', fontSize: 16.sp, fontWeight: FontWeight.w500)))),
              ListView(
                shrinkWrap: true,
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
