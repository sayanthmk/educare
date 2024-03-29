// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectedu/master/student/st_add/authentication.dart';
import 'package:projectedu/slave/common/shared_pref.dart';
import 'package:projectedu/slave/proset/proset.dart';
import 'package:projectedu/starting_page/diversion/ch_routefile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  final User? user = AuthenticationPage().currentUser;

  Future<void> signOut() async {
    await AuthenticationPage().signOut();
    final sharedprefuser = await SharedPreferences.getInstance();
    sharedprefuser.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      color: Colors.white,
      child: Column(
        children: [
          Column(
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('asset')
                    .doc(SharedPref().sharedInstance.getString('userId'))
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 116, 43, 218),
                      ),
                      alignment: Alignment.center,
                      height: 100,
                      child: ListTile(
                        title: Text(
                          snapshot.data!['name'],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        leading: const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('images/profile2.png'),
                        ),
                      ),
                    );
                  }
                },
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const UserProfilePage()));
                    },
                    child: const ListTile(
                      title: Text('Profile'),
                      leading: Icon(Icons.person),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (context) => const SlaveCalendar()));
                  //   },
                  //   child: const ListTile(
                  //     leading: Icon(Icons.calendar_today),
                  //     title: Text('Calender'),
                  //   ),
                  // ),
                  // const ListTile(
                  //   leading: Icon(Icons.help),
                  //   title: Text('Help'),
                  // ),
                  const ListTile(
                    leading: Icon(Icons.dialpad_rounded),
                    title: Text('Terms&Conditions'),
                  ),
                  // const ListTile(
                  //   leading: Icon(Icons.settings),
                  //   title: Text('Settings'),
                  // ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Log out'),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (ctx) {
                          return AlertDialog(
                            title: const Text('Log out'),
                            content:
                                const Text('Are you sure wanted to signout'),
                            actions: [
                              TextButton(
                                onPressed: () async {
                                  await signOut();
                                  Navigator.of(ctx).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (ctx) => const RoutePage()),
                                      (route) => false);
                                },
                                child: const Text('Yes'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: const Text('NO'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
