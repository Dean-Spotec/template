// Author: Dean.Liu
// DateTime: 2023/02/08 23:56

import 'package:flutter/services.dart';

/// 剪贴板
class ClipboardUtil {
  /// 复制文本
  static void copyText(String text) {
    if (text.isEmpty) {
      return;
    }
    final ClipboardData data = ClipboardData(text: text);
    Clipboard.setData(data);
  }

  /// 粘贴文本
  static Future<String?> pasteText() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    return clipboardData?.text;
  }

  /// 粘贴板中是否有文本
  static Future<bool> hasStrings() async {
    return Clipboard.hasStrings();
  }
}
