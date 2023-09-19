import 'package:flutter/material.dart';

class addShopping extends StatefulWidget {
  const addShopping({super.key, addShoppingList});

  @override
  State<addShopping> createState() => _addShoppingState();
}

TextEditingController taskController = TextEditingController();

class _addShoppingState extends State<addShopping> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: 280,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              'New Order',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: taskController,
              decoration: InputDecoration(
                labelText: 'Order Name',
                hintText: 'Enter your order',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 10),
            child: ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      DateTime.now();
                      Navigator.pop(
                        context,
                        taskController.text,
                      );
                      taskController.clear();
                    },
                    child: Text('Confirm'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
