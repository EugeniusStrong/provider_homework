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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<ScreenProvider>.value(
            value: ScreenProvider(),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Provider Homework'),
            centerTitle: true,
          ),
          body: const MyTestScreen(),
        ),
      ),
    );
  }
}

class MyTestScreen extends StatelessWidget {
  const MyTestScreen({Key? key}) : super(key: key);

  final bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    ScreenProvider state = Provider.of<ScreenProvider>(context);
    return Scaffold(
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
            CupertinoSwitch(
              value: switchValue,
              activeColor: Colors.blue,
              onChanged: (bool value) => state.changeScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenProvider extends ChangeNotifier {
  Color _color = Colors.green;
  Color get nextColors => _color;

  void changeScreen() {
    final random = Random();

    _color = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );

    notifyListeners();
  }
}
