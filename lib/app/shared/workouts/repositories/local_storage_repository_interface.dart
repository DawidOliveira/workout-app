abstract class ILocalStorageRepository {
  Future saveData(String key, dynamic data);
  Future deleteData(String key, String id);
  Future getData(String key);
}
