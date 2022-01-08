import 'package:flutter/material.dart';
import 'package:moneycontrol/Controller/app_data.dart';
import 'package:moneycontrol/Views/homepage/fab_element.dart';
import 'package:moneycontrol/Views/homepage/item_element.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MoneyControl"),
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 100),
          child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Spacer(flex: 1),
                      Text("Item",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Spacer(flex: 13),
                      Text("Cost",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),),
                      Spacer(flex: 8),
                    ]
                  )
                ),
                SizedBox(height: 20),
                Expanded(
                    child: ListView.builder(
                      itemBuilder:(context, index) {
                        return ItemElement(
                            item: AppData.getItems()[index],
                            deleteEvent: () {
                              setState(() {
                                AppData.deleteItem(index);
                              });
                            },
                        );
                      },
                      itemCount: AppData.getItems().length,
                    )
                ),
                Row(
                  children:[
                    Spacer(),
                    Text('Total Cost: Rs. ' + (AppData.calTotalCost().toString()),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    ),
                    Spacer()
                  ]
                )

              ]
          )
      ),
      floatingActionButton: AddItemFAB(),
    );
  }
}




