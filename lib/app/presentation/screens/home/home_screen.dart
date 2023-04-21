import 'package:favorite_sports_events/app/cubits/settings/app_settings_cubit.dart';
import 'package:favorite_sports_events/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/app_navigator.dart';
import '../../../../core/logger.dart';
import '../../../blocs/home/home_bloc.dart';
import 'local_widgets/event_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc _homeBloc;
  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _homeBloc.add(FetchEventsList(
      selectedCategories: context.watch<AppSettingsCubit>().state.selectedCategories,
      selectedCountry: context.watch<AppSettingsCubit>().state.selectedCountry,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.homeStatus) {
          case HomeStatus.initial:
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
                      onTap: () {
                        //AppNavigator.push(Routes.settings);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 24.0.w),
                        child: Icon(Icons.settings, size: 28.h),
                      ),
                    ),
                  ],
                ),
                body: const Center(child: CircularProgressIndicator()),
              ),
            );
          case HomeStatus.loading:
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
                      onTap: () {
                        //  AppNavigator.push(Routes.settings);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 24.0.w),
                        child: Icon(Icons.settings, size: 28.h),
                      ),
                    ),
                  ],
                ),
                body: const Center(child: CircularProgressIndicator()),
              ),
            );
          case HomeStatus.loaded:
            if (state.events.isEmpty) {
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
                          onTap: () {
                            AppNavigator.push(Routes.settings);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 24.0.w),
                            child: Icon(Icons.settings, size: 28.h),
                          ),
                        ),
                      ],
                    ),
                    body: const Center(child: Text('No events to show right now', style: TextStyle(color: Colors.white))) //Center(child: CircularProgressIndicator()),
                    ),
              );
              //return const Center(child: Text('No events to show right now', style: TextStyle(color: Colors.white)));
            } else {
              return SafeArea(
                child: Scaffold(
                    backgroundColor: kAppBarBackgroundColor,
                    appBar: AppBar(
                      toolbarHeight: 81.h,
                      backgroundColor: kFloatingActionButtonActiveColor,
                      leading: GestureDetector(
                        onTap: () {
                          AppNavigator.push(Routes.calendar);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 24.0.w),
                          child: Icon(Icons.calendar_month, size: 28.h),
                        ),
                      ),
                      actions: [
                        GestureDetector(
                          onTap: () {
                            AppNavigator.push(Routes.settings);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 24.0.w),
                            child: Icon(Icons.settings, size: 28.h),
                          ),
                        ),
                      ],
                    ),
                    body: ListView.builder(
                      itemCount: state.events.length,
                      itemBuilder: (context, index) {
                        bool isSameDate = true;

                        final event = state.events[index];

                        if (index == 0) {
                          isSameDate = false;
                        } else {
                          final previousEvent = state.events[index - 1];
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
                                    DateFormat('d MMMM y').format(state.events[index].eventStartTime),
                                    style: const TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  AppNavigator.push(Routes.singleMatch, event.eventId);
                                },
                                child: AbsorbPointer(
                                  absorbing: true,
                                  child: EventTile(
                                    category: event.eventCategory,
                                    eventStartTime: event.eventStartTime,
                                    opp1: event.opp1,
                                    opp2: event.opp2,
                                  ),
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
                                  AppNavigator.push(Routes.singleMatch, event.eventId);
                                },
                                child: AbsorbPointer(
                                  absorbing: true,
                                  child: EventTile(
                                    category: event.eventCategory,
                                    eventStartTime: event.eventStartTime,
                                    opp1: event.opp1,
                                    opp2: event.opp2,
                                  ),
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
                    ) // const Center(child: Text('No events to show right now', style: TextStyle(color: Colors.white))) //Center(child: CircularProgressIndicator()),
                    ),
              );
              //  return
            }

          case HomeStatus.error:
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
                        onTap: () {
                          AppNavigator.push(Routes.settings);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 24.0.w),
                          child: Icon(Icons.settings, size: 28.h),
                        ),
                      ),
                    ],
                  ),
                  body: const Center(
                    child: Text('Something went wrong', style: TextStyle(color: Colors.white)),
                  ) //const Center(child: Text('No events to show right now', style: TextStyle(color: Colors.white))) //Center(child: CircularProgressIndicator()),
                  ),
            );
        }
      },
    );
    //   ),
    // );
  }
}
