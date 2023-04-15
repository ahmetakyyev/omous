import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/flutter_timeline_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Schedule'),
      ),
      body: TimelineCalendar(
        calendarType: CalendarType.GREGORIAN,
        calendarLanguage: "en",
        calendarOptions: CalendarOptions(
          viewType: ViewType.DAILY,
          headerMonthElevation: 10,
          headerMonthShadowColor: Colors.black26,
          headerMonthBackColor: Colors.transparent,
        ),
        dayOptions: DayOptions(
          compactMode: true,
          dayFontSize: 14.0,
          disableFadeEffect: true,
          weekDaySelectedColor: const Color(0xff3AC3E2),
        ),
        headerOptions: HeaderOptions(
          weekDayStringType: WeekDayStringTypes.SHORT,
          monthStringType: MonthStringTypes.FULL,
          headerTextSize: 14,
          headerTextColor: Colors.black,
        ),
        onChangeDateTime: (datetime) {
          if (datetime.day == 21) {
            print('Ine bu gun baslayar');
          } else {
            print(datetime.day);
            print('siuu');
          }
        },
      ),
    );
  }
}
