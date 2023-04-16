import 'package:flutter/material.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';
import 'package:flutter_timeline_calendar/timeline/flutter_timeline_calendar.dart';
import 'package:omous/data/models/schedules.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var data = Schedules();
  int indexx = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Schedule'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlutterDatePickerTimeline(
                itemHeight: 75,
                itemRadius: 10,
                unselectedItemWidth: 75,
                unselectedItemBackgroundColor:
                    Theme.of(context).primaryColorLight,
                unselectedItemMargin: EdgeInsets.symmetric(horizontal: 8),
                startDate: DateTime(2023, 04, 23),
                endDate: DateTime(2023, 04, 28),
                initialSelectedDate: DateTime(2023, 04, 23),
                onSelectedDateChange: (date) {
                  if (date!.day.toString() == '23') {
                    setState(() {
                      indexx = 0;
                    });
                  } else if (date!.day.toString() == '24') {
                    setState(() {
                      indexx = 1;
                    });
                  }
                },
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text(
                      data.schedules[indexx]['date'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.schedules[indexx]['activities'].length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ExpansionTile(
                        
                        title: Text(data.schedules[indexx]['activities'][index]
                                ['time']
                            .toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                        trailing: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text('Click to Expand')),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(data.schedules[indexx]['activities'][index]['text']
                                .toString()),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
