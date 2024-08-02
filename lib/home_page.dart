import 'package:animation/widgets/trip_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home-Page"),
      ),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.png"),
              alignment: Alignment.topLeft,
            ),
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                _pageTitle(context),
                const Flexible(child: TripList()),
              ],
            ),
          )),
    );
  }

  Widget _pageTitle(BuildContext context) {
    return SizedBox(
      height: 160,
      child: TweenAnimationBuilder(
        duration: const Duration(seconds: 1),
        tween: Tween<double>(begin: 0, end: 1),
        builder: (context,double value,child) {
          return Opacity(
            opacity: value,
            child: Padding(
              padding: EdgeInsets.only(top: value * 20),
              child: child,
            ),
          );
        },
        child: const Text(
          'trips',
          style: TextStyle(
            fontSize: 36,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
