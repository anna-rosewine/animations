import 'package:animations/core/instances.dart';
import 'package:animations/ui/open_page.dart';
import 'package:flutter/material.dart';

class TweenAnimationBuilderExample extends StatefulWidget {
  const TweenAnimationBuilderExample({Key? key}) : super(key: key);

  @override
  _TweenAnimationBuilderExampleState createState() =>
      _TweenAnimationBuilderExampleState();
}

class _TweenAnimationBuilderExampleState
    extends State<TweenAnimationBuilderExample> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Container(
        color: Color(0xff111111),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              height: 100,
              child: TweenAnimationBuilder(
                  curve: Curves.easeIn,
                  tween: Tween<double>(begin: 0, end: 1),
                  child: Text(
                    'Interior Design Styles',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  duration: const Duration(milliseconds: 500),
                  builder: (context, tweenValue, child) {
                    return Opacity(
                      opacity: tweenValue,
                      child: Padding(
                          padding: EdgeInsets.only(top: tweenValue * 20),
                          child: child),
                    );
                  }),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: designStyles.length,
                  itemBuilder: (context, i) {
                    print(designStyles[i].imagePath);
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      OpenPage(style: designStyles[i])));
                        },
                        leading: imageContainer(designStyles[i].imagePath),
                        title: Text(designStyles[i].title),
                        textColor: Colors.white,
                      ),
                    );
                  }),
            )
          ],
        ));
  }

  imageContainer(String path) {
    return Hero(
      tag: path,
      child: Image.asset(
        path,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
    );
  }
}
