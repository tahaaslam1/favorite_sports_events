import 'package:favorite_sports_events/app/presentation/widgets/country_selection_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kAppBarBackgroundColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: kFloatingActionButtonActiveColor,
          onPressed: () {},
          child: const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFFFFFFFF),
          ),
        ),
        body: Center(
          child: Column(
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
              SizedBox(height: 40.0.h),
              const CountrySelectionButton()
            ],
          ),
        ),
      ),
    );
  }
}
