import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopping/model/dataitem.dart';
import 'package:shopping/model/datalist2.dart';
import 'package:shopping/model/datalist_m.dart';
import 'package:shopping/screen/main_shopping.dart';
import 'package:shopping/screen/orderstoreprovider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DatalistAdapter());
  Hive.registerAdapter(Datalist2Adapter());
  Hive.registerAdapter(DataitemAdapter());
  await Hive.openBox<Datalist2>('shoppingBox');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OrderProvider()),
      ],
      child: MyApp(),
    ),
  );
}

// crete a stateless widget
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: mainShop(),
    );
  }
}
