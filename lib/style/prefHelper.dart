import 'package:islami/models/sura_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class prefhelper {
  static late SharedPreferences prefs;
  static String key = "mostRecently";

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }
  static setSelectedSebha(int selected)async{
    await prefs.setInt('selected',selected );
  }
  static getSelectedsebha(){
   int selected=prefs.getInt("selected")??0;
   return selected;
  }
  static setCounterSebha(int counter)async{
    await prefs.setInt('counter',counter );
  }
  static getCountersebha(){
    final int counter=prefs.getInt('counter')??0;
    return counter;
  }

  static setIndexSebha(int index)async{
    await prefs.setInt('index',index );
  }

static getIndexsebha(){
    final int index=prefs.getInt('index')??0;
    return index;
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
