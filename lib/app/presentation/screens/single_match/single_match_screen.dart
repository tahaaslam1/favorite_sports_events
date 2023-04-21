import 'package:favorite_sports_events/app/blocs/home/home_bloc.dart';
import 'package:favorite_sports_events/core/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants.dart';
import '../../../cubits/single_match/single_match_cubit.dart';
import '../../../models/event.dart';

class SingleMatchScreen extends StatefulWidget {
  final int eventId;

  const SingleMatchScreen({super.key, required this.eventId});

  @override
  State<SingleMatchScreen> createState() => _SingleMatchScreenState();
}

class _SingleMatchScreenState extends State<SingleMatchScreen> {
  late SingleMatchCubit _singleMatchCubit;

  @override
  void initState() {
    _singleMatchCubit = BlocProvider.of<SingleMatchCubit>(context);
    _singleMatchCubit.getSingleMatch(widget.eventId);
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
          title: const Text('Event', style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600)),
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
        body: BlocConsumer<SingleMatchCubit, SingleMatchState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            switch (state.status) {
              case SingleMatchStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case SingleMatchStatus.initial:
                return const Center(child: CircularProgressIndicator());

              case SingleMatchStatus.loaded:
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 17.0.h),
                      child: Text(DateFormat.Hm().format(state.event.eventStartTime), style: const TextStyle(color: kYellowColor, fontSize: 22.0, fontFamily: 'Open Sans', fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 38.h,
                          width: 120.w,
                          child: Text(
                            state.event.opp1,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white, fontSize: 14.0, fontFamily: 'Open Sans', fontWeight: FontWeight.w400),
                          ),
                        ),
                        const Text(
                          'vs',
                          style: TextStyle(color: Colors.white, fontSize: 18.0, fontFamily: 'Open Sans', fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 38.h,
                          width: 120.w,
                          child: Text(
                            state.event.opp2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white, fontSize: 14.0, fontFamily: 'Open Sans', fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 58.0.h),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<SingleMatchCubit>(context, listen: false).addEventToFav(state.event);
                      },
                      child: Icon(
                        Icons.star,
                        size: 42.h,
                        color: state.event.isFav ? const Color(0xFFFF9115) : const Color(0xFF7A7A7A),
                      ),
                    )
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
