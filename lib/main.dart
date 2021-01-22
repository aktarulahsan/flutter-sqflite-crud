import 'package:flutter/material.dart';
import 'package:flutter_crud/database/db_helper.dart';
import 'package:flutter_crud/theme.dart';
import 'package:flutter_crud/themeService/themeService.dart';
import 'package:flutter_crud/ui/page/home_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: HomePage(),
    );
  }
}
