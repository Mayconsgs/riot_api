import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:riot_api/models/champion.dart';
import 'package:riot_api/stores/riotApiStore.dart';
import 'package:riot_api/widgets/championGridItem.dart';

class AllChampionsScreen extends StatelessWidget {
  final DataDragonApi dataDragonApi = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Champions'),
      ),
      body: FutureBuilder<List<ChampionListItem>>(
        future: dataDragonApi.getAllChampions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final championsList = snapshot.data;

            return StaggeredGridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverStaggeredGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 120,
                  staggeredTileCount: championsList.length,
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1)),
              itemBuilder: (context, index) {
                return ChampionGridTile(champion: championsList[index]);
              },
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
