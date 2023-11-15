import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main_screen/bindings/main_screen_binding.dart';
import '../modules/main_screen/views/main_screen_view.dart';
import '../modules/watchlist/bindings/watchlist_binding.dart';
import '../modules/watchlist/views/watchlist_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const String INITIAL = Routes.MAIN_SCREEN;

  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.WATCHLIST,
      page: () => const WatchlistView(),
      binding: WatchlistBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.MAIN_SCREEN,
      page: () => MainScreenView(),
      binding: MainScreenBinding(),
    ),
  ];
}
