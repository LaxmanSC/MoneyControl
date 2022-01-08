import 'package:flutter/material.dart';
import 'package:moneycontrol/Views/additempage/add_item.dart';
import 'package:moneycontrol/Views/homepage/main_page.dart';

class AddItemFAB extends StatelessWidget {
  const AddItemFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute (
              builder: (BuildContext context) => const AddItem(),
            ),
        );
      },
      backgroundColor: Colors.black,
      child: const Icon (
        Icons.add,
        color: Colors.white,
      )
    );
  }
}
