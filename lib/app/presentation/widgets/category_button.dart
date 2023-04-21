import 'package:favorite_sports_events/app/cubits/settings/app_settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants.dart';
import '../../models/category.dart';

class CategoryButton extends StatelessWidget {
  final Category category;
  final Function()? onTap;
  // final String categoryName;
  // final String categoryIcon;
  // final Function()? onTap;

  const CategoryButton({
    super.key,
    // required this.categoryName,
    // required this.categoryIcon,
    // required this.onTap,

    required this.category,
    required this.onTap,
  });

  final bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: //   widget.onTap,
          () {
        context.read<AppSettingsCubit>().updateSelectedCategories(category);
      },
      child: Container(
        height: 41.0.h,
        decoration: BoxDecoration(
          color: context.watch<AppSettingsCubit>().state.selectedCategories.contains(category) ? kYellowColor : kAppBarBackgroundColor, // isCategorySelected(widget.category) ? kYellowColor : kAppBarBackgroundColor,
          borderRadius: BorderRadius.circular(6.r),
          border: context.watch<AppSettingsCubit>().state.selectedCategories.contains(category) ? Border.all(color: Colors.transparent) : Border.all(color: const Color(0xFFFFFFFF)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                category.categoryIcon,
                height: 20.h,
                width: 20.w,
              ),
              SizedBox(width: 14.0.w),
              Text(
                category.categoryName,
                style: const TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 16.0,
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
