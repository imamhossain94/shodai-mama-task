import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shodai_mama_task/models/rating.dart';
import 'package:shodai_mama_task/views/main_page.dart';
import 'package:sizer/sizer.dart';
import 'models/product.dart';
import 'models/rating.dart';
import 'services/hive_helper.dart';
import 'services/theme_service.dart';
import 'utils/themes.dart';
import 'utils/themes_mode.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  final appDocDir = await getApplicationDocumentsDirectory();
  Hive..init(appDocDir.path)
    ..registerAdapter(ProductAdapter())
    ..registerAdapter(RatingAdapter());

  await HiveHelper().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ThemesMode().init(context);

    return Sizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            title: 'Shodai Mama',
            theme: Themes.light,
            darkTheme: Themes.dark,
            themeMode: ThemeService().theme,
            debugShowCheckedModeBanner: false,
            home: MainPage(),
          );
        }
    );
  }

}
