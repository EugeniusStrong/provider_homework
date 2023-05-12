import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyTestScreen(),
    );
  }
}

class MyTestScreen extends StatelessWidget {
  MyTestScreen({Key? key}) : super(key: key);

  final bool switchValue = true;

  final double _width = 300;
  final double _height = 300;
  final Color _color = Colors.green;
  final BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Homework'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedContainer(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
            ),
            CupertinoSwitch(
              value: switchValue,
              activeColor: Colors.blue,
              onChanged: (bool? value) {},
            ),
          ],
        ),
      ),
    );
  }
}
