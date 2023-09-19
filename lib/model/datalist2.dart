import 'package:hive/hive.dart';

import '../screen/order_list.dart';
import 'datalist_m.dart';
part 'datalist2.g.dart';

@HiveType(typeId: 1)
class Datalist2 extends HiveObject {
  @HiveField(2)
  late List<Datalist> items;

  Datalist2({
    required this.items,
  });
}
