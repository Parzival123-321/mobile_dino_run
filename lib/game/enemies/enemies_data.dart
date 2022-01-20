import 'package:flame/extensions.dart';

class EnemyData {
  final Image image;
  final int frames;
  final double stepTime;
  final Vector2 vector;
  final double speedX;
  final bool canFly;

  const EnemyData({
    required this.image,
    required this.frames,
    required this.stepTime,
    required this.vector,
    required this.speedX,
    required this.canFly,
  });
}