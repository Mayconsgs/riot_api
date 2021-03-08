import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:riot_api/screens/splashScreen.dart';
import 'package:riot_api/stores/riotApiStore.dart';
import 'package:riot_api/widgets/championGridItem.dart';

class AllChampionsScreen extends StatelessWidget {
  final DataDragonApi dataDragonApi = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dataDragonApi.getAllChampions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: Text('Champions'),
            ),
            body: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 1080,
                ),
                child: ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    TextField(
                      decoration: InputDecoration(hintText: 'Champion'),
                    ),
                    const SizedBox(height: 8),
                    StaggeredGridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          SliverStaggeredGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 130,
                        staggeredTileCount: dataDragonApi.listChampions.length,
                        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                      ),
                      itemBuilder: (context, index) {
                        return ChampionGridTile(
                          champion: dataDragonApi.getChampionListItem(index),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return SplashScreen();
      },
    );
  }
}
