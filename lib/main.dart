import 'dart:convert';
import 'package:coin_cap/Pages/home_page.dart';
import 'package:coin_cap/models/app_config.dart';
import 'package:coin_cap/services/http_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadConfig();
  regHttpServices();
  runApp(const MyApp());
}

Future<void> loadConfig() async {
  String configContent = await rootBundle.loadString("asset/config/file.json");
  Map configData = jsonDecode(configContent);
  GetIt.instance.registerSingleton<AppConfig>(
      AppConfig(COIN_API_BASE_URL: configData["COIN_API_BASE_URL"]));
}

void regHttpServices() {
  GetIt.instance.registerSingleton<HttpServices>(HttpServices());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coin_Cap',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: const Color.fromARGB(255, 7, 97, 90)),
        home: const HomePage());
  }
}
