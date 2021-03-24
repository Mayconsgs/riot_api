import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riot_api/models/champion.dart';
import 'package:riot_api/stores/riotApiStore.dart';
import 'package:riot_api/widgets/atributeWidget.dart';

class ChampionScreen extends StatelessWidget {
  final DataDragonApi dataDragonApi = Get.find();

  final String championId;
  final String championName;
  final String squareImage;
  final ChampionInfo championInfo;
  final String heroTagImage;

  ChampionScreen({
    @required this.championId,
    @required this.championName,
    @required this.squareImage,
    @required this.championInfo,
    @required this.heroTagImage,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Campeão'),
      ),
      body: Center(
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
                    child: Hero(
                      tag: heroTagImage,
                      child: Image.network(
                        squareImage,
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
                  const SizedBox(width: 8),
                  Text(
                    championName,
                    style: textTheme.headline5,
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AtributeWidget(
                        atribute: championInfo.attack,
                        atributeLabel: 'Ataque',
                      ),
                      const SizedBox(height: 12),
                      AtributeWidget(
                        atribute: championInfo.magic,
                        atributeLabel: 'Magia',
                      ),
                      const SizedBox(height: 12),
                      AtributeWidget(
                        atribute: championInfo.defense,
                        atributeLabel: 'Defesa',
                      ),
                      const SizedBox(height: 12),
                      AtributeWidget(
                        atribute: championInfo.difficulty,
                        atributeLabel: 'Dificuldade',
                      ),
                    ],
                  )
                ],
              ),
              FutureBuilder<Champion>(
                future: dataDragonApi.getChampion(championId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }

                    Champion champion = snapshot.data;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Text(champion.lore),
                        const SizedBox(height: 16),
                        ExpansionTile(
                          tilePadding: EdgeInsets.symmetric(horizontal: 0),
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
                            Text(
                                'Armadura: ' + champion.stats.armor.toString()),
                            Text('Armadura por nível: ' +
                                champion.stats.armorperlevel.toString()),
                            Text('Resistencia mágica: ' +
                                champion.stats.spellblock.toString()),
                            Text('Resistencia mágica por nível: ' +
                                champion.stats.spellblockperlevel.toString()),
                            Text('Alcance: ' +
                                champion.stats.attackrange.toString()),
                            Text('hpregen: ' +
                                champion.stats.hpregen.toString()),
                            Text('hpregenperlevel: ' +
                                champion.stats.hpregenperlevel.toString()),
                            Text('mpregen: ' +
                                champion.stats.mpregen.toString()),
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
                        ExpansionTile(
                          tilePadding: EdgeInsets.symmetric(horizontal: 0),
                          title: Text('Jogando com ${champion.name}'),
                          children: champion.allytips.map((e) {
                            return Column(
                              children: [
                                Text(
                                  e,
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(height: 8)
                              ],
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 16),
                        ExpansionTile(
                          tilePadding: EdgeInsets.symmetric(horizontal: 0),
                          title: Text('Jogando contra ${champion.name}'),
                          children: champion.enemytips.map((e) {
                            return Column(
                              children: [
                                Text(
                                  e,
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(height: 8)
                              ],
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Passiva',
                          style: textTheme.subtitle1,
                        ),
                        const SizedBox(height: 8),
                        Card(
                          margin: EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 4,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                          champion.getPassiveAsset()),
                                    ),
                                    const SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          champion.passive.name,
                                          style: textTheme.subtitle2,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  champion.passive.description,
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Spells',
                          style: textTheme.subtitle1,
                        ),

                        const SizedBox(height: 8),

                        // Listando Habilidades
                        ...champion.spells.map((spell) {
                          return Card(
                            margin: EdgeInsets.symmetric(
                              horizontal: 0,
                              vertical: 4,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                            spell.getSpellAsset()),
                                      ),
                                      const SizedBox(width: 8),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            spell.name,
                                            style: textTheme.subtitle2,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Tempo de Recarga',
                                            style: textTheme.bodyText2,
                                          ),
                                          Row(
                                            children: spell.cooldown.map((cd) {
                                              final isLast =
                                                  spell.cooldown.indexOf(cd) ==
                                                      spell.cooldown.length - 1;

                                              return Text(
                                                '$cd${isLast ? "" : "/"}',
                                                style: textTheme.caption,
                                              );
                                            }).toList(),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    spell.description,
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),

                        const SizedBox(height: 16),
                        Text(
                          'Skins',
                          style: textTheme.subtitle1,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: MediaQuery.of(context).size.width < 1080
                              ? MediaQuery.of(context).size.width / 2
                              : MediaQuery.of(context).size.width / 4,
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
                                        loadingBuilder:
                                            (context, image, loading) {
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
                                            duration:
                                                const Duration(seconds: 1),
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
                        )
                      ],
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
