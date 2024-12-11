import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventActions {
  static void deleteEvent(BuildContext context, String eventId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Event'),
          content: const Text('Are you sure you want to delete this event?'),
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
                    .delete();
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  static void editEvent(
      BuildContext context, String eventId, String currentDescription) {
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
}
