import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:riot_api/screens/allChampionsScreen.dart';
import 'package:riot_api/screens/splashScreen.dart';
import 'package:riot_api/stores/riotApiStore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final DataDragonApi dataDragonApi = Get.put(DataDragonApi());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: FutureBuilder<http.Response>(
        future: http.get(
          Uri.http("ddragon.leagueoflegends.com", "/api/versions.json"),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final listVersions =
                List<String>.from(json.decode(snapshot.data.body));

            dataDragonApi.setVersion = listVersions[0];

            return AllChampionsScreen();
          }

          return SplashScreen();
        },
      ),
    );
  }
}
