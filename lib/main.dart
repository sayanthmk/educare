import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:projectedu/slave/timetable/model/model.dart';
import 'package:projectedu/starting_page/entry/splash_page/child_splash.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

const userKey = 'UserSetup';
const adminKey = 'AdminSetup';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  await Hive.openBox('shopping_box');
  if (!Hive.isAdapterRegistered(TimetableEntryAdapter().typeId)) {
    Hive.registerAdapter(TimetableEntryAdapter());
  }
  await Hive.openBox<TimetableEntry>('timetableBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      ),
      home: const SafeArea(
        child: Scaffold(
          body: SplashFinal(),
        ),
      ),
    );
  }
}
