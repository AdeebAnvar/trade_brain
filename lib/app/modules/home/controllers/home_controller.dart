import 'dart:developer';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../data/models/local_models/watchlist_model.dart';
import '../../../data/models/network_models/company_model.dart';
import '../../../data/services/network_services.dart/stock_watchlist_services.dart';
import '../views/home_view.dart';

class HomeController extends GetxController with StateMixin<HomeView> {
  RxList<CompanyModel> companyData = <CompanyModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool isDataLoaded = false.obs;

  late Box<WatchListModel> box;

  @override
  Future<void> onInit() async {
    super.onInit();
    await openHiveBox();
  }

  Future<void> openHiveBox() async {
    change(null, status: RxStatus.loading());
    // Open the Hive box
    box = await Hive.openBox<WatchListModel>('WATCH_LISTS');
    change(null, status: RxStatus.success());
  }

  Future<void> searchCompanies(String query) async {
    isLoading.value = true;
    log(query);
    try {
      final List<CompanyModel>? response =
          await StockWatchListApi().fetchCompanyDetails(query);

      if (response != null && response.isNotEmpty) {
        companyData.value = response;
        isLoading.value = false;
        isDataLoaded.value = true;
        Get.snackbar('Success', 'Data Fetched');
      } else {
        Get.snackbar('Failed', 'No Data {}');
        isLoading.value = false;
        isDataLoaded.value = false;
      }
    } catch (e) {
      Get.snackbar('Failed', 'No Data {$e}');
      isDataLoaded.value = false;
      isLoading.value = false;

      log(e.toString());
    }
  }

  Future<void> addDataToDb({required CompanyModel data}) async {
    final Box<WatchListModel> box = Hive.box<WatchListModel>('WATCH_LISTS');
    box.values.toList();
    final WatchListModel newData = WatchListModel()
      ..companyName = data.company ?? ''
      ..sharePrice = data.symbol ?? '';
    final List<WatchListModel> watchList = box.values.toList();

    final bool isDataExists = watchList.any((WatchListModel watchItem) =>
        watchItem.companyName == data.company &&
        watchItem.sharePrice == data.symbol);

    if (!isDataExists) {
      box.add(newData);
    } else {
      Get.snackbar('Failed to add storage', 'Item still exists');
    }
  }
}
