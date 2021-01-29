import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_app/app/shared/workouts/repositories/local_storage_repository_interface.dart';

class LocalStorageRepository implements ILocalStorageRepository {
  SharedPreferences ps;

  Future initSharedPreference() async {
    ps = await SharedPreferences.getInstance();
  }

  @override
  Future<void> deleteData(String key, String id) async {
    await initSharedPreference();
    try {
      final List result = ps.get(key) == null ? null : json.decode(ps.get(key));
      if (result != null) {
        result.removeWhere((element) => element["id"] == id);
      }
      await ps.setString(key, json.encode(result));

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future getData(String key) async {
    await initSharedPreference();
    return ps.get(key) == null ? null : json.decode(ps.get(key));
  }

  @override
  Future<void> saveData(String key, data) async {
    List list = [];
    await initSharedPreference();
    try {
      final List result = ps.get(key) == null ? null : json.decode(ps.get(key));
      if (result != null) {
        result.forEach((element) {
          list.add(element);
        });
      }
      list.add(data);
      await ps.setString(key, json.encode(list));
      return true;
    } catch (e) {
      return false;
    }
  }
}
