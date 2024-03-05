import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projectedu/slave/common/shared_pref.dart';
import 'package:projectedu/slave/proset/procustom.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
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
                    // Card(
                    //   elevation: 5,
                    //   child: Container(
                    //     width: 350,
                    //     height: 70,
                    //     decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(10)),
                    //     child: Center(
                    //       child: ListTile(
                    //         leading: const Icon(Icons.person_2),
                    //         title: Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Text(
                    //             'Name: ${userData["name"]}',
                    //             style: const TextStyle(
                    //                 fontSize: 18, fontWeight: FontWeight.bold),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // Card(
                    //   elevation: 5,
                    //   child: Container(
                    //     width: 350,
                    //     height: 70,
                    //     decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(10)),
                    //     child: Center(
                    //       child: ListTile(
                    //         leading: const Icon(Icons.mail),
                    //         title: Padding(
                    //           padding: const EdgeInsets.all(4.0),
                    //           child: Text(
                    //             'E-mail: ${userData["mail"]}',
                    //             style: const TextStyle(
                    //                 fontSize: 16, fontWeight: FontWeight.bold),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // Card(
                    //   elevation: 5,
                    //   child: Container(
                    //     width: 350,
                    //     height: 70,
                    //     decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(10)),
                    //     child: Center(
                    //       child: ListTile(
                    //         leading: const Icon(Icons.male),
                    //         title: Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Text(
                    //             'Gender: ${userData["gender"]}',
                    //             style: const TextStyle(
                    //                 fontSize: 18, fontWeight: FontWeight.bold),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // Card(
                    //   elevation: 5,
                    //   child: Container(
                    //     width: 350,
                    //     height: 70,
                    //     decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(10)),
                    //     child: Center(
                    //       child: ListTile(
                    //         leading: const Icon(Icons.key),
                    //         title: Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Text(
                    //             'Password: ${userData["password"]}',
                    //             style: const TextStyle(
                    //                 fontSize: 18, fontWeight: FontWeight.bold),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Text('Name: ${userData["name"]}'),
                    // Text('Email: ${userData["mail"]}'),
                    // Text('Gender: ${userData["gender"]}'),
                    // Text('password: ${userData["password"]}'),
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
