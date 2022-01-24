import 'package:flutter/material.dart';
import 'package:pong/game/dino/dinorun.dart';
import 'package:provider/provider.dart';

import '../../pause_menu.dart';
import '../../player_data.dart';

class HudDisplay extends StatelessWidget {

  static const id = 'HudDisplay';

  final Dinorun gameRef;
  
  const HudDisplay(this.gameRef, {Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: gameRef.playerData,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Selector<PlayerData, int>(
              selector: (_, playerData) => playerData.lives,
              builder: (_, lives, __) {
                return Row(
                  children: List.generate(5, (index) {
                    if (index < lives) {
                      return const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      );
                    } else {
                      return const Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      );
                    }
                  }),
                );
              },
            ),
            Selector<PlayerData, int>(
              selector: (_, playerData) => playerData.currentScore,
              builder: (_, score, __) {
                return Text(
                  'Score: $score',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                );
              },
            ),
            TextButton(
              onPressed: () {
                gameRef.overlays.remove(HudDisplay.id);
                gameRef.overlays.add(PauseMenu.id);
                gameRef.pauseEngine();
              },
              child: const Icon(Icons.pause, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
