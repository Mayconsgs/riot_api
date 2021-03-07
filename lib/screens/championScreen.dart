import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riot_api/models/champion.dart';
import 'package:riot_api/stores/riotApiStore.dart';

class ChampionScreen extends StatelessWidget {
  final String championId;
  final DataDragonApi dataDragonApi = Get.find();

  ChampionScreen({@required this.championId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(championId),
      ),
      body: FutureBuilder<Champion>(
        future: dataDragonApi.getChampion(championId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            Champion champion = snapshot.data;

            return Center(
              child: Text(champion.name),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
