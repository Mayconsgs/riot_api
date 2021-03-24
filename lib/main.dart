import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      title: 'League of Legends',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: FutureBuilder<String>(
        future: dataDragonApi.getInitialData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text(snapshot.error.toString()),
                ),
              );
            }

            return AllChampionsScreen();
          }

          return SplashScreen();
        },
      ),
    );
  }
}
