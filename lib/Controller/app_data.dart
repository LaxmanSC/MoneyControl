import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:moneycontrol/Model/items.dart';

class AppData {
  static List<Items> _itemList = [];
  static late SharedPreferences _sharedPreferences;
  static List<String> _jsonItemList = [];

  static Future<void> initEvent() async{
    _sharedPreferences = await SharedPreferences.getInstance();

    final _tempJsonItemList = _sharedPreferences.getStringList('itemList');

    if(_tempJsonItemList != null) {
      _jsonItemList = _tempJsonItemList;
      _itemList = _tempJsonItemList.map((e) => Items.fromJson(jsonDecode(e))).toList();
    }
  }

  static List<Items> getItems() {
    return _itemList;
  }

  static int calTotalCost() {
    int totalCost = 0;
    for (var element in _itemList) {
      totalCost = totalCost + element.cost;
    }
    return totalCost;
  }
  static Future<void> addItem(Items item) async {
  _itemList.add(item);
  _jsonItemList.add(jsonEncode(item));

  await _sharedPreferences.setStringList('itemList', _jsonItemList);
  }

  static Future<void> deleteItem(int index) async {
    _jsonItemList.removeAt(index);
    _itemList.removeAt(index);
    await _sharedPreferences.setStringList('itemList', _jsonItemList);

  }

}