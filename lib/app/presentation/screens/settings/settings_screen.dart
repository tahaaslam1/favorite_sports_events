import 'package:favorite_sports_events/app/cubits/settings/app_settings_cubit.dart';
import 'package:favorite_sports_events/app/presentation/widgets/country_selection_button.dart';
import 'package:favorite_sports_events/core/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants.dart';
import '../../../../core/logger.dart';
import '../../../models/category.dart';
import '../../widgets/category_button.dart';
import '../home/local_widgets/event_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    BlocProvider.of<AppSettingsCubit>(context, listen: false).getFavEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kAppBarBackgroundColor,
        appBar: AppBar(
          toolbarHeight: 81.h,
          backgroundColor: kFloatingActionButtonActiveColor,
          title: const Text('Settings', style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600)),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              AppNavigator.pop();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 24.0.w),
              child: Icon(Icons.arrow_circle_left_outlined, size: 28.h),
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 17.h,
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                AppNavigator.pop();
                AppNavigator.pop();
                AppNavigator.replaceWith(Routes.location);
              },
              child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
                builder: (context, state) {
                  switch (state.countryStatus) {
                    case CountryStatus.initial:
                      return const Center(child: CircularProgressIndicator());
                    // case CountryStatus.initial:
                    //   return const Center(child: CircularProgressIndicator());
                    case CountryStatus.loaded:
                      return AbsorbPointer(
                        absorbing: true,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Your Country:',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: kPrimaryTextColor,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            CountrySelectionButton(
                              countries: state.countries,
                            ),
                          ],
                        ),
                      );
                    case CountryStatus.error:
                      return const Center(child: Text('Error'));
                  }
                },
              ),
            ),
            SizedBox(height: 27.h),
            GestureDetector(
              onTap: () {
                AppNavigator.pop();

                AppNavigator.replaceWith(Routes.category);
              },
              child: AbsorbPointer(
                absorbing: true,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Your Sports:',
                          style: TextStyle(
                            fontSize: 17,
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
                            CategoryButton(
                              onTap: () {},
                              category: const Category(categoryId: 1, categoryName: 'Football', categoryIcon: 'assets/images/football.png'),
                            ),
                            SizedBox(width: 16.0.w),
                            CategoryButton(
                              onTap: () {},
                              category: const Category(categoryIcon: 'assets/images/Basketball.png', categoryId: 3, categoryName: 'Basketball'),
                            ),
                            SizedBox(width: 16.0.w),
                            CategoryButton(
                              onTap: () {},
                              category: const Category(categoryId: 4, categoryName: 'Tennis', categoryIcon: 'assets/images/Tennis.png'),
                            ),
                            SizedBox(width: 16.0.w),
                            CategoryButton(
                              onTap: () {},
                              category: const Category(categoryId: 2, categoryName: 'Hokey', categoryIcon: 'assets/images/IceHockey.png'),
                            ),
                            SizedBox(width: 16.0.w),
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
                  ],
                ),
              ),
            ),
            SizedBox(height: 22.h),
            Container(height: 45.h, width: MediaQuery.of(context).size.width, color: const Color(0xFF212121), child: const Center(child: Text('Favorite events', style: TextStyle(color: kYellowColor, fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w500)))),

            BlocBuilder<AppSettingsCubit, AppSettingsState>(
              builder: (context, state) {
                logger.d(state.favoriteEvents);
                if (state.favoriteEvents.isEmpty) {
                  return SizedBox(height: 50.h, child: const Center(child: Text('No events to show right now', style: TextStyle(color: Colors.white))));
                } else {
                  return Expanded(
                    child: ListView.builder(
                      // shrinkWrap: true,
                      itemCount: state.favoriteEvents.length,
                      itemBuilder: (context, index) {
                        bool isSameDate = true;

                        final event = state.favoriteEvents[index];

                        if (index == 0) {
                          isSameDate = false;
                        } else {
                          final previousEvent = state.favoriteEvents[index - 1];
                          isSameDate = event.eventStartTime.day == previousEvent.eventStartTime.day;
                        }

                        if (index == 0 || !(isSameDate)) {
                          return Column(
                            children: [
                              Container(
                                color: const Color(0xFF525252),
                                height: 44.h,
                                child: Center(
                                  child: Text(
                                    DateFormat('d MMMM y').format(state.favoriteEvents[index].eventStartTime),
                                    style: const TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  AppNavigator.push(Routes.singleMatch, event.eventId);
                                },
                                child: EventTile(
                                  category: event.eventCategory,
                                  eventStartTime: event.eventStartTime,
                                  opp1: event.opp1,
                                  opp2: event.opp2,
                                ),
                              ),
                              Divider(
                                color: const Color(0xFF4A4A4A),
                                thickness: 1.0.h,
                                height: 1.0.h,
                              )
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //AppNavigator.push(Routes.singleMatch, event.eventId);
                                },
                                child: EventTile(
                                  category: event.eventCategory,
                                  eventStartTime: event.eventStartTime,
                                  opp1: event.opp1,
                                  opp2: event.opp2,
                                ),
                              ),
                              Divider(
                                color: const Color(0xFF4A4A4A),
                                thickness: 1.0.h,
                                height: 1.0.h,
                              )
                            ],
                          );
                        }
                      },
                    ),
                  );
                }
              },
            )
            // ListView(
            //   shrinkWrap: true,
            //   children: [
            //     Container(
            //       color: const Color(0xFF525252),
            //       height: 44.h,
            //       child: const Center(child: Text('05 March 2023', style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600))),
            //     ),
            //     SizedBox(
            //       height: 90.h,
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Padding(
            //             padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w, top: 13.0.h),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 const Text(
            //                   '12:00',
            //                   style: TextStyle(color: kYellowColor, fontSize: 12.0, fontWeight: FontWeight.w400),
            //                 ),
            //                 Image.asset('assets/images/football.png', height: 16.h, width: 16.w),
            //               ],
            //             ),
            //           ),
            //           SizedBox(height: 6.0.h),
            //           Padding(padding: EdgeInsets.symmetric(horizontal: 16.0.w), child: const Text('Team 1 name', style: TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w400))),
            //           SizedBox(height: 6.0.h),
            //           Padding(padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w, bottom: 13.0.h), child: const Text('Team 2 name', style: TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w400))),
            //         ],
            //       ),
            //     ),
            //     Divider(
            //       color: const Color(0xFF4A4A4A),
            //       thickness: 1.0.h,
            //       height: 1.0.h,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
