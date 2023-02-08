// Author: Dean.Liu
// DateTime: 2022/02/08 17:46

import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:intl/intl.dart';

class TextUtil {
  /// 根据规定小数点格式化为金融数值
  /// - [needNumSign] 是否显示+、-号
  static String numToFinancial(
    num? number,
    int maxDigits, {
    int minDigits = 0,
    bool needNumSign = false,
    String defaultValue = '-',
  }) {
    if (number == null) {
      return defaultValue;
    }
    final format = NumberFormat('#,##0', 'en-US');
    format.maximumFractionDigits = maxDigits;
    format.minimumFractionDigits = minDigits;
    final result = format.format(number);
    if (needNumSign && number > 0) {
      return '+$result';
    } else {
      return result;
    }
  }

  /// 根据规定小数点格式化为金融数值
  /// - [needNumSign] 是否显示+、-号
  static String stringToFinancial(
    String? string,
    int maxDigits, {
    int minDigits = 0,
    bool needNumSign = false,
    String defaultValue = '-',
  }) {
    if (string == null) {
      return defaultValue;
    }
    final result = double.tryParse(string);
    return numToFinancial(
      result,
      maxDigits,
      minDigits: minDigits,
      needNumSign: needNumSign,
      defaultValue: defaultValue,
    );
  }

  /// 根据规定小数点格式化为百分数
  /// - [needNumSign] 是否显示+、-号
  /// - [needPercentSign] bool为true时是否需要百分号
  static String numToPercent(
    num? number,
    int maxDigits, {
    int minDigits = 0,
    bool needNumSign = false,
    bool needPercentSign = true,
    String defaultValue = '-%',
  }) {
    if (number == null) {
      return defaultValue;
    }
    final format = NumberFormat('#.#%', 'en-US');
    format.maximumFractionDigits = maxDigits;
    format.minimumFractionDigits = minDigits;
    final result = needPercentSign
        ? format.format(number)
        : format.format(number).replaceAll('%', '');
    if (needNumSign && number > 0) {
      return '+$result';
    } else {
      return result;
    }
  }

  /// 根据规定小数点格式化为百分数
  /// - [needNumSign] 是否显示+、-号
  /// - [needPercentSign] bool为true时是否需要百分号
  static String stringToPercent(
    String? string,
    int maxDigits, {
    int minDigits = 0,
    bool needNumSign = false,
    bool needPercentSign = true,
    String defaultValue = '-%',
  }) {
    if (string == null) {
      return defaultValue;
    }
    final result = double.tryParse(string);
    return numToPercent(
      result,
      maxDigits,
      minDigits: minDigits,
      needNumSign: needNumSign,
      needPercentSign: needPercentSign,
      defaultValue: defaultValue,
    );
  }

  /// 根据规定小数点格式化为百分数
  ///
  /// [needNumSign] 是否显示 +、- 号；needPercentSign] bool 为 true 是的需要百分号
  static String decimalToPercent(
    Decimal? decimal,
    int maxDigits, {
    int minDigits = 0,
    bool needNumSign = false,
    String defaultValue = '-%',
    bool needPercentSign = true,
  }) {
    if (decimal == null) {
      return defaultValue;
    }
    final format = NumberFormat('#.#%', 'en-US');
    format.maximumFractionDigits = maxDigits;
    format.minimumFractionDigits = minDigits;
    final result = needPercentSign
        ? format.format(DecimalIntl(decimal))
        : format.format(DecimalIntl(decimal)).replaceAll('%', '');
    if (needNumSign && decimal > Decimal.zero) {
      return '+$result';
    } else {
      return result;
    }
  }

  /// 根据规定小数点格式化为普通数值
  /// - [needNumSign] 是否显示+、-号
  static String numToNormal(
    num? number,
    int maxDigits, {
    int minDigits = 0,
    bool needNumSign = false,
    String defaultValue = '-',
  }) {
    if (number == null) {
      return defaultValue;
    }
    final format = NumberFormat('0.#', 'en-US');
    format.maximumFractionDigits = maxDigits;
    format.minimumFractionDigits = minDigits;
    final result = format.format(number);
    if (needNumSign && number > 0) {
      return '+$result';
    } else {
      return result;
    }
  }

