import 'package:shopping/model/dataitem.dart';

import '../screen/order_list.dart';

class ShoppingList {
  String name;
  List<Dataitem> items;
  double total;
  DateTime datetime;

  ShoppingList({
    required this.name,
    required this.items,
    required this.total,
    required this.datetime,
  });

  get totalprice {
    double total = 0;
    for (var i = 0; i < items.length; i++) {
      total += items[i].price * items[i].qty;
    }
    return total;
  }
}
