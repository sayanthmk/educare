import 'package:flutter/material.dart';
import 'package:projectedu/admin/admin_calender/admin_calender.dart';
import 'package:projectedu/admin/admin_homepage/cw_sel.dart';
import 'package:projectedu/admin/add_student/st_add/homeasset.dart';
import 'package:projectedu/admin/subject/section/sectionpage.dart';
import 'package:projectedu/starting_page/diversion/ch_routefile.dart';
import 'package:projectedu/starting_page/utilities/colors/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MasterDirectionPage extends StatelessWidget {
  const MasterDirectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorSelect.green,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: const Text('Log out'),
                        content: const Text('Are you sure wanted to signout'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              return signout(ctx);
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
                child: const Icon(Icons.logout)),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              SelectField(
                imagePath: 'picture/box1.png',
                tapping: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MasterAssetHome()));
                },
                fieldname: 'Add student',
              ),
              const SizedBox(
                height: 20,
              ),
              SelectField(
                imagePath: 'picture/box2.png',
                tapping: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SectionPage()));
                },
                fieldname: 'Add subject',
              ),
              const SizedBox(
                height: 20,
              ),
              SelectField(
                imagePath: 'picture/box3.png',
                tapping: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MasterAdminCalendar()));
                },
                fieldname: 'Calender',
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signout(BuildContext ctx) async {
    final sharedprefs = await SharedPreferences.getInstance();
    sharedprefs.clear();
    // ignore: use_build_context_synchronously
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx1) => const RoutePage(),
        ),
        (route) => false);
  }
}
