import 'package:favorite_sports_events/app/presentation/widgets/category_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: kAppBarBackgroundColor,
                shape: const StadiumBorder(side: BorderSide(color: kFloatingActionButtonActiveColor, width: 3.0)),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: kFloatingActionButtonActiveColor,
                ),
              ),
              SizedBox(width: 16.0.w),
              SizedBox(
                width: 130.w,
                child: FloatingActionButton.extended(
                  label: Text(
                    'START',
                    style: TextStyle(
                      fontSize: 17.0.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () {},
                  backgroundColor: kFloatingActionButtonActiveColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: kAppBarBackgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Favorite Categories',
                style: TextStyle(
                  fontSize: 22.0.sp,
                  color: const Color(0xFFFFFFFF),
                ),
              ),
              SizedBox(height: 48.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryButton(
                    categoryIcon: 'assets/images/football.png',
                    categoryName: 'Football',
                    onTap: () {},
                  ),
                  SizedBox(width: 16.0.w),
                  CategoryButton(
                    categoryIcon: 'assets/images/Basketball.png',
                    categoryName: 'Basketball',
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 18.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryButton(
                    categoryIcon: 'assets/images/Tennis.png',
                    categoryName: 'Tennis',
                    onTap: () {},
                  ),
                  SizedBox(width: 16.0.w),
                  CategoryButton(
                    categoryIcon: 'assets/images/IceHockey.png',
                    categoryName: 'Hockey',
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 18.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryButton(
                    categoryIcon: 'assets/images/Cybersport.png',
                    categoryName: 'Cybersport',
                    onTap: () {},
                  ),
                  SizedBox(width: 16.0.w),
                  CategoryButton(
                    categoryIcon: 'assets/images/Rugby.png',
                    categoryName: 'Rugby',
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 18.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryButton(
                    categoryIcon: 'assets/images/Volleyball.png',
                    categoryName: 'Volleyball',
                    onTap: () {},
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
