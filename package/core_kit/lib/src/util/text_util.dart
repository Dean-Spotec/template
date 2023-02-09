// Author: Dean.Liu
// DateTime: 2022/02/08 17:46

import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';

class TextUtil {
  /// 根据规定小数点格式化为金融数值
  /// - [needNumSign] 是否需要+、-号
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
  /// - [needNumSign] 是否需要+、-号
  static String stringToFinancial(
    String? string,
    int maxDigits, {
    int minDigits = 0,
    bool needNumSign = false,
    String defaultValue = '-',
  }) {
    final result = double.tryParse(string ?? '');
    return numToFinancial(
      result,
      maxDigits,
      minDigits: minDigits,
      needNumSign: needNumSign,
      defaultValue: defaultValue,
    );
  }

  /// 根据规定小数点格式化为金融数值
  /// - [needNumSign] 是否需要+、-号
  static String decimalToFinancial(
    Decimal? decimal,
    int maxDigits, {
    int minDigits = 0,
    bool needNumSign = false,
    String defaultValue = '-',
  }) {
    return stringToFinancial(
      decimal?.toString(),
      maxDigits,
      minDigits: minDigits,
      needNumSign: needNumSign,
      defaultValue: defaultValue,
    );
  }

  /// 根据规定小数点格式化为百分数
  /// - [needNumSign] 是否需要+、-号
  /// - [needPercentSign] 是否需要百分号
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
  /// - [needNumSign] 是否需要+、-号
  /// - [needPercentSign] 是否需要百分号
  static String stringToPercent(
    String? string,
    int maxDigits, {
    int minDigits = 0,
    bool needNumSign = false,
    bool needPercentSign = true,
    String defaultValue = '-%',
  }) {
    final result = double.tryParse(string ?? '');
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
  /// - [needNumSign] 是否需要+、-号
  /// - [needPercentSign] 是否需要百分号
  static String decimalToPercent(
    Decimal? decimal,
    int maxDigits, {
    int minDigits = 0,
    bool needNumSign = false,
    String defaultValue = '-%',
    bool needPercentSign = true,
  }) {
    return stringToPercent(
      decimal?.toString(),
      maxDigits,
      minDigits: minDigits,
      needNumSign: needNumSign,
      needPercentSign: needPercentSign,
      defaultValue: defaultValue,
    );
  }

  /// 根据规定小数点格式化为普通数值
  /// - [needNumSign] 是否需要+、-号
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
  /// - [needNumSign] 是否需要+、-号
  static String stringToNormal(
    String? string,
    int maxDigits, {
    int minDigits = 0,
    bool needNumSign = false,
    String defaultValue = '-',
  }) {
    final result = double.tryParse(string ?? '');
    return numToNormal(
      result,
      maxDigits,
      minDigits: minDigits,
      needNumSign: needNumSign,
      defaultValue: defaultValue,
    );
  }

  /// 根据规定小数点格式化为普通数值
  /// - [needNumSign] 是否需要+、-号
  static String decimalToNormal(
    Decimal? decimal,
    int maxDigits, {
    int minDigits = 0,
    bool needNumSign = false,
    String defaultValue = '-',
  }) {
    return stringToNormal(
      decimal?.toString(),
      maxDigits,
      minDigits: minDigits,
      needNumSign: needNumSign,
      defaultValue: defaultValue,
    );
  }

  /// 按指定精度截断数字
  static String truncateNum(
    num? num,
    int digits, {
    String defaultValue = '-',
  }) {
    return truncateString(num?.toString(), digits, defaultValue: defaultValue);
  }

  /// 按指定精度截断数字字符串
  static String truncateString(
    String? string,
    int digits, {
    String defaultValue = '-',
  }) {
    final decimal = Decimal.tryParse(string ?? '');
    return truncateDecimal(decimal, digits, defaultValue: defaultValue);
  }

  /// 按指定精度截断decimal
  static String truncateDecimal(
    Decimal? decimal,
    int digits, {
    String defaultValue = '-',
  }) {
    return decimal?.truncate(scale: digits).toStringAsFixed(digits) ??
        defaultValue;
  }

  /// 按指定精度，取数字的大值
  static String ceilNum(
    num? num,
    int digits, {
    String defaultValue = '-',
  }) {
    return ceilString(num?.toString(), digits, defaultValue: defaultValue);
  }

  /// 按指定精度，取数字字符串的大值
  static String ceilString(
    String? string,
    int digits, {
    String defaultValue = '-',
  }) {
    final decimal = Decimal.tryParse(string ?? '');
    return ceilDecimal(decimal, digits, defaultValue: defaultValue);
  }

  /// 按指定精度，取decimal的大值
  static String ceilDecimal(
    Decimal? decimal,
    int digits, {
    String defaultValue = '-',
  }) {
    return decimal?.ceil(scale: digits).toStringAsFixed(digits) ?? defaultValue;
  }

  /// 按指定精度，取数字的小值
  static String floorNum(
    num? num,
    int digits, {
    String defaultValue = '-',
  }) {
    return floorString(num?.toString(), digits, defaultValue: defaultValue);
  }

  /// 按指定精度，取数字字符串的小值
  static String floorString(
    String? string,
    int digits, {
    String defaultValue = '-',
  }) {
    final decimal = Decimal.tryParse(string ?? '');
    return floorDecimal(decimal, digits, defaultValue: defaultValue);
  }

  /// 按指定精度，取decimal的小值
  static String floorDecimal(
    Decimal? decimal,
    int digits, {
    String defaultValue = '-',
  }) {
    return decimal?.floor(scale: digits).toStringAsFixed(digits) ??
        defaultValue;
  }
}
