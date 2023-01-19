import 'package:flutter/material.dart';

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({Key? key}) : super(key: key);

  @override
  _ImplicitAnimationsState createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  double _width = 100;
  double _margin = 50;
  double opacity = 1;
  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.8),
              BlendMode.darken,
            ),
            child: Image.asset(
              'assets/background/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SafeArea(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Interior Design Styles',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 45),
              ),
              const SizedBox(
                height: 36,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _width = 200;
                    });
                  },
                  child: Text('change width')),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      color = Colors.yellow;
                    });
                  },
                  child: Text('change color')),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _margin = 100;
                    });
                  },
                  child: Text('change margin')),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      opacity = 0;
                    });
                  },
                  child: Text('change opacity')),
              const SizedBox(
                height: 15,
              ),
              AnimatedContainer(
                  width: _width,
                  margin: EdgeInsets.symmetric(vertical: _margin),
                  color: color,
                  child: AnimatedOpacity(
                    duration: Duration(seconds: 1),
                    opacity: opacity,
                    child: Text('Text'),
                  ),
                  duration: Duration(seconds: 1))
            ],
          ),
        ))
      ],
    );
  }
}
