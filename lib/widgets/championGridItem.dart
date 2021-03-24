import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:riot_api/models/champion.dart';
import 'package:riot_api/screens/championScreen.dart';

class ChampionGridTile extends StatelessWidget {
  final ChampionListItem champion;

  ChampionGridTile({@required this.champion});

  @override
  Widget build(BuildContext context) {
    final String heroTagImage = champion.id + DateTime.now().toString();

    return GestureDetector(
      onTap: () => Get.to(
        () => ChampionScreen(
          championId: champion.id,
          championName: champion.name,
          squareImage: champion.squareImage,
          championInfo: champion.info,
          heroTagImage: heroTagImage,
        ),
      ),
      child: Card(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              child: Hero(
                  tag: heroTagImage,
                  child: Image.network(
                    champion.squareImage,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, image, loading) {
                      if (loading == null) return image;

                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                      if (wasSynchronouslyLoaded ?? false) {
                        return child;
                      }

                      return AnimatedOpacity(
                        child: child,
                        opacity: frame == null ? 0 : 1,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeOut,
                      );
                    },
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                champion.name,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
