import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rnd_get_x/app/routes/pages.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/home',
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
  ));
}
