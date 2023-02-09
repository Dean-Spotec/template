// Author: Dean.Liu
// DateTime: 2021/08/12 19:45

import 'package:flutter/cupertino.dart';

/// 各种视图大小工具类，使用前需要先调用 [init] 方法
class AppSize {
  factory AppSize() => _instance;

  AppSize._internal();

  static final AppSize _instance = AppSize._internal();

  MediaQueryData? _queryData;

  /// 设置app级别的根context，才能获取到屏幕尺寸相关信息
  /// [tabBarHeight] 默认值为值_kTabBarHeight(50)
  void init(
    BuildContext context, {
    double? tabBarHeight,
  }) {
    _queryData = MediaQuery.of(context);
    _tabBarHeight = tabBarHeight;
  }

  /// 屏幕相关信息
  MediaQueryData? get queryData => _queryData;

  /// 导航栏高度
  double get appBarHeight =>
      const CupertinoNavigationBar().preferredSize.height;

  /// tabBar高度
  double get tabBarHeight =>
      _tabBarHeight ?? CupertinoTabBar(items: const []).preferredSize.height;
  double? _tabBarHeight;

  /// 屏幕宽度，切换横竖屏后可实时获取
  double get screenWidth => _queryData?.size.width ?? 0;

  /// 屏幕高度，切换横竖屏后可实时获取
  double get screenHeight => _queryData?.size.height ?? 0;

  /// 屏幕顶部安全区域高度，切换横竖屏后可实时获取
  double get topPadding => _queryData?.padding.top ?? 0;

  /// 屏幕底部安全区域高度，切换横竖屏后可实时获取
  double get bottomPadding => _queryData?.padding.bottom ?? 0;

  /// 屏幕高度-上下安全区域高度
  double get safeScreenHeight => screenHeight - topPadding - bottomPadding;

  /// 顶部安全区域高度+导航栏高度
  double get safeAppBarHeight => appBarHeight + topPadding;

  /// 底部安全区域高度+tab栏高度
  double get safeTabBarHeight => tabBarHeight + bottomPadding;
}
