import 'package:animations/core/design_example.dart';
import 'package:flutter/material.dart';

class OpenPage extends StatefulWidget {
  final DesignStyleItem style;
  const OpenPage({Key? key, required this.style}) : super(key: key);

  @override
  _OpenPageState createState() => _OpenPageState();
}

class _OpenPageState extends State<OpenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff111111),
        body: Column(
          children: [
            ClipRRect(
                child: Hero(
              tag: widget.style.imagePath,
              child: Image.asset(
                widget.style.imagePath,
                fit: BoxFit.cover,
                height: 360,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.topCenter,
              ),
            )),
            const SizedBox(
              height: 30,
            ),
            Text(widget.style.title,
                style: TextStyle(fontSize: 30, color: Colors.white)),
          ],
        ));
  }
}
