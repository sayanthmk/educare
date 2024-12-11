import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:projectedu/student/hive/hive.dart';
import 'package:shimmer/shimmer.dart';

class CustomHiveBox extends StatefulWidget {
  const CustomHiveBox({
    super.key,
  });

  @override
  State<CustomHiveBox> createState() => CustomHiveBoxState();
}

class CustomHiveBoxState extends State<CustomHiveBox> {
  String? imageUrl;

  @override
  void initState() {
    super.initState();
    _loadImageFromFirebase();
  }

  Future<void> _loadImageFromFirebase() async {
    try {
      final ref = FirebaseStorage.instance
          .refFromURL('gs://hoist-126af.appspot.com/abc-block.png');
      final url = await ref.getDownloadURL();

      setState(() {
        imageUrl = url;
      });
    } catch (e) {
      Text('$e');
    }
  }

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
            SizedBox(
              height: 100,
              width: 100,
              // child: Image.asset('images/task.png'),
              child: imageUrl == null
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )
                  : SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(imageUrl!),
                    ),
            ),
            const SizedBox(
              width: 20,
            ),
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
