import 'package:bubble_popper/components/balloon.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Popped extends Balloon {
  Popped({required this.popStr}) : super(balloon: popStr);
  final String popStr;

  @override
  void update(double dt) {
    super.update(dt);
    position.y += 500 * dt;
    if (position.y > screenSize.y) {
      parent!.remove(this);
    }
  }
}
