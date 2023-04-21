import 'package:favorite_sports_events/core/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/constants.dart';
import '../../../blocs/home/home_bloc.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime _selectedDay;
  late DateTime _firstDay;

  late DateTime _lastDay;

  @override
  initState() {
    super.initState();
    _selectedDay = context.read<HomeBloc>().state.events.first.eventStartTime;
    _lastDay = context.read<HomeBloc>().state.events.last.eventStartTime;

    _firstDay = context.read<HomeBloc>().state.firstDay!;

    // _selectedDay = _firstDay;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kAppBarBackgroundColor,
        appBar: AppBar(
          toolbarHeight: 81.h,
          backgroundColor: kFloatingActionButtonActiveColor,
          title: const Text('Calendar', style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600)),
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
        body: TableCalendar(
          focusedDay: _selectedDay,
          firstDay: _firstDay,
          lastDay: _lastDay,
          // selectedDayPredicate: ,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
            });

            context.read<HomeBloc>().add(FilterEventsByDate(dateSelected: selectedDay));
          },
          calendarStyle: const CalendarStyle(
            isTodayHighlighted: false,
            selectedDecoration: BoxDecoration(
              color: kYellowColor,
              shape: BoxShape.rectangle,
            ),
          ),
          daysOfWeekVisible: false,
          calendarFormat: CalendarFormat.month,
          headerStyle: HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
            leftChevronIcon: const Icon(Icons.chevron_left, size: 35, color: Colors.white),
            rightChevronIcon: const Icon(Icons.chevron_right, size: 35, color: Colors.white),
            leftChevronPadding: const EdgeInsets.all(0.0),
            rightChevronPadding: const EdgeInsets.all(0.0),
            headerMargin: EdgeInsets.only(bottom: 25.0.h),
            decoration: const BoxDecoration(
              color: kCalendarHeaderColor,
            ),
            titleTextStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Open Sans',
              fontStyle: FontStyle.normal,
              color: Colors.white,
            ),
          ),
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              return Container(
                margin: const EdgeInsets.all(4.0),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: kCalendarContainerColor,
                  // borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  '${day.day}',
                  style: const TextStyle(color: kCalendarTextColor),
                ),
              );
            },
            outsideBuilder: (context, day, focusedDay) {
              return Container(
                margin: const EdgeInsets.all(4.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kCalendarContainerColor.withOpacity(0.4),
                ),
                child: Text(
                  '${day.day}',
                  style: TextStyle(color: kCalendarTextColor.withOpacity(0.4)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
