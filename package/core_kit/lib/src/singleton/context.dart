// Author: Dean.Liu
// DateTime: 2021/11/21 11:50

import 'package:flutter/cupertino.dart';

class Context {

  factory Context() => _instance;
  Context._internal();

  static final Context _instance = Context._internal();

  /// 路由观察者
  final routeObserver = RouteObserver<ModalRoute<Object?>>();

  /// 将该属性设置为MaterialApp的navigatorKey，可以全局获取根导航器的信息
  final navigatorKey = GlobalKey<NavigatorState>();

  /// 根navigator的上下文
  BuildContext get navigatorContext {
    return navigatorKey.currentContext!;
  }

  /// 持有根navigator的state.
  NavigatorState get navigatorState {
    return navigatorKey.currentState!;
  }

  /// 持有根navigator的widget
  Widget get navigatorWidget {
    return navigatorKey.currentWidget!;
  }

  /// 根navigator的浮层
  OverlayState get navigatorOverlay {
    return navigatorKey.currentState!.overlay!;
  }
}
