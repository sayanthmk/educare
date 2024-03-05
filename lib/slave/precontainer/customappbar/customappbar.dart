import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectedu/slave/common/shared_pref.dart';

AppBar customAppBar({VoidCallback? onIconButtonPressed}) {
  return AppBar(
    backgroundColor: Colors.deepPurple,
    centerTitle: true,
    title: const Text(
      'Educare',
      style: TextStyle(fontSize: 17, color: Colors.white, letterSpacing: 0.53),
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
    leading: InkWell(
      onTap: onIconButtonPressed,
      child: const Icon(
        Icons.subject,
        color: Colors.white,
      ),
    ),
    actions: [
      InkWell(
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.notifications,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    ],
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(110.0),
        child: Container(
          padding: const EdgeInsets.only(left: 30, bottom: 20),
          child: Row(
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person_outline_rounded),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.deepPurple,
                      size: 20,
                    ),
                  )
                ],
              ),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('asset')
                      .doc(SharedPref().sharedInstance.getString('userId'))
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const SizedBox();
                    } else {
                      return Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome ${snapshot.data!['name']}",
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            Text(
                              snapshot.data!['mail'],
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                            // Text(
                            //   snapshot.data!['gender'],
                            //   style: TextStyle(
                            //     fontSize: 13,
                            //     color: Colors.white,
                            //   ),
                            // ),
                          ],
                        ),
                      );
                    }
                  })
            ],
          ),
        )),
  );
}