  /// 根据规定小数点格式化为普通数值
  /// - [needNumSign] 是否显示+、-号
  static String stringToNormal(
    String? string,
    int maxDigits, {
    int minDigits = 0,
    bool needNumSign = false,
    String defaultValue = '-',
  }) {
    if (string == null) {
      return defaultValue;
    }
    final result = double.tryParse(string);
    return numToNormal(
      result,
      maxDigits,
      minDigits: minDigits,
      needNumSign: needNumSign,
      defaultValue: defaultValue,
    );
  }

  /// decimal转普通字符串
  /// - [needNumSign] 是否显示+、-号
  static String decimalToNormal(
    Decimal? decimal,
    int maxDigits, {
    int minDigits = 0,
    bool needNumSign = false,
    String defaultValue = '-',
  }) {
    if (decimal == null) {
      return defaultValue;
    }

    final format = NumberFormat('0.#', 'en-US');
    format.maximumFractionDigits = maxDigits;
    format.minimumFractionDigits = minDigits;
    final result = format.format(DecimalIntl(decimal));
    if (needNumSign && decimal > Decimal.zero) {
      return '+$result';
    } else {
      return result;
    }
  }

  /// 按指定精度截断数字，返回值不可为空
  static String numTruncate(
    num? num,
    int digits, {
    String defaultValue = '-',
  }) {
    return stringTruncate(num?.toString(), digits, defaultValue: defaultValue);
  }

  /// 按指定精度截断数字字符串，返回值不可为空
  static String stringTruncate(
    String? string,
    int digits, {
    String defaultValue = '-',
  }) {
    if (string == null) {
      return defaultValue;
    }
    final decimal = Decimal.tryParse(string);
    if (decimal == null) {
      return string;
    } else {
      return decimalTruncate(decimal, digits, defaultValue: defaultValue);
    }
  }

  /// 按指定精度截断decimal，返回值不可为空
  static String decimalTruncate(
    Decimal? decimal,
    int digits, {
    String defaultValue = '-',
  }) {
    return decimal?.truncate(scale: digits).toStringAsFixed(digits) ??
        defaultValue;
  }

  /// 按指定精度，取数字的大值，返回值不可为空
  static String numCeil(
    num? num,
    int digits, {
    String defaultValue = '-',
  }) {
    return stringCeil(num?.toString(), digits, defaultValue: defaultValue);
  }

  /// 按指定精度，取数字字符串的大值
  static String stringCeil(
    String? string,
    int digits, {
    String defaultValue = '-',
  }) {
    if (string == null) {
      return defaultValue;
    }
    final decimal = Decimal.tryParse(string);
    if (decimal == null) {
      return string;
    } else {
      return decimalCeil(decimal, digits, defaultValue: defaultValue);
    }
  }

  /// 按指定精度，取decimal的大值
  static String decimalCeil(
    Decimal? decimal,
    int digits, {
    String defaultValue = '-',
  }) {
    return decimal?.ceil(scale: digits).toStringAsFixed(digits) ?? defaultValue;
  }

  /// 按指定精度，取数字的小值，返回值不可为空
  static String numFloor(
    num? num,
    int digits, {
    String defaultValue = '-',
  }) {
    return stringFloor(num?.toString(), digits, defaultValue: defaultValue);
  }

  /// 按指定精度，取数字字符串的小值，返回值不可为空
  static String stringFloor(
    String? string,
    int digits, {
    String defaultValue = '-',
  }) {
    if (string == null) {
      return defaultValue;
    }
    final decimal = Decimal.tryParse(string);
    if (decimal == null) {
      return string;
    } else {
      return decimalFloor(decimal, digits, defaultValue: defaultValue);
    }
  }

  /// 按指定精度，取decimal的小值，返回值不可为空
  static String decimalFloor(
    Decimal? decimal,
    int digits, {
    String defaultValue = '-',
  }) {
    return decimal?.floor(scale: digits).toStringAsFixed(digits) ??
        defaultValue;
  }
}
