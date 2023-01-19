import 'package:animations/core/design_example.dart';
import 'package:flutter/material.dart';

class ParallaxSection extends StatefulWidget {
  final String sectionTitle;
  final List<DesignStyleItem> sectionItems;
  ParallaxSection(
      {Key? key, required this.sectionItems, required this.sectionTitle})
      : super(key: key);

  @override
  _ParallaxSectionState createState() => _ParallaxSectionState();
}

class _ParallaxSectionState extends State<ParallaxSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.sectionTitle,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        Container(
          height: 400,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.sectionItems.length,
              itemBuilder: (context, index) {
                return Text(widget.sectionItems[index].title);
              }),
        )
      ],
    );
  }
}
