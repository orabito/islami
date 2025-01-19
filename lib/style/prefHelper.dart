import 'package:islami/models/sura_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class prefhelper {
  static late SharedPreferences prefs;
  static String key = "mostRecently";

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static addRecentList(List<SuraModel> mostRecentList) {
    List<String> mostRecentlyString =
        mostRecentList.map((sura) => sura.suraNameEn).toList();
    prefs.setStringList(key, mostRecentlyString);
  }

  static List<SuraModel> getRecentList() {
 List<String>mostStringList=  prefs.getStringList(key)??[];
 List<SuraModel>mostRecent=[];
for (String suraName in mostStringList ){
SuraModel suraFound = suraList.firstWhere((sura)=>sura.suraNameEn==suraName );
mostRecent.add(suraFound);

}
return mostRecent;

  }
}
