import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../../watchlist/views/watchlist_view.dart';
import '../controllers/main_screen_controller.dart';

class MainScreenView extends GetView<MainScreenController> {
  MainScreenView({super.key});

  final List<Widget> pages = <Widget>[
    const HomeView(),
    const WatchlistView(),
  ];
  @override
  Widget build(BuildContext context) {
    final MainScreenController controller = Get.put(MainScreenController());
    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: (int index) => controller.changePage(index),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.tv),
                label: 'Watch List',
              ),
            ],
          )),
    );
  }
}
