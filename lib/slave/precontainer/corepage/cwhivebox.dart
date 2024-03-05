import 'package:flutter/material.dart';
import 'package:projectedu/slave/hive/hive.dart';

class CustomHiveBox extends StatelessWidget {
  const CustomHiveBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(12),
            border: Border.all()),
        child: Row(
          children: [
            //animation picture
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset('images/task.png'),
            ),
            const SizedBox(
              width: 20,
            ),
            //how do you feel +get started button

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Reminder',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Check out what to do',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const HivePage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple[300],
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text(
                          'Get started',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
