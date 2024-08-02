import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SandBox extends StatefulWidget {
  const SandBox({super.key});

  @override
  State<SandBox> createState() => _SandBoxState();
}

class _SandBoxState extends State<SandBox> {
  double width = 200;
  double opacity = 1;
  double margin = 0;
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        margin: EdgeInsets.all(margin),
        width: width,
        color: color,
        duration: Duration(seconds: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(
                  () {
                    margin == 0? margin = 50: margin = 0;
                  },
                );
              },
              child: const Text('animated margin'),
            ),
            TextButton(
              onPressed: () {
                setState(
                  () {
                    color == Colors.blue?color = Colors.green:color = Colors.blue;
                  },
                );
              },
              child: const Text('animated color'),
            ),
            TextButton(
              onPressed: () {
                setState(
                  () {
                    width == 200? width = 400: width = 200;
                  },
                );
              },
              child: const Text('animated width'),
            ),
          ],
        ),
      ),
    );
  }
}
