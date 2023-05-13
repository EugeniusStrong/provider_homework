import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<ScreenProvider>.value(
            value: ScreenProvider(),
          ),
        ],
        child: const Scaffold(
          body: MyTestScreen(),
        ),
      ),
    );
  }
}

class MyTestScreen extends StatelessWidget {
  const MyTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenProvider state = Provider.of<ScreenProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Provider Homework',
          style: TextStyle(color: state._color),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedContainer(
              width: 300,
              height: 300,
              decoration: BoxDecoration(color: state._color),
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
            ),
            Consumer<ScreenProvider>(builder: (context, value, child) {
              return CupertinoSwitch(
                  value: state.activeSwitchValue,
                  activeColor: state._color,
                  onChanged: (bool value) {
                    state.activeSwitchValue = value;
                    state.changeScreen();
                  });
            }),
          ],
        ),
      ),
    );
  }
}

class ScreenProvider extends ChangeNotifier {
  Color _color = Colors.green;
  Color get nextColors => _color;

  bool _switchValue = true;
  bool get activeSwitchValue => _switchValue;
  set activeSwitchValue(bool value) {
    _switchValue = value;
    notifyListeners();
  }

  void changeScreen() {
    final random = Random();

    _color = activeSwitchValue
        ? Colors.primaries[random.nextInt(Colors.primaries.length)]
        : Color.fromRGBO(
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
            1,
          );

    notifyListeners();
  }
}
