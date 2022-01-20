import 'package:flutter/material.dart';
import 'package:pong/game/dino/dinorun.dart';
import 'package:provider/provider.dart';

class HudDisplay extends StatelessWidget {

  static const id = 'HudDisplay';

  final Dinorun gameRef;
  
  const HudDisplay(this.gameRef, {Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // value: gameRef.playerData,
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                gameRef.overlays.remove(HudDisplay.id);
                gameRef.pauseEngine();
              },
               child: const Icon(Icons.pause, color: Colors.white),
            ),
            Row(
              children: List.generate(5, (index) {
                return const Icon(
                  Icons.favorite,
                  color: Colors.red,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
