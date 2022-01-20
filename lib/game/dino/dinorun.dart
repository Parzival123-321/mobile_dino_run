import 'package:flame/input.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:pong/credits.dart';
import 'package:pong/game/dino/dino.dart';
import 'package:pong/game/display/hud_display.dart';
import '../enemies/enemies_manager.dart';

class Dinorun extends FlameGame with TapDetector, HasCollidables {

  static const _imageAssets = [
    'DinoSprites - tard.png',
    'Hyena_walk.png',
    'Vulture_walk.png',
    'Snake_walk.png',
    'parallax/BG.png',
    'parallax/Foreground.png',
    'parallax/Ground_01.png',
    'parallax/Ground_02.png',
    'parallax/Middle.png',
    'parallax/Sky.png',
    'parallax/Snow.png'
  ];

  late Dino _dino;
  late EnemyManager _enemyManager;
  late HudDisplay hudDisplay;

  @override
  Future<void> onLoad() async {

    await images.loadAll(_imageAssets);

    camera.viewport = FixedResolutionViewport(Vector2(360, 180));

    final parallaxBackground = await loadParallaxComponent(
      [
        ParallaxImageData('parallax/Sky.png'),
        ParallaxImageData('parallax/BG.png'),
        ParallaxImageData('parallax/Middle.png'),
        ParallaxImageData('parallax/Foreground.png'),
        ParallaxImageData('parallax/Ground_01.png'),
        ParallaxImageData('parallax/Ground_02.png'),
        ParallaxImageData('parallax/Snow.png'),
      ],
      baseVelocity: Vector2(12, 0),
      velocityMultiplierDelta: Vector2(1.4, 0),
    );
    add(parallaxBackground);

    _dino = Dino(images.fromCache('DinoSprites - tard.png'));

    _enemyManager = EnemyManager();

    return super.onLoad();
  }

  void startGamePlay() {
    add(_dino);
    add(_enemyManager);
  }

  @override
  void onTapDown(TapDownInfo info) {
    // if (overlays.isActive(HudDisplay.id)) {
      _dino.jump();
    // }
    super.onTapDown(info);
  }

}