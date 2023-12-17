import 'dart:async';
import 'dart:math';

import 'package:bubble_popper/components/background.dart';
import 'package:bubble_popper/components/balloon.dart';
import 'package:flame/components.dart' as c;
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';

class PopperGame extends FlameGame with TapCallbacks {
  int _score = 0;
  late Vector2 screenSize;
  late double tileSize;

  @override
  void onGameResize(c.Vector2 size) {
    super.onGameResize(size);
    screenSize = size;
    tileSize = screenSize.x / 9;
  }

  @override
  Future<void> onLoad() async {
    await Flame.images.loadAll([
      'bg.jpg',
      'red_balloon.png',
      'green_balloon.png',
      'blue_balloon.png',
      'pop_red.png',
      'pop_green.png',
      'pop_blue.png',
      'you_lose.png',
      'title.png',
      'start.png',
      'branding.png'
    ]);
    add(Background());
    // _addScore();
    Timer.periodic(
        const Duration(milliseconds: 500), (timer) => _addNewBalloon());
    // Balloon y = Balloon(balloon: 'red_balloon.png');
    // y.size = Vector2(tileSize, tileSize);
    // add(y);
  }

  // _addScore() {
  //   final scoreText =
  //       c.TextComponent(text: 'Score: $_score', anchor: Anchor.topLeft);
  //   add(scoreText);
  // }

  _addNewBalloon() {
    String randomBalloon() {
      List<String> balloons = [
        'green_balloon.png',
        'red_balloon.png',
        'blue_balloon.png'
      ];
      int index = Random().nextInt(3);
      return balloons[index];
    }

    double x = Random().nextDouble();
    var ballonRnd = Random().nextInt(3);
    final balloon = Balloon(balloon: randomBalloon());
    balloon.position = Vector2(
        (x * screenSize.x - tileSize) < 0
            ? tileSize
            : (x * screenSize.x - tileSize),
        screenSize.y);
    balloon.size = Vector2(tileSize * (x + 1), tileSize * (x + 1));
    add(balloon);
  }
}
