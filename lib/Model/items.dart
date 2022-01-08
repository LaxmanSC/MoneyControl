// import 'package:moneycontrol/Controller/app_data.dart';

class Items {
  String itemName;
  int cost;
  int slNo;
  Items({required this.itemName, required this.cost, required this.slNo});

  factory Items.fromJson(Map<String, dynamic> data) => Items(itemName: data["itemName"], cost: data["cost"], slNo: data["slNo"]);
  Map<String,dynamic> toJson () => {
    'itemName': itemName,
    'cost': cost,
    'slNo': slNo,
  };


}