import 'dart:math';
import 'package:flame/components.dart';
import '/game/enemies/enemies_data.dart';
import '../dino/dinorun.dart';
import 'enemies.dart';

class EnemyManager extends Component with HasGameRef<Dinorun> {

  final List<EnemyData> _data = [];
  final Random _random = Random();
  final Timer _timer = Timer(2, repeat: true);

  EnemyManager() {
    _timer.onTick = spawnRandomEnemy;
  }

  void spawnRandomEnemy() {
    final randomIndex = _random.nextInt(_data.length);
    final enemyData = _data.elementAt(randomIndex);
    final enemy = Enemy(enemyData);

    enemy.anchor = Anchor.bottomLeft;
    enemy.position = Vector2(gameRef.size.x + 32, gameRef.size.y - 24,);

    if (enemyData.canFly) {
      final newHeight = _random.nextDouble() * 2 * enemyData.vector.y;
      enemy.position.y -= newHeight;
    }

    enemy.size = enemyData.vector;
    gameRef.add(enemy);
  }

  @override
  void onMount() {
    shouldRemove = false;

    if (_data.isEmpty) {
      _data.addAll([
        EnemyData(
          image: gameRef.images.fromCache('Hyena_walk.png'),
          frames: 6,
          stepTime: 0.1,
          vector: Vector2(48, 48),
          speedX: 90,
          canFly: false,
        ),
        EnemyData(
          image: gameRef.images.fromCache('Vulture_walk.png'),
          frames: 4,
          stepTime: 0.1,
          vector: Vector2(48, 48),
          speedX: 100,
          canFly: true,
        ),
        EnemyData(
          image: gameRef.images.fromCache('Snake_walk.png'),
          frames: 4,
          stepTime: 0.09,
          vector: Vector2(48, 48),
          speedX: 120,
          canFly: false,
        ),
      ]);
    }
    _timer.start();
    super.onMount();
  }

  @override
  void update(double dt) {
    _timer.update(dt);
    super.update(dt);
  }
}
