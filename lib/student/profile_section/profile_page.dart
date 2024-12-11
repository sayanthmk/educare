import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projectedu/student/common/shared_pref.dart';
import 'package:projectedu/student/profile_section/procustom.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  UserProfilePageState createState() => UserProfilePageState();
}

class UserProfilePageState extends State<UserProfilePage> {
  late Stream<DocumentSnapshot<Map<String, dynamic>>> userStream;

  @override
  void initState() {
    super.initState();
    final userId =
        (SharedPref().sharedInstance.getString('userId') ?? "").toString();
    userStream =
        FirebaseFirestore.instance.collection('asset').doc(userId).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Padding(
          padding: EdgeInsets.only(right: 50.0),
          child: Text(
            'Profile',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400),
          ),
        )),
        backgroundColor: Colors.deepPurple,
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('User not found.'));
          } else {
            Map<String, dynamic> userData = snapshot.data!.data()!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/image3.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: Text(
                          '${userData["name"]}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ByProSetWidget(
                      iconset: const Icon(Icons.person_2),
                      title: 'Name',
                      subtitle: '${userData["name"]}',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ByProSetWidget(
                      iconset: const Icon(Icons.mail),
                      title: 'Mail',
                      subtitle: ' ${userData["mail"]}',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ByProSetWidget(
                      iconset: const Icon(Icons.male),
                      title: 'Gender',
                      subtitle: '${userData["gender"]}',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ByProSetWidget(
                      iconset: const Icon(Icons.key),
                      title: 'Password',
                      subtitle: '${userData["password"]}',
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
