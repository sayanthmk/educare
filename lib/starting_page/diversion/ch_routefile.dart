import 'package:flutter/material.dart';
import 'package:projectedu/admin/admin_login/masterlogpage.dart';
import 'package:projectedu/student/ch_login/ch_fire/newlog.dart';
import 'package:projectedu/starting_page/diversion/diversioncard.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DiversionCard(
                fieldtext: 'Student',
                profilephoto: 'picture/avatar4.png',
                onpressing: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const LoginScreenAsset();
                    }),
                  );
                }),
            const SizedBox(
              height: 30,
            ),
            DiversionCard(
                fieldtext: 'Teacher',
                profilephoto: 'picture/avatar3.png',
                onpressing: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const MasterLogMainPage();
                    }),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
