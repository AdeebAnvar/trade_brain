import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/custom_company_tile.dart';
import '../controllers/watchlist_controller.dart';

class WatchlistView extends GetView<WatchlistController> {
  const WatchlistView({super.key});
  @override
  Widget build(BuildContext context) {
    final WatchlistController controller = Get.put(WatchlistController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: controller.obx(
        (WatchlistView? state) => RefreshIndicator(
          onRefresh: controller.fetchDataFromLocal,
          child: Obx(() {
            if (controller.watchList.isEmpty) {
              return ListView(
                children: const <Widget>[
                  Column(
                    children: <Widget>[
                      Center(child: Text('No data found here')),
                    ],
                  ),
                ],
              );
            } else {
              return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: controller.watchList.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomComPanyListTile(
                    needAddButton: false,
                    onTap: () => controller
                        .deleteDataFromLocal(controller.watchList[index]),
                    title: controller.watchList[index].companyName,
                    sharePrice: controller.watchList[index].sharePrice,
                  );
                },
              );
            }
          }),
        ),
      ),
    );
  }
}
