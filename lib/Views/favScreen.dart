import 'package:animemangatoon/Model/animeWebToonsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'detailScreen.dart';

class FavoritesScreen extends StatelessWidget {
  final Box<AnimeWebToonsModel> favoritesBox = Hive.box('favorites');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Webtoons"),
      ),
      body: ValueListenableBuilder(
        valueListenable: favoritesBox.listenable(),
        builder: (context, Box<AnimeWebToonsModel> box, _) {
          if (box.values.isEmpty) {
            return Center(child: Text("No favorites added yet!"));
          }
          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              AnimeWebToonsModel webtoon = box.getAt(index)!;
              return ListTile(
                title: Text(webtoon.title),
                subtitle: Text(webtoon.genre),
                leading: Image.network(webtoon.image),
                onTap: () {
                  Get.to(() => DetailScreen(), arguments: index);
                },
              );
            },
          );
        },
      ),
    );
  }
}
