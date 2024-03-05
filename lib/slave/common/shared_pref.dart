import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  //SINGLETON CREATION
  SharedPref._internal();
  static SharedPref instance = SharedPref._internal();
  factory SharedPref() {
    return instance;
  }

  dynamic sharedInstance;

  //setting shared pref instance globally
  Future<void> saveInstance() async {
    sharedInstance = await SharedPreferences.getInstance();
  }
}
