import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pong/player_data.dart';
import 'credits.dart';
import 'game_over.dart';
import 'pause_menu.dart';
import 'main_menu.dart';
import 'game/dino/dinorun.dart';
import 'game/display/hud_display.dart';

Dinorun _dinoRun = Dinorun();

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Flame.device.fullScreen();
  Flame.device.setLandscape();

  await initHive();
  runApp(const DinoRunApp());
}

Future<void> initHive() async {
  // For web hive does not need to be initialized.
  if (!kIsWeb) {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }

  Hive.registerAdapter<PlayerData>(PlayerDataAdapter());
}

class DinoRunApp extends StatelessWidget {
  const DinoRunApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dino Run',
      theme: ThemeData(
        fontFamily: 'Audiowide',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            fixedSize: const Size(200, 60),
          ),
        ),
      ),
      home: Scaffold(
        body: GameWidget(
          loadingBuilder: (context) => const Center(
            child: SizedBox(
              width: 200,
              child: LinearProgressIndicator(),
            ),
          ),
          overlayBuilderMap: {
            MainMenu.id: (_, Dinorun gameRef) => MainMenu(gameRef),
            CreditScreen.id: (_, Dinorun gameRef) => CreditScreen(gameRef),
            HudDisplay.id: (_, Dinorun gameRef) => HudDisplay(gameRef),
            PauseMenu.id: (_, Dinorun gameRef) => PauseMenu(gameRef),
            GameOver.id: (_, Dinorun gameRef) => GameOver(gameRef),
          },
          initialActiveOverlays: const [MainMenu.id],
          game: _dinoRun,
        ),
      ),
    );
  }
}