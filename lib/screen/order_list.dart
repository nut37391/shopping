import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shopping/model/dataitem.dart';

import 'package:shopping/screen/orderstoreprovider.dart';
import 'package:shopping/screen/rename.dart';

class orderList extends StatefulWidget {
  final int indexitem;

  const orderList({super.key, required this.indexitem});

  @override
  State<orderList> createState() => _orderListState();
}

class _orderListState extends State<orderList> {
  void _handlePopupMenuSelection(int value) {
    if (value == 1) {
      editShoppingList();
    }
    if (value == 2) {
      _clearShoppingList();
    }
    if (value == 3) {
      _deleteShoppingList();
    } else if (value == 4) {
      _cancelShoppingList();
    }
  }

  void editShoppingList() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (
          context,
        ) =>
            Rename(
          indexitem: widget.indexitem,
        ),
      ),
    );
  }

  void _deleteShoppingList() {
    Provider.of<OrderProvider>(context, listen: false)
        .deleteShoppingList(widget.indexitem);
    Navigator.pop(context);
  }

  void _clearShoppingList() {
    Provider.of<OrderProvider>(context, listen: false)
        .clearShopping(widget.indexitem);
    Navigator.pop(context);
  }

  void _cancelShoppingList() {
    Navigator.pop(context);
  }

  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (context, shopping, child) {
        return Scaffold(
          backgroundColor: Colors.blueGrey[100],
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                      Text(shopping.shopping[widget.indexitem].name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      PopupMenuButton(
                        icon: Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: Text('Rename'),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: Text('Claer item'),
                          ),
                          PopupMenuItem(
                            value: 3,
                            child: Text('Delete this order'),
                          ),
                          PopupMenuItem(
                            value: 4,
                            child: Text('Cancel'),
                          ),
                        ],
                        onSelected: (value) {
                          _handlePopupMenuSelection(value);
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Text('Total'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          shopping
                              .totalprice(
                                  shopping.shopping[widget.indexitem].items)
                              .toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          )),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 170,
                        height: 40,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          'ITEM',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                            top: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Text('PRICE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                            top: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Text('QTY',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: shopping.shopping[widget.indexitem].items.length,
                    itemBuilder: (context, index) {
                      final item =
                          shopping.shopping[widget.indexitem].items[index];
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          setState(() {
                            shopping.clearsomeitem(
                                widget.indexitem, widget.indexitem);
                          });
                        },
                        background: Container(
                          color: Colors.red,
                          child: Icon(Icons.delete),
                        ),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 170,
                                height: 60,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    bottom: BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    left: BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        keyboardType: TextInputType.text,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        initialValue: item.item_name,
                                        onChanged: (value) {
                                          item.item_name = value;
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 60,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    bottom: BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        initialValue: item.price.toString(),
                                        onChanged: (value) {
                                          item.price = double.parse(value);
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 60,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    bottom: BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        initialValue: item.qty.toString(),
                                        onChanged: (value) {
                                          item.qty = int.parse(value);
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 15,
                                            child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  shopping
                                                      .shopping[
                                                          widget.indexitem]
                                                      .items[index]
                                                      .qty++;
                                                  shopping.CalculateTotal(
                                                      widget.indexitem);
                                                });
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                size: 15,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 15,
                                            child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  shopping
                                                      .shopping[
                                                          widget.indexitem]
                                                      .items[index]
                                                      .qty--;
                                                  shopping.CalculateTotal(
                                                      widget.indexitem);
                                                });
                                              },
                                              icon: Icon(
                                                Icons.remove,
                                                size: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonBar(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  shopping.addShoppingItem(
                                      Dataitem(
                                          item_name: 'item',
                                          price: 100,
                                          qty: 1),
                                      widget.indexitem);
                                });
                              },
                              child: Text('Add item')),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
