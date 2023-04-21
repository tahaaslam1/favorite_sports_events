import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants.dart';
import '../../cubits/settings/app_settings_cubit.dart';
import '../../models/country.dart';

class CountrySelectionButton extends StatelessWidget {
  final List<Country> countries;

  const CountrySelectionButton({
    super.key,
    required this.countries,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.h,
      width: 304.w,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(4.r),
      ),
      padding: EdgeInsets.only(left: 17.w, right: 17.w),
      child: DropdownButton(
        dropdownColor: Colors.white,
        // style: const TextStyle(color: Colors.black, fontSize: 16.0),
        value: BlocProvider.of<AppSettingsCubit>(context).state.selectedCountry == Country.empty ? null : BlocProvider.of<AppSettingsCubit>(context).state.selectedCountry,

        hint: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text('Select your Country', style: TextStyle(fontSize: 16, color: Color(0xFF8C8C8C))),
        ),
        items: countries.map<DropdownMenuItem<Country>>((Country country) {
          return DropdownMenuItem<Country>(
            value: country,
            child: Text(country.countryName, style: const TextStyle(color: Color(0xFF202020), fontSize: 16.0, fontWeight: FontWeight.w600)),
          );
        }).toList(),
        onChanged: (value) {
          BlocProvider.of<AppSettingsCubit>(context, listen: false).updateSelectedCountry(value);
        },
        icon: const Icon(Icons.chevron_right, size: 32.0, color: kYellowColor),
        isExpanded: true,
      ),
    );
  }
}
