import 'package:flutter/widgets.dart';
import 'package:starwars_connection/application/persistent/hive_db.dart';
import 'package:starwars_connection/core/entity/user_entity.dart';

class MenuProvider extends ChangeNotifier {
  User? user;

  Future<void> fetchUser() async {
    user = await HiveDB.db.user;
    notify();
  }

  Future<void> switchOption(bool value) async {
    user!.hasConnection = value;
    await HiveDB.db.save(user!);
    notify();
  }

  void notify() {
    notifyListeners();
  }
}
