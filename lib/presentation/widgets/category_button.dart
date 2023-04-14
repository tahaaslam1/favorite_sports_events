import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

class CategoryButton extends StatelessWidget {
  final String categoryName;
  final String categoryIcon;
  final Function()? onTap;

  const CategoryButton({
    super.key,
    required this.categoryName,
    required this.categoryIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 41.0.h,
        decoration: BoxDecoration(
          color: kAppBarBackgroundColor,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(color: const Color(0xFFFFFFFF)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                categoryIcon,
                height: 20.h,
                width: 20.w,
              ),
              SizedBox(width: 14.0.w),
              Text(
                categoryName,
                style: TextStyle(
                  color: const Color(0xFFFFFFFF),
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
