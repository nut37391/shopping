import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shopping/model/datalist_m.dart';
import 'package:shopping/screen/add_shoping.dart';
import 'package:shopping/screen/order_list.dart';
import 'package:shopping/screen/orderstoreprovider.dart';

class mainShop extends StatefulWidget {
  const mainShop({
    super.key,
  });

  @override
  State<mainShop> createState() => _mainShopState();
}

class _mainShopState extends State<mainShop> {
  var isLongPress = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print(Provider.of<OrderProvider>(context, listen: false).openHiveBox());
    });
  }

  String format(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute} ${ampm(dateTime)}';
  }

  ampm(DateTime dateTime) {
    if (dateTime.hour > 12) {
      return 'PM';
    } else {
      return 'AM';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (context, shopping, child) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 223, 226, 228),
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                elevation: 4,
                expandedHeight: 150,
                floating: false,
                pinned: true,
                snap: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  stretchModes: [
                    StretchMode.zoomBackground,
                  ],
                  titlePadding: EdgeInsets.only(left: 20, bottom: 20),
                  title: Text(
                    'My Shopping',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  background: Image.asset(
                    'lib/image/summer.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: shopping.shopping.length,
                      itemBuilder: (context, index) {
                        var shoppingItem = shopping.shopping[index];
                        var datetime = format(shoppingItem.datetime);
                        var indexitem = index;

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => orderList(
                                  indexitem: indexitem,
                                ),
                              ),
                            );
                          },
                          onLongPress: () {
                            if (isLongPress == false) {
                              setState(() {
                                isLongPress = true;
                              });
                            } else {
                              setState(() {
                                isLongPress = false;
                              });
                            }
                          },
                          child: Stack(
                            children: [
                              Card(
                                margin: EdgeInsets.only(
                                  left: 18,
                                  right: 18,
                                  bottom: 20,
                                ),
                                child: ListTile(
                                  title: (Text(
                                    '${shopping.shopping[index].name}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                  subtitle: Text('$datetime'),
                                  trailing: Container(
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color.fromARGB(
                                          255, 241, 245, 246),
                                    ),
                                    child: Text(
                                        //รับค่า total จาก orderlist มาแสดง
                                        shopping
                                            .totalprice(
                                              shopping.shopping[index].items,
                                            )
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                        )),
                                  ),
                                ),
                              ),
                              if (isLongPress == true)
                                Positioned(
                                  top: -10,
                                  right: -10,
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          shopping.deleteShoppingList(index);
                                        });
                                      },
                                      icon: Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                      )),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ]),
              ),
            ],
          ),
          floatingActionButton: SafeArea(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      FloatingActionButton(
                        onPressed: () async {
                          final res = await showModalBottomSheet(
                              context: context,
                              builder: (context) => addShopping());
                          if (res != null) {
                            setState(() {
                              shopping.addShoppingList(Datalist(
                                name: res,
                                items: [],
                                total: 0,
                                datetime: DateTime.now(),
                              ));
                            });
                          }
                        },
                        child: Icon(
                          Icons.add,
                        ),
                      ),
                      if (isLongPress == true)
                        Positioned(
                          child: FloatingActionButton(
                            backgroundColor:
                                const Color.fromARGB(255, 84, 196, 88),
                            onPressed: () {
                              setState(() {
                                isLongPress = false;
                              });
                            },
                            child: Icon(Icons.check_outlined,
                                color: Colors.white, size: 30),
                          ),
                          top: 0,
                          left: 0,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
