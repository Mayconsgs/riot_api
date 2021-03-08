import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riot_api/models/champion.dart';
import 'package:riot_api/stores/riotApiStore.dart';
import 'package:riot_api/widgets/atributeWidget.dart';

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
            final textTheme = Theme.of(context).textTheme;

            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 1080),
                child: ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            champion.squareImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          champion.name,
                          style: textTheme.headline5,
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AtributeWidget(
                              atribute: champion.info.attack,
                              atributeLabel: 'Ataque',
                            ),
                            const SizedBox(height: 12),
                            AtributeWidget(
                              atribute: champion.info.defense,
                              atributeLabel: 'Defesa',
                            ),
                            const SizedBox(height: 12),
                            AtributeWidget(
                              atribute: champion.info.magic,
                              atributeLabel: 'Magia',
                            ),
                            const SizedBox(height: 12),
                            AtributeWidget(
                              atribute: champion.info.difficulty,
                              atributeLabel: 'Dificuldade',
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(champion.lore),
                    const SizedBox(height: 16),
                    ExpansionTile(
                      title: Text('Atributos'),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(),
                        Text('Vida: ' + champion.stats.hp.toString()),
                        Text('Vida por nível: ' +
                            champion.stats.hpperlevel.toString()),
                        Text('mp: ' + champion.stats.mp.toString()),
                        Text('mpperlevel: ' +
                            champion.stats.mpperlevel.toString()),
                        Text('Velocidade de movimento: ' +
                            champion.stats.movespeed.toString()),
                        Text('Armadura: ' + champion.stats.armor.toString()),
                        Text('Armadura por nível: ' +
                            champion.stats.armorperlevel.toString()),
                        Text('Resistencia mágica: ' +
                            champion.stats.spellblock.toString()),
                        Text('Resistencia mágica por nível: ' +
                            champion.stats.spellblockperlevel.toString()),
                        Text('Alcance: ' +
                            champion.stats.attackrange.toString()),
                        Text('hpregen: ' + champion.stats.hpregen.toString()),
                        Text('hpregenperlevel: ' +
                            champion.stats.hpregenperlevel.toString()),
                        Text('mpregen: ' + champion.stats.mpregen.toString()),
                        Text('mpregenperlevel: ' +
                            champion.stats.mpregenperlevel.toString()),
                        Text('Crítico: ' + champion.stats.crit.toString()),
                        Text('Crítico por nível: ' +
                            champion.stats.critperlevel.toString()),
                        Text('Dano de ataque: ' +
                            champion.stats.attackdamage.toString()),
                        Text('Dano de ataque por nível: ' +
                            champion.stats.attackdamageperlevel.toString()),
                        Text('Velocidade de ataque por nível: ' +
                            champion.stats.attackspeedperlevel.toString()),
                        Text('Velocidade de ataque: ' +
                            champion.stats.attackspeed.toString()),
                        const SizedBox(height: 8),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Skins',
                      style: textTheme.subtitle1,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: champion.skins.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              AspectRatio(
                                aspectRatio: 15 / 9,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    champion.getSplashArt(index),
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, image, loading) {
                                      if (loading == null) return image;

                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                    frameBuilder: (context, child, frame,
                                        wasSynchronouslyLoaded) {
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
                              const SizedBox(width: 8)
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
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
