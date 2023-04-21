import 'package:favorite_sports_events/app/cubits/settings/app_settings_cubit.dart';
import 'package:favorite_sports_events/app/presentation/widgets/country_selection_button.dart';
import 'package:favorite_sports_events/core/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants.dart';
import '../../../models/country.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kAppBarBackgroundColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: context.watch<AppSettingsCubit>().state.selectedCountry == Country.empty ? const Color(0xFF512222) : kFloatingActionButtonActiveColor,
          onPressed: context.watch<AppSettingsCubit>().state.selectedCountry == Country.empty
              ? () {
                  return;
                }
              : () {
                  AppNavigator.push(Routes.category);
                },
          child: Icon(
            Icons.arrow_forward_ios,
            color: context.watch<AppSettingsCubit>().state.selectedCountry == Country.empty ? const Color(0xFF838383) : const Color(0xFFFFFFFF),
          ),
        ),
        body: Center(
          child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
            builder: (context, state) {
              if (state.countryStatus == CountryStatus.initial) {
                return const CircularProgressIndicator();
              } else if (state.countryStatus == CountryStatus.loaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Your Country:',
                      style: TextStyle(
                        fontSize: 17,
                        color: kPrimaryTextColor,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: 40.0.h),
                    CountrySelectionButton(
                      countries: state.countries,
                    )
                  ],
                );
              } else {
                return const Center(child: Text('Something went wrong', style: TextStyle(color: Colors.white)));
              }
            },
          ),
        ),
      ),
    );
  }
}
