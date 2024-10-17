import 'package:shared_preferences/shared_preferences.dart';

class ThemeCacheHelper{
  Future<void> cacheThemeIndex(int index) async{
    final preference = await SharedPreferences.getInstance();
    preference.setInt("THEME_MODE", index);
    
  }

  Future<int> getCachedIndex()async{
    final preference = await SharedPreferences.getInstance();
    final index = preference.getInt("THEME_MODE");

    if(index != null){
      return index;
    }else{
      return 0;
    }
  }
}