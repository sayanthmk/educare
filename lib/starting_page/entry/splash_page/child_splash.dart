import 'package:flutter/material.dart';
import 'package:projectedu/main.dart';
import 'package:projectedu/master/mastermainpage/master_main.dart';
import 'package:projectedu/slave/common/shared_pref.dart';
import 'package:projectedu/slave/precontainer/corepage/bottomnav.dart';
import 'package:projectedu/starting_page/entry/boarding_page/ch_main_boarding_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashFinal extends StatefulWidget {
  const SplashFinal({super.key});

  @override
  State<SplashFinal> createState() => _SplashFinalState();
}

class _SplashFinalState extends State<SplashFinal> {
  @override
  void initState() {
    super.initState();
    checkuserloggedin();
  }

  // void _navigatetohome() async {
  //   await Future.delayed(const Duration(milliseconds: 5500), () {});
  //   // ignore: use_build_context_synchronously
  //   Navigator.pushReplacement(context,
  //       MaterialPageRoute(builder: (context) => const EntryScreenMain()));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            height: 100,
            width: 100,
            child: Image.asset('images/social-media.gif')),
      ),
    );
  }

  Future<void> gotoroute() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const EntryScreenMain()));
  }

  Future<void> checkuserloggedin() async {
    final sharedprefuser = await SharedPreferences.getInstance();
    final userlogged = sharedprefuser.getBool(userKey);
    if (userlogged == null || userlogged == false) {
      checkadminloggedin();
    } else {
      await SharedPref().saveInstance();
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx1) => BottomNavItem()),
      );
    }
  }

  Future<void> checkadminloggedin() async {
    final sharedprefadmin = await SharedPreferences.getInstance();
    final logged = sharedprefadmin.getBool(adminKey);
    if (logged == null || logged == false) {
      gotoroute();
    } else {
      await SharedPref().saveInstance();
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx1) => const MasterDirectionPage()),
      );
    }
  }
}
