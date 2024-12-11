import 'package:flutter/material.dart';
import 'package:projectedu/master/mascal/function.dart';
import 'package:projectedu/starting_page/utilities/colors/colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MasterAdminCalendar extends StatefulWidget {
  const MasterAdminCalendar({Key? key}) : super(key: key);

  @override
  State<MasterAdminCalendar> createState() => _MasterAdminCalendarState();
}

class _MasterAdminCalendarState extends State<MasterAdminCalendar> {
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

  void _addEvent() {
    final DateTime selectedDate = today;

    if (!events.contains(selectedDate)) {
      setState(() {
        events.add(selectedDate);
      });

      FirebaseFirestore.instance.collection('calendar').add({
        'date': Timestamp.fromDate(selectedDate),
        'description': eventController.text,
      });

      eventController.clear();
    }
  }

  void _editEvent(String eventId, String currentDescription) {
    showDialog(
      context: context,
      builder: (context) {
        String newDescription = currentDescription;
        return AlertDialog(
          title: const Text('Edit Event'),
          content: TextField(
            onChanged: (value) {
              newDescription = value;
            },
            controller: TextEditingController(text: currentDescription),
            decoration:
                const InputDecoration(hintText: 'Enter new description'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('calendar')
                    .doc(eventId)
                    .update({'description': newDescription});
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteEvent(String eventId) {
    EventActions.deleteEvent(context, eventId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'MASTER CALENDAR',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        backgroundColor: ColorSelect.cbuttons,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              decoration:
                  BoxDecoration(border: Border.all(), color: Colors.white),
              width: 180,
              height: 20,
              child: Center(
                  child:
                      Text("Selected day = ${today.toString().split(" ")[0]}")),
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
            const SizedBox(height: 20),
            TextField(
              controller: eventController,
              decoration: const InputDecoration(
                hintText: 'Event Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addEvent,
              child: const Text('Add Event'),
            ),
            const SizedBox(height: 20),
            StreamBuilder<QuerySnapshot>(
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
                return SizedBox(
                  height: 500,
                  child: ListView.builder(
                    itemCount: eventDocs.length,
                    itemBuilder: (context, index) {
                      final event =
                          eventDocs[index].data() as Map<String, dynamic>;
                      final eventId = eventDocs[index].id;
                      final eventDescription = event['description'] ?? '';
                      return ListTile(
                        title: Text(eventDescription),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _editEvent(eventId, eventDescription);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                _deleteEvent(eventId);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
