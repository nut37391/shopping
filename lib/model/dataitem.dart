import 'package:hive/hive.dart';
part 'dataitem.g.dart';

@HiveType(typeId: 2)
class Dataitem extends HiveObject {
  @HiveField(0)
  String item_name;

  @HiveField(1)
  double price;

  @HiveField(2)
  int qty;

  Dataitem({
    required this.item_name,
    required this.price,
    required this.qty,
  });
}
