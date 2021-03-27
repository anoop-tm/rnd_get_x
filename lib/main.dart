import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rnd_get_x/app/data/service/sql.dart';
import 'package:rnd_get_x/app/routes/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync<SqlController>(() => SqlController().init());

  runApp(GetMaterialApp(
    initialRoute: '/home',
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
  ));
}
