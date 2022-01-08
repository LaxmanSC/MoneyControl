
import 'package:flutter/material.dart';
import 'package:moneycontrol/Controller/app_data.dart';
import 'package:moneycontrol/Model/items.dart';
import 'package:moneycontrol/Views/homepage/main_page.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  String itemName = "";
  int cost = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute (
                  builder: (BuildContext context) => const HomePage(),
                ),
            );
          }
        )
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 100),
          child: Column(
            children: [
              SizedBox(height: 200),
              const Text('Add Item',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Item name'
                      ),
                      onChanged: (str){
                        setState(() {
                          itemName = str;
                        });
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: 'Cost (Rs.)'
                      ),
                      onChanged: (costing){
                        setState(() {
                          cost = int.parse(costing);
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            if( itemName!= "" && cost != 0) {
              AppData.addItem(Items(itemName: itemName, cost: cost, slNo: AppData.getItems().length));
              Navigator.of(context).pushReplacement(
                MaterialPageRoute (
                  builder: (BuildContext context) => const HomePage(),
                ),
              );
            }
            // print('Item added');
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.save,
            color: Colors.white,
          ),
        )
    );
  }
}
