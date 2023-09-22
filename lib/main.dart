import 'package:flutter/material.dart';
import 'package:spine_flutter/spine_flutter.dart';
import 'package:spine_flutter/spine_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSpineFlutter(enableMemoryDebugging: false);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final controller = SpineWidgetController(onInitialized: (controller) {
      // Set the walk animation on track 0, let it loop
      controller.animationState.setAnimationByName(0, "walk", true);
    });

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(title: const Text('Simple Animation')),
          body: SpineWidget.fromAsset("assets/spineboy.atlas", "assets/spineboy-pro.skel", controller)
      )
    );
  }
}