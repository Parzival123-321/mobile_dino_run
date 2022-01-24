import 'package:flame/geometry.dart';
import 'package:flame/components.dart';
import '../dino/dinorun.dart';
import 'enemies_data.dart';

class Enemy extends SpriteAnimationComponent
    with HasHitboxes, Collidable, HasGameRef<Dinorun> {
  final EnemyData enemyData;

  Enemy(this.enemyData) {
    animation = SpriteAnimation.fromFrameData(enemyData.image,
    SpriteAnimationData.sequenced(amount: enemyData.frames, stepTime: enemyData.stepTime, textureSize: enemyData.vector),
    );
  }

  @override
  void onMount() {
    final shape = HitboxRectangle(relation: Vector2.all(0.4));
    addHitbox(shape);

    size *= 0.9;

    super.onMount();
  }

  @override
  void update(double dt) {
    position.x -= enemyData.speedX * dt;

    if (position.x < -enemyData.vector.x) {
      removeFromParent();
      gameRef.playerData.currentScore += 1;
    }

    super.update(dt);
  }
}