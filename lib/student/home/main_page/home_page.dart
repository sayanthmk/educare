import 'package:flutter/material.dart';
import 'package:projectedu/student/home/carousel/carousel.dart';
import 'package:projectedu/student/home/corepage/cwhivebox.dart';
import 'package:projectedu/student/home/customappbar/customappbar.dart';
import 'package:projectedu/student/home/drawer/drawer.dart';

class UserFireHomeMain extends StatefulWidget {
  const UserFireHomeMain({super.key});

  @override
  State<UserFireHomeMain> createState() => _UserFireHomeMainState();
}

class _UserFireHomeMainState extends State<UserFireHomeMain> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: customAppBar(
        onIconButtonPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
      backgroundColor: Colors.white,
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //appbar
              SizedBox(
                height: 25,
              ),
              CustomCarousel(),
              SizedBox(
                height: 25,
              ),
              //card hivesection start
              CustomHiveBox(),
              //card hivesection end
              SizedBox(
                height: 25,
              ),
              //search bar start
              // {SearchPad(),}
              //search bar end
              SizedBox(
                height: 25,
              ),

              SizedBox(
                height: 25,
              ),
              //horizontal list view
              // SmallSizedBox(),
              SizedBox(
                height: 25,
              ),
              //doctor list
              SizedBox(
                height: 25,
              ),
              //bigbox satrt
              // {BigBoxWidget(),}
              // bigbox end
            ],
          ),
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
