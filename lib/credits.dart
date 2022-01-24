import 'package:flutter/material.dart';
import 'package:pong/game/dino/dinorun.dart';
import 'dart:ui';
import 'main_menu.dart';

class CreditScreen extends StatelessWidget {
  static const id = 'CreditScreen';

  final Dinorun gameRef;

  const CreditScreen(this.gameRef, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            color: Colors.black.withAlpha(100),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Made By: \n\nMohaned Al-jabori\n', style: TextStyle(fontSize: 20,color: Colors.white),),
                  TextButton(
                    onPressed: () {
                      gameRef.overlays.remove(CreditScreen.id);
                      gameRef.overlays.add(MainMenu.id);
                      },
                    child: const Icon(Icons.arrow_back_ios_rounded),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}