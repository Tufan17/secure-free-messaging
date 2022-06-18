import 'package:shared_preferences/shared_preferences.dart';


List texedBy=[];

class Info{
  SharedPreferences _sharedPreferences;

  createSharedPreferece() async {
    _sharedPreferences=await SharedPreferences.getInstance();
  }

  setSharedPreference(List info) async{
    await createSharedPreferece();
    await _sharedPreferences.setStringList("Info", info);
  }

  Future<List> getSharedPreference() async {
    await createSharedPreferece();
    texedBy=_sharedPreferences.get("Info")??false;

    return texedBy;
  }

}