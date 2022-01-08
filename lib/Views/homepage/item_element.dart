import 'package:flutter/material.dart';
import 'package:moneycontrol/Controller/app_data.dart';
import 'package:moneycontrol/Model/items.dart';
import 'package:moneycontrol/Views/homepage/main_page.dart';

class ItemElement extends StatefulWidget {
  const ItemElement({
    Key? key,
    required this.item,
    required this.deleteEvent
  }) : super(key: key);

  final Items item;
  final Function deleteEvent;
  @override
  State<ItemElement> createState() => _ItemElementState();
}

class _ItemElementState extends State<ItemElement> {


  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border(
                left: BorderSide(
                  color: Colors.black,
                  width: 3,
                )
            )
        ),
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Spacer(flex: 1),
            Container(
              width: 200,
              child: Text(widget.item.itemName)
            ),
            // SizedBox(width:40),
            Spacer(flex: 13),
            Text("Rs." + widget.item.cost.toString()),
            // SizedBox(width:50),
            Spacer(flex: 10),
            IconButton(
              hoverColor: Colors.white,
              onPressed: () {
                widget.deleteEvent();
                // Navigator.pop(context);  // pop current page
                // Navigator.of(context).pushReplacement(
                // MaterialPageRoute (
                //   builder: (BuildContext context) => const HomePage(),
                // ),
                // );
              },
              icon: Icon(
                Icons.delete,
              )
            ),
          ]
        ),
    );
  }
}
