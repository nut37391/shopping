import 'package:hive/hive.dart';
import '../model/dataitem.dart';
import '../screen/order_list.dart';
part 'datalist_m.g.dart';

@HiveType(typeId: 0)
class Datalist extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  DateTime datetime;

  @HiveField(2)
  List<Dataitem> items;

  @HiveField(3)
  double total;

  Datalist({
    required this.name,
    required this.datetime,
    required this.items,
    required this.total,
  });
}
