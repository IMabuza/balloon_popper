import 'package:bubble_popper/components/popped.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame_audio/flame_audio.dart';

class Balloon extends SpriteComponent with TapCallbacks {
  static const double speed = 200;

  Balloon({required this.balloon})
      : super(
          sprite: Sprite(Flame.images.fromCache(balloon)),
        );
  final String balloon;
  late Vector2 screenSize;
  late double tileSize;

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    screenSize = size;
    tileSize = screenSize.x / 9;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y -= speed * dt;

    if (position.y < 0) {
      parent!.remove(this);
    }
  }

  @override
  void onTapDown(TapDownEvent event) async {
    super.onTapDown(event);
    String popStr = '';

    switch (balloon) {
      case 'red_balloon.png':
        popStr = 'pop_red.png';
        break;
      case 'blue_balloon.png':
        popStr = 'pop_blue.png';
        break;
      default:
        popStr = 'pop_green.png';
    }

    FlameAudio.play('pop.mp3');

    parent!.remove(this);
    var x = Popped(popStr: popStr);
    x.size = Vector2(tileSize, tileSize);
    x.position = event.canvasPosition;

    parent!.add(x);
  }
}
