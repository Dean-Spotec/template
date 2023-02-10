// Author: Dean.Liu
// DateTime: 2023/02/10 17:12

import 'package:flutter/cupertino.dart';

import 'r.dart';

class ScreenShotPage extends StatefulWidget {
  const ScreenShotPage({super.key});

  @override
  State<ScreenShotPage> createState() => _ScreenShotPageState();
}

class _ScreenShotPageState extends State<ScreenShotPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('截屏'),
      ),
      child: Center(
        child: Image.asset(R.img1, width: 200),
      ),
    );
  }
}
