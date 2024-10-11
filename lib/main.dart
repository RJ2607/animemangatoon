import 'package:animemangatoon/my_app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'Model/animeWebToonsModel.dart';
import 'Model/characterModel.dart';
import 'Model/detailsModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(AnimeWebToonsModelAdapter());
  Hive.registerAdapter(DetailsModelAdapter());
  Hive.registerAdapter(CharacterModelAdapter());

  await Hive.openBox<AnimeWebToonsModel>('favorites');

  runApp(MyApp());
}
