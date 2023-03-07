import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_clean/app/routes/app_pages.dart';
import 'package:getx_clean/generated/locales.g.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      translationsKeys: AppTranslation.translations,
      locale: const Locale('vi', 'VN'),
    );
  }
}
