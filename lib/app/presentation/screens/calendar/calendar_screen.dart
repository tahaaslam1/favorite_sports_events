import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/constants.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

DateTime _selectedDay = DateTime.utc(2023, 4, 12);

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kAppBarBackgroundColor,
        appBar: AppBar(
          toolbarHeight: 81.h,
          backgroundColor: kFloatingActionButtonActiveColor,
          title: Text('Calendar', style: TextStyle(color: Colors.white, fontSize: 18.0.sp, fontWeight: FontWeight.w600)),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(left: 24.0.w),
              child: Icon(Icons.arrow_circle_left_outlined, size: 28.h),
            ),
          ),
        ),
        body: TableCalendar(
          focusedDay: _selectedDay,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          // selectedDayPredicate: ,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
            });
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
            titleTextStyle: TextStyle(
              fontSize: 16.sp,
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
