import 'package:chatform/modules/home/home_binding.dart';
import 'package:chatform/modules/home/home_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
