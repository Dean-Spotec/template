// // Author: Dean.Liu
// // DateTime: 2022/01/27 19:04
//
// import 'dart:math';
//
// import 'package:decimal/decimal.dart';
// import 'package:flutter/services.dart';
//
// import '../utils/hud_util.dart';
//
// class InputDecimalFormatter extends TextInputFormatter {
//   InputDecimalFormatter({
//     required String maxValue,
//     required this.maxHint,
//     required this.minHint,
//     String minValue = '0',
//     int? digits,
//     this.autoHint = true,
//     this.forceGreaterThanMin = false,
//   }) {
//     maxNumber = Decimal.tryParse(maxValue) ?? Decimal.zero;
//     minNumber = Decimal.tryParse(minValue) ?? Decimal.zero;
//     if (digits == null) {
//       final maxList = maxNumber.toString().split('.');
//       final minList = minNumber.toString().split('.');
//       final maxNumberDigits = maxList.length == 1 ? 0 : maxList.last.length;
//       final minNumberDigits = minList.length == 1 ? 0 : minList.last.length;
//       _digits = max(maxNumberDigits, minNumberDigits);
//     } else {
//       _digits = digits;
//     }
//   }
//
//   /// 最大值
//   late Decimal maxNumber;
//
//   /// 最小值
//   late Decimal minNumber;
//
//   /// 超过最大值时的提示
//   final String maxHint;
//
//   /// 超过最小值时的提示
//   final String minHint;
//
//   /// 是否自动提示最大最小值
//   final bool autoHint;
//
//   /// 是否强制要求输入值必须大于最小值
//   final bool forceGreaterThanMin;
//
//   /// 最大小数位数
//   late int _digits;
//
//   static const _pointer = '.';
//
//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue,
//     TextEditingValue newValue,
//   ) {
//     var tmpNewValue = newValue;
//     // 输入完全删除
//     if (tmpNewValue.text.isEmpty) {
//       if (autoHint) {
//         HudUtil.showInfo(minHint);
//       }
//       if (forceGreaterThanMin) {
//         return _getMinTextValue();
//       } else {
//         return newValue;
//       }
//     }
//
//     final input = tmpNewValue.text;
//     if (input.contains('+') || input.contains('-')) {
//       return oldValue;
//     }
//     final newNumber = Decimal.tryParse(input);
//     if (newNumber == null) {
//       return oldValue;
//     }
//
//     // 包含小数点的情况
//     if (tmpNewValue.text.contains(_pointer)) {
//       final firstIndexOfPointer = input.indexOf(_pointer);
//       final lastIndexOfPointer = input.lastIndexOf(_pointer);
//
//       // 包含多个小数
//       if (firstIndexOfPointer != lastIndexOfPointer) {
//         return oldValue;
//       }
//
//       // 小数点后位数
//       final lengthAfterPointer =
//           input.substring(firstIndexOfPointer, input.length).length - 1;
//       // 小数位大于精度
//       if (lengthAfterPointer > _digits) {
//         if (newNumber > maxNumber && autoHint) {
//           HudUtil.showInfo(maxHint);
//         }
//         return oldValue;
//       }
//       // digits为0不能输入小数点
//       if (_digits == 0) {
//         return oldValue;
//       }
//       // 小于0返回原来的值
//       if ((double.tryParse(tmpNewValue.text) ?? 0) < 0) {
//         return oldValue;
//       }
//     } else {
//       // 不能以 0 开头
//       if (input.length == 2 && input.startsWith('0')) {
//         final text = input.replaceFirst('0', '');
//         const selection = TextSelection(baseOffset: 1, extentOffset: 1);
//         tmpNewValue = tmpNewValue.copyWith(text: text, selection: selection);
//       }
//     }
//
//     if (newNumber > maxNumber) {
//       final maxNumberText = maxNumber.truncate(scale: _digits).toString();
//       final maxNumberLength = maxNumberText.length;
//       final selection = TextSelection(
//         baseOffset: maxNumberLength,
//         extentOffset: maxNumberLength,
//       );
//       if (autoHint) {
//         HudUtil.showInfo(maxHint);
//       }
//       return tmpNewValue.copyWith(text: maxNumberText, selection: selection);
//     }
//
//     // 删除操作
//     if (tmpNewValue.text.length < oldValue.text.length) {
//       if (newNumber < minNumber) {
//         if (autoHint) {
//           HudUtil.showInfo(minHint);
//         }
//         if (forceGreaterThanMin) {
//           return _getMinTextValue();
//         }
//       }
//     }
//
//     return tmpNewValue;
//   }
//
//   TextEditingValue _getMinTextValue() {
//     final minNumberText = minNumber.truncate(scale: _digits).toString();
//     final minNumberLength = minNumberText.length;
//     final selection = TextSelection(
//       baseOffset: minNumberLength,
//       extentOffset: minNumberLength,
//     );
//     return TextEditingValue(text: '$minNumber', selection: selection);
//   }
// }
