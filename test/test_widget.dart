import 'package:flutter/material.dart';
import 'package:hidable/hidable.dart';
import 'package:hidable/src/hidable_controller.dart';

// Just a simple testing utility widget.
// Used to test, hidable widget and hidable controller.
class TestWidget extends StatelessWidget {
  final bool enableOpacityAnimation;
  final ScrollController scrollController;
  final bool wAppBar;
  final HidableVisibility? visibility;

  const TestWidget(
      {Key? key,
      required this.scrollController,
      this.enableOpacityAnimation = true,
      this.wAppBar = false,
      this.visibility})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: !wAppBar ? null : Hidable(child: AppBar(), controller: scrollController),
        body: ListView(
          controller: scrollController,
          children: List.generate(30, (index) => Text('Text $index')).toList(),
        ),
        bottomNavigationBar: wAppBar
            ? null
            : Hidable(
                visibility: visibility,
                controller: scrollController,
                enableOpacityAnimation: enableOpacityAnimation,
                child: Container(
                  height: kBottomNavigationBarHeight,
                  color: Colors.black,
                ),
              ),
      ),
    );
  }
}
