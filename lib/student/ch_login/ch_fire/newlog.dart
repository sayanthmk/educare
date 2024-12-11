import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projectedu/main.dart';
import 'package:projectedu/student/ch_login/ch_fire/cwlog/cwlog.dart';
import 'package:projectedu/student/common/shared_pref.dart';
import 'package:projectedu/student/precontainer/corepage/bottomnav.dart';

class LoginScreenAsset extends StatefulWidget {
  const LoginScreenAsset({super.key});

  @override
  State<LoginScreenAsset> createState() => _LoginScreenAssetState();
}

class _LoginScreenAssetState extends State<LoginScreenAsset> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  Future<void> _login() async {
    CollectionReference assetCollection =
        FirebaseFirestore.instance.collection('asset');

    QuerySnapshot querySnapshot = await assetCollection
        .where('mail', isEqualTo: emailController.text)
        .where('password', isEqualTo: passwordController.text)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      String documentId = querySnapshot.docs.first.id;
      await SharedPref().saveInstance();
      await SharedPref().sharedInstance.setBool(userKey, true);
      await SharedPref().sharedInstance.setString('userId', documentId);
      log(SharedPref().sharedInstance.getString('userId').toString());

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomNavItem()));
    } else {
      _showLoginFailedDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[100],
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        title: const Center(
            child: Padding(
          padding: EdgeInsets.only(right: 40.0),
          child: Text(
            'Student Login',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FieldEmail(
                title: 'Email',
                controller: emailController,
                hintText: 'Enter email'),
            const SizedBox(
              height: 30,
            ),
            FieldPassword(
                title: 'Password',
                controller: passwordController,
                hintText: 'Enter password'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize:
                    WidgetStateProperty.all<Size>(const Size(250.0, 50.0)),
                backgroundColor: WidgetStateProperty.all<Color>(
                  Colors.purple.shade200,
                ),
              ),
              onPressed: _login,
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLoginFailedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Login Failed'),
        content: const Text('Invalid email or password.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
