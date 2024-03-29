import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({Key? key}) : super(key: key);

  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double?> _sizeAnimation;
  late Animation<double> _curve;
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _curve = CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);
    _colorAnimation =
        ColorTween(begin: Colors.grey[400], end: Colors.red).animate(_curve);
    // _controller.forward();
    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 50), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 30), weight: 50),
    ]).animate(_curve);

    _controller.addListener(() {
      // setState(() {});
      print(_colorAnimation.value);
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
      print(status);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (vontext, child) {
        return IconButton(
          onPressed: () {
            isFav == false ? _controller.forward() : _controller.reverse();
          },
          icon: Icon(Icons.favorite),
          color: _colorAnimation.value,
          iconSize: _sizeAnimation.value,
        );
      },
    );
  }
}
