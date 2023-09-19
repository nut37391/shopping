import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/screen/orderstoreprovider.dart';

class Rename extends StatefulWidget {
  final int indexitem;
  const Rename({
    super.key,
    required int this.indexitem,
  });

  @override
  State<Rename> createState() => _RenameState();
}

class _RenameState extends State<Rename> {
  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (context, shopping, child) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 223, 226, 228),
          body: SafeArea(
              child: Column(
            children: [
              Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            'Rename',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          TextField(
                            controller: taskController,
                            decoration: InputDecoration(
                              focusColor: Colors.white,
                              fillColor: Colors.white,
                              filled: true,
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              hintText:
                                  shopping.shopping[widget.indexitem].name,
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(150, 40)),
                            onPressed: () {
                              setState(() {
                                shopping.reName(
                                    taskController.text, widget.indexitem);
                              });

                              Navigator.pop(context);
                            },
                            child: Text('Enter'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        );
      },
    );
  }
}
