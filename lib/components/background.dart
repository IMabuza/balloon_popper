import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Background extends SpriteComponent {
  Background() : super(sprite: Sprite(Flame.images.fromCache('bg.jpg')));
}
