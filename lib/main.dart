import 'package:flutter/material.dart';
import 'package:getx_clean/app/app.dart';
import 'package:getx_clean/app/di/getx_di.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await initDependencyInjection();
  runApp(const App());
}
