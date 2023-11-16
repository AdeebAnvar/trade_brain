import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/custom_company_tile.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: controller.obx((HomeView? state) => Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    onSubmitted: (String value) async {
                      await controller.searchCompanies(value);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Search companies...',
                    ),
                  ),
                ),
                Obx(() => controller.isLoading.value
                    ? const Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: CircularProgressIndicator(),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox()),
                Obx(
                  () => controller.companyData.isNotEmpty &&
                          controller.isDataLoaded.value
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.companyData.length,
                          itemBuilder: (context, index) =>
                              CustomComPanyListTile(
                            title: controller.companyData[index].company ?? '',
                            sharePrice:
                                controller.companyData[index].symbol ?? '',
                            onTap: () => controller.addDataToDb(
                                data: controller.companyData[index]),
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            )),
      ),
    );
  }
}
