import 'dart:developer';

import 'package:animemangatoon/Model/animeWebToonsModel.dart';
import 'package:animemangatoon/dummyData.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key});

  DummyData dummyData = Get.put(DummyData());

  size(BuildContext context) => MediaQuery.of(context).size;

  Rx<bool> isFavorite = false.obs;

  final Box<AnimeWebToonsModel> favoritesBox = Hive.box('favorites');

  @override
  Widget build(BuildContext context) {
    int index = Get.arguments;
    log('DetailScreen: index: $index');
    return Scaffold(
      appBar: _buildAppBar(context, index),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: _buildBody(context, index))),
    );
  }

  AppBar _buildAppBar(BuildContext context, int index) {
    isFavorite.value =
        favoritesBox.containsKey(dummyData.popularWebtoons[index].title);
    return AppBar(
      title: Text(dummyData.popularWebtoons[index].title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      actions: [
        Obx(
          () => IconButton(
            onPressed: () {
              isFavorite.value = !isFavorite.value;
              if (isFavorite.value) {
                // Add the current webtoon to favorites
                favoritesBox.put(dummyData.popularWebtoons[index].title,
                    dummyData.popularWebtoons[index]);
              } else {
                // Remove it from favorites
                favoritesBox.delete(dummyData.popularWebtoons[index].title);
              }
            },
            icon: Icon(
              isFavorite.value
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
              color: isFavorite.value ? Colors.red : Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, int index) {
    Rx<int> rating = 0.obs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size(context).height * 0.01),
        Image.network(dummyData.popularWebtoons[index].image),
        SizedBox(height: size(context).height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Creator: ${dummyData.popularWebtoons[index].creator}',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              'Status: ${dummyData.popularWebtoons[index].details.status}',
              style: TextStyle(
                  color: dummyData.popularWebtoons[index].details.status ==
                          'Completed'
                      ? Colors.green
                      : Colors.red),
            ),
          ],
        ),
        SizedBox(width: size(context).width * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Genre: ${dummyData.popularWebtoons[index].genre}',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              'Rating: ${dummyData.popularWebtoons[index].details.rating}',
              style: TextStyle(
                  color: dummyData.popularWebtoons[index].details.rating >= 3
                      ? Colors.green
                      : Colors.red),
            ),
          ],
        ),
        SizedBox(height: size(context).height * 0.01),
        Text(
          dummyData.popularWebtoons[index].description,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        SizedBox(height: size(context).height * 0.01),
        Text('Major Characters in ${dummyData.popularWebtoons[index].title}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: size(context).height * 0.01),
        Column(
          children: _buildCharacterList(context, index),
        ),
        SizedBox(height: size(context).height * 0.01),
        Text('Conclusion',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: size(context).height * 0.01),
        Text(
          dummyData.popularWebtoons[index].details.conclusion,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        SizedBox(height: size(context).height * 0.01),
        // create working widget for user to rate the webtoon from 1 to 5 dynamically
        Text('Rate this webtoon',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: size(context).height * 0.01),
        RatingBar(
          onRatingChanged: (r) {
            rating.value = r.toInt();
          },
          maxRating: 5,
          filledIcon: Icons.star,
          emptyIcon: Icons.star_border,
          halfFilledIcon: Icons.star_half,
          isHalfAllowed: true,
          filledColor: Colors.amber,
          emptyColor: Colors.amber,
          halfFilledColor: Colors.amber,
          size: 40,
        ),

        SizedBox(height: size(context).height * 0.01),
      ],
    );
  }

  List<Widget> _buildCharacterList(BuildContext context, int id) {
    return List.generate(
      dummyData.popularWebtoons[id].details.characters.length,
      (index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dummyData.popularWebtoons[id].details.characters[index].name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size(context).height * 0.01),
            Image.network(
                dummyData.popularWebtoons[id].details.characters[index].image),
            SizedBox(height: size(context).height * 0.01),
            Text(
              dummyData
                  .popularWebtoons[id].details.characters[index].description,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            SizedBox(height: size(context).height * 0.01),
          ],
        );
      },
    );
  }
}
