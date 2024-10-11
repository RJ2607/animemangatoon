import 'package:animemangatoon/Views/detailScreen.dart';
import 'package:animemangatoon/dummyData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'favScreen.dart';

// Controller to handle scroll logic
class ScrollControllerGetX extends GetxController {
  final ScrollController scrollController = ScrollController();

  void scrollToIndex(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          alignment: 0); // Adjust alignment if needed
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  size(BuildContext context) => MediaQuery.of(context).size;

  DummyData dummyData = Get.put(DummyData());

  Rx<bool> isTableContents = false.obs;

  final ScrollControllerGetX scrollControllerGetX =
      Get.put(ScrollControllerGetX());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      drawer: _buildDrawer(context),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: _buildBody(context)),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Container(
        height: size(context).height * 0.1,
        width: size(context).width * 0.3,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              'https://animemangatoon.com/wp-content/uploads/2024/05/animemanga250-copy-3.png',
              scale: 0.5),
        )),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 199, 59),
            ),
            child: Container(
              height: size(context).height * 0.1,
              width: size(context).width * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                    'https://animemangatoon.com/wp-content/uploads/2024/05/animemanga250-copy-3.png',
                    scale: 0.5),
              )),
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Favorites'),
            onTap: () {
              Get.to(() => FavoritesScreen());
            },
          ),
          ListTile(
            title: Text('About'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Contact'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    List<GlobalKey> itemKeys =
        List.generate(dummyData.popularWebtoons.length, (index) => GlobalKey());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Popular Webtoons with over 50 million views',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: size(context).height * 0.01),
        Row(
          children: [
            Text('Table of Contents',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey)),
            Obx(() => IconButton(
                onPressed: () {
                  isTableContents.value = !isTableContents.value;
                },
                icon: isTableContents.value
                    ? Icon(Icons.arrow_drop_up)
                    : Icon(Icons.arrow_drop_down))),
          ],
        ),
        SizedBox(height: size(context).height * 0.01),
        Obx(() => isTableContents.value
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children:
                    List.generate(dummyData.popularWebtoons.length, (index) {
                  return TextButton(
                    onPressed: () {
                      scrollControllerGetX
                          .scrollToIndex(itemKeys[index]); // Scroll to the item
                      isTableContents.value = false;
                    },
                    style: TextButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        fixedSize: Size(size(context).width, 10)),
                    child: Text(
                      '${index + 1}. ${dummyData.popularWebtoons[index].title}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  );
                }),
              )
            : SizedBox.shrink()),
        Expanded(
          child: ListView.builder(
            itemCount: dummyData.popularWebtoons.length,
            controller: scrollControllerGetX.scrollController,
            itemBuilder: (context, index) {
              return _buildWebtoonCard(context, index, itemKeys[index]);
            },
          ),
        ),
      ],
    );
  }

  _buildWebtoonCard(BuildContext context, int index, GlobalKey key) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailScreen(), arguments: index);
      },
      child: Container(
        key: key,
        padding: EdgeInsets.symmetric(vertical: 10),
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dummyData.popularWebtoons[index].title,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size(context).height * 0.01),
            Image.network(dummyData.popularWebtoons[index].image),
            SizedBox(height: size(context).height * 0.01),
            Text(
              'Creator: ${dummyData.popularWebtoons[index].creator}',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(width: size(context).width * 0.05),
            Text(
              'Genre: ${dummyData.popularWebtoons[index].genre}',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: size(context).height * 0.01),
            Text(
              dummyData.popularWebtoons[index].description,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
