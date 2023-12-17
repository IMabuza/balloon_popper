import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'popper_game.dart';

void main() {
  // Flame.device.setPortrait();
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  final game = PopperGame();
  runApp(GameWidget(game: game));
}
