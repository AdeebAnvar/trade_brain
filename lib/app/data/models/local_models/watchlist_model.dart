import 'package:hive/hive.dart';

part 'watchlist_model.g.dart';

@HiveType(typeId: 0)
class WatchListModel extends HiveObject {
  @HiveField(0)
  late String companyName;

  @HiveField(1)
  late String sharePrice;
}
