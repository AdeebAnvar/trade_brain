import 'dart:developer';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../data/models/local_models/watchlist_model.dart';
import '../views/watchlist_view.dart';

class WatchlistController extends GetxController
    with StateMixin<WatchlistView> {
  RxList<WatchListModel> watchList = <WatchListModel>[].obs;
  final Box<WatchListModel> box = Hive.box<WatchListModel>('WATCH_LISTS');

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchDataFromLocal();
  }

  @override
  void onReady() {
    super.onStart();
    log('message');
  }

  Future<List<WatchListModel>> fetchDataFromLocal() async {
    change(null, status: RxStatus.loading());

    watchList.value = box.values.toList();
    change(null, status: RxStatus.success());
    return watchList;
  }

  void deleteDataFromLocal(WatchListModel watchListItem) {
    box.delete(watchListItem.key).then((dynamic value) {
      watchList.value = box.values.toList();
    });
  }
}
