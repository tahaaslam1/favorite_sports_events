import 'package:favorite_sports_events/app/cubits/settings/app_settings_cubit.dart';
import 'package:favorite_sports_events/app/presentation/widgets/category_button.dart';
import 'package:favorite_sports_events/core/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants.dart';
import '../../../models/category.dart';

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
                heroTag: "btn1",
                onPressed: () {
                  AppNavigator.pop();
                },
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
                  heroTag: "btn2",
                  label: Text(
                    'START',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w700,
                      color: context.watch<AppSettingsCubit>().state.selectedCategories.isEmpty ? const Color(0xFF838383) : Colors.white,
                    ),
                  ),
                  onPressed: context.watch<AppSettingsCubit>().state.selectedCategories.isEmpty
                      ? () {
                          return;
                        }
                      : () {
                          AppNavigator.push(Routes.home);
                        },
                  backgroundColor: context.watch<AppSettingsCubit>().state.selectedCategories.isEmpty ? const Color(0xFF512222) : kFloatingActionButtonActiveColor,
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
              const Text(
                'Favorite Categories',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              SizedBox(height: 48.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryButton(
                    onTap: () {},
                    category: const Category(categoryId: 1, categoryName: 'Football', categoryIcon: 'assets/images/football.png'),
                  ),
                  SizedBox(width: 16.0.w),
                  CategoryButton(
                    onTap: () {},
                    category: const Category(categoryIcon: 'assets/images/Basketball.png', categoryId: 3, categoryName: 'Basketball'),
                  ),
                ],
              ),
              SizedBox(height: 18.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryButton(
                    onTap: () {},
                    category: const Category(categoryId: 4, categoryName: 'Tennis', categoryIcon: 'assets/images/Tennis.png'),
                  ),
                  SizedBox(width: 16.0.w),
                  CategoryButton(
                    onTap: () {},
                    category: const Category(categoryId: 2, categoryName: 'Hokey', categoryIcon: 'assets/images/IceHockey.png'),
                  ),
                ],
              ),
              SizedBox(height: 18.0.h),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     const CategoryButton(
              //       category: Category(categoryId: 2, categoryName: 'Cybersport', categoryIcon: 'assets/images/Cybersport.png'),
              //     ),
              //     SizedBox(width: 16.0.w),
              //     const CategoryButton(
              //       category: Category(categoryId: 3, categoryName: 'Rugby', categoryIcon: 'assets/images/Rugby.png'),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 18.0.h),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: const [
              //     CategoryButton(
              //       category: Category(categoryId: 1, categoryName: 'Volleyball', categoryIcon: 'assets/images/Volleyball.png'),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
