import 'package:flutter/material.dart';
import './credits.dart';
import './settings.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pong'),
        backgroundColor: Colors.black45,
        foregroundColor: Colors.white54,
      ),
      body: _buildMenu(),
    );
  }

  Widget _buildMenu() {

    Color getBackgroundColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };

      if (states.any(interactiveStates.contains)) {
        return Colors.black38;
      }
      return Colors.white54;
    }

    Color getForegroundColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };

      if (states.any(interactiveStates.contains)) {
        return Colors.white54;
      }
      return Colors.white54;
    }

    return Scaffold(
        backgroundColor: Colors.black45,
        body: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Container(
              margin: const EdgeInsets.all(15),
              child: TextButton(
                child: const Text(
                  'Start',
                  style: TextStyle(fontSize: 20.0),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith(getBackgroundColor),
                    foregroundColor:
                        MaterialStateProperty.resolveWith(getForegroundColor)),
                onPressed: () {},
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: TextButton(
                child: const Text(
                  'Settings',
                  style: TextStyle(fontSize: 20.0),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith(getBackgroundColor),
                    foregroundColor:
                        MaterialStateProperty.resolveWith(getForegroundColor)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: TextButton(
                child: const Text(
                  'Credits',
                  style: TextStyle(fontSize: 20.0),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith(getBackgroundColor),
                    foregroundColor:
                        MaterialStateProperty.resolveWith(getForegroundColor)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreditScreen()),
                  );
                },
              ),
            ),
          ]),
        )
    );
  }
}
