import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pong/player_data.dart';
import 'package:provider/provider.dart';
import 'game/dino/dinorun.dart';
import 'game/display/hud_display.dart';
import 'main_menu.dart';

class GameOver extends StatelessWidget {

  static const id = 'GameOverMenu';

  final Dinorun gameRef;

  const GameOver(this.gameRef, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: gameRef.playerData,
      child: Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.black.withAlpha(100),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                child: Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  children: [
                    const Text(
                      'Game Over',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    Selector<PlayerData, int>(
                      selector: (_, playerData) => playerData.currentScore,
                      builder: (_, score, __) {
                        return Text(
                          'You Score: $score',
                          style: const TextStyle(
                              fontSize: 40, color: Colors.white),
                        );
                      },
                    ),
                    ElevatedButton(
                      child: const Text(
                        'Restart',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      onPressed: () {
                        gameRef.overlays.remove(GameOver.id);
                        gameRef.overlays.add(HudDisplay.id);
                        gameRef.resumeEngine();
                        gameRef.reset();
                        gameRef.startGamePlay();
                      },
                    ),
                    ElevatedButton(
                      child: const Text(
                        'Exit',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      onPressed: () {
                        gameRef.overlays.remove(GameOver.id);
                        gameRef.overlays.add(MainMenu.id);
                        gameRef.resumeEngine();
                        gameRef.reset();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
