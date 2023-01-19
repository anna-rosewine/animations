import 'package:animations/core/instances.dart';
import 'package:animations/ui/implicit_animations.dart';
import 'package:animations/ui/parallax_section.dart';
import 'package:animations/ui/tween_animation_builder_and_hero.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xff111111, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff111111), //10%
      100: const Color(0xff11111), //20%
      200: const Color(0xff111111), //30%
      300: const Color(0xff111111), //40%
      400: const Color(0xff111111), //50%
      500: const Color(0xff111111), //60%
      600: const Color(0xff111111), //70%
      700: const Color(0xff111111), //80%
      800: const Color(0xff111111), //90%
      900: const Color(0xff000000), //100%
    },
  );
} // you can define

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Palette.kToDark,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> pages = ['Implicit Animations', 'Tween and Hero'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: pages.length,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  ...pages.map((e) => Tab(
                        text: e,
                      ))
                ],
              ),
            ),
            body: TabBarView(
              children: [ImplicitAnimations(), TweenAnimationBuilderExample()],
            )));
  }
}
