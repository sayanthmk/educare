import 'package:flutter/material.dart';
import 'package:projectedu/slave/calender/custcal.dart';
import 'package:projectedu/starting_page/utilities/colors/colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SlaveCalendar extends StatefulWidget {
  const SlaveCalendar({Key? key}) : super(key: key);

  @override
  State<SlaveCalendar> createState() => _SlaveCalendarState();
}

class _SlaveCalendarState extends State<SlaveCalendar> {
  DateTime today = DateTime.now();
  List<DateTime> events = [];
  TextEditingController eventController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('calendar').get();

    setState(() {
      events = snapshot.docs
          .map((doc) => (doc['date'] as Timestamp).toDate())
          .toList();
    });
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'CALENDAR',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        backgroundColor: CalenderColor.calpurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(),
                  color: ColorSelect.white),
              width: 200,
              height: 50,
              child: Center(
                child: Text(
                  "Selected day = ${today.toString().split(" ")[0]}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            TableCalendar(
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
              ),
              selectedDayPredicate: (day) => isSameDay(day, today),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: today,
              onDaySelected: _onDaySelected,
            ),
            const SizedBox(height: 50),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('calendar')
                    .where('date', isEqualTo: Timestamp.fromDate(today))
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  final eventDocs = snapshot.data?.docs ?? [];

                  return ListView.builder(
                    itemCount: eventDocs.length,
                    itemBuilder: (context, index) {
                      final event =
                          eventDocs[index].data() as Map<String, dynamic>;
                      final eventDescription = event['description'] ?? '';

                      return ListTile(
                        title: CardCalender(eventDescription: eventDescription),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
