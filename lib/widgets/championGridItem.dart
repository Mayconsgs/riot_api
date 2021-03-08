import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:riot_api/models/champion.dart';
import 'package:riot_api/screens/championScreen.dart';

class ChampionGridTile extends StatelessWidget {
  final ChampionListItem champion;

  ChampionGridTile({@required this.champion});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ChampionScreen(championId: champion.id)),
      child: Card(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4), topRight: Radius.circular(4)),
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
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(champion.name),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
