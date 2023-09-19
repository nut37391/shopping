import 'package:flutter/material.dart';
import 'package:shopping/model/datalist2.dart';
import 'package:hive/hive.dart';
import '../model/datalist_m.dart';

class OrderProvider with ChangeNotifier {
  List<Datalist> shopping = [];

  final _shoppingBox = Hive.box<Datalist2>('shoppingBox');

  void reName(String name, int index) {
    shopping[index].name = name;
    saveShoppingList();
    notifyListeners();
  }

  void addDatalist(Datalist Datalist) {
    shopping.add(Datalist);
    notifyListeners();
  }

  void addShoppingList(Datalist Datalist) {
    shopping.add(Datalist);
    saveShoppingList();

    notifyListeners();
  }

  void addShoppingItem(item, index) {
    shopping[index].items.add(item);
    saveShoppingList();
    notifyListeners();
  }

  void clearShopping(index) {
    shopping[index].items.clear();
    saveShoppingList();
    notifyListeners();
  }

  void clearsomeitem(index, indexitem) {
    shopping[index].items.removeAt(indexitem);
    saveShoppingList();
    notifyListeners();
  }

  void deleteShoppingList(index) {
    shopping.removeAt(index);
    saveShoppingList();
    notifyListeners();
  }

  void nameShoppingList(index, name) {
    shopping[index].name = name;

    notifyListeners();
  }

  CalculateTotal(index) {
    double total = 0;
    for (var i = 0; i < shopping[index].items.length; i++) {
      total += shopping[index].items[i].price * shopping[index].items[i].qty;
    }
    shopping[index].total = total;
    saveShoppingList();

    notifyListeners();
  }

  totalprice(items) {
    double total = 0;
    for (var i = 0; i < items.length; i++) {
      total += items[i].price * items[i].qty;
    }
    return total;
  }

  openHiveBox() async {
    // await Hive.openBox<Datalist>('shoppingBox');
    var shopGet = _shoppingBox.get(
      'aaaaa',
    );
    shopping = shopGet?.items ?? [];
    notifyListeners();
  }

  saveShoppingList() async {
    await _shoppingBox.put('aaaaa', Datalist2(items: shopping));
  }
}
