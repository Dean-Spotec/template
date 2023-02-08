// Author: Dean.Liu
// DateTime: 2023/02/08 23:49

import 'package:flutter/cupertino.dart';

extension EditControllerExtension on TextEditingController {
  /// 将鼠标光标移动到最后
  void moveCursorToEnd() {
    value = value.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
      composing: TextRange.empty,
    );
  }
}
