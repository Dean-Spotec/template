import 'package:flutter/cupertino.dart';
import 'package:template/screen_shot_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
      ),
      child: ListView(
        children: [
          CupertinoListSection(
            children: [
              CupertinoListTile(
                title: const Text('截屏'),
                onTap: () {
                  _pushPage(const ScreenShotPage());
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Future _pushPage(Widget page) {
    return Navigator.of(context).push(
      CupertinoPageRoute(builder: (context) => page),
    );
  }
}
