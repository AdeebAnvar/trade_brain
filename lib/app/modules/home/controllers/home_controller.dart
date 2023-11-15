import 'dart:developer';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../data/models/local_models/watchlist_model.dart';
import '../../../data/models/network_models/company_model.dart';
import '../../../data/services/network_services.dart/stock_watchlist_services.dart';
import '../views/home_view.dart';

class HomeController extends GetxController with StateMixin<HomeView> {
  Rx<GlobalQuote> companyData = GlobalQuote().obs;
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
    try {
      final GlobalQuote? response =
          await StockWatchListApi().fetchCompanyDetails(query);
      log(response.toString());
      if (response != null && response.s01Symbol != null) {
        companyData.value = response;
        isLoading.value = false;
        isDataLoaded.value = true;
        Get.snackbar('Success', 'Data Fetched');
      } else {
        isLoading.value = false;
        isDataLoaded.value = false;
      }
    } catch (e) {
      isDataLoaded.value = false;
      isLoading.value = false;

      log(e.toString());
    }
  }

  Future<void> addDataToDb({required GlobalQuote data}) async {
    final Box<WatchListModel> box = Hive.box<WatchListModel>('WATCH_LISTS');
    final WatchListModel newData = WatchListModel()
      ..companyName = data.s01Symbol ?? ''
      ..sharePrice = data.s05Price ?? '';

    await box.add(newData);
  }
}
