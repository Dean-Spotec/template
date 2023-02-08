// Author: Dean.Liu
// DateTime: 2023/02/05 10:33

/// 字符串的通用扩展
extension StringExtension on String {
  /// 去除\u200B字符，解决省略号异常问题
  String removeZeroWidthSpace() {
    return replaceAll('', '\u200B');
  }

  int toInt({int defaultValue = 0}) {
    return int.tryParse(this) ?? defaultValue;
  }

  double toDouble({double defaultValue = 0.0}) {
    return double.tryParse(this) ?? defaultValue;
  }

  bool toBool() {
    return toLowerCase() == true.toString();
  }
}
