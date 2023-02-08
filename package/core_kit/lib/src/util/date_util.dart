// Author: Dean.Liu
// DateTime: 2022/02/10 17:00
import 'package:intl/intl.dart';

class DateFormatPreset {
  /// 年月日时分秒毫秒
  static const ymdhmss = 'yyyy-MM-dd HH:mm:ss.SSS';

  /// 年月日时分秒
  static const ymdhms = 'yyyy-MM-dd HH:mm:ss';

  /// 年月日时分
  static const ymdhm = 'yyyy-MM-dd HH:mm';

  /// 年月日
  static const ymd = 'yyyy-MM-dd';

  /// 年月
  static const ym = 'yyyy-MM';

  /// 月日时分
  static const mdhm = 'MM-dd HH:mm';

  /// 月日
  static const md = 'MM-dd';

  /// 时分秒
  static const hms = 'HH:mm:ss';

  /// 时分
  static const hm = 'HH:mm';
}

/// 时间戳的格式类型
enum TimestampType {
  second, // 秒
  millisecond, // 毫秒
  microsecond, // 微秒
}

class DateUtil {
  /// 格式化日期为字符串，字符串不为空
  /// - [formatPattern] 格式化字符串
  /// - [defaultValue] 解析失败时的默认值
  static String dateToString(
    DateTime? dateTime, {
    String formatPattern = DateFormatPreset.ymdhms,
    String defaultValue = '',
  }) {
    if (dateTime == null) {
      return defaultValue;
    }
    return DateFormat(formatPattern).format(dateTime);
  }

  /// 格式化时间戳为字符串，字符串不为空
  /// - [formatPattern] 格式化字符串
  /// - [timestampType] 时间戳的类型
  /// - [defaultValue] 解析失败时的默认值
  static String intToString(
    int? timestamp, {
    String? formatPattern = DateFormatPreset.ymdhms,
    TimestampType timestampType = TimestampType.millisecond,
    String defaultValue = '',
  }) {
    if (timestamp == null) {
      return defaultValue;
    }
    final date = intToDate(timestamp, timestampType: timestampType);
    return DateFormat(formatPattern).format(date);
  }

  /// 将时间戳转换为 DateTime 对象，返回值不可为空。如果不传入默认值，则显示1970.01.01
  /// - [timestampType] 时间戳的类型
  /// - [defaultDate] 解析失败时的默认值
  static DateTime intToDate(
    int? timestamp, {
    TimestampType timestampType = TimestampType.millisecond,
    DateTime? defaultDate,
  }) {
    final newDefaultDate = defaultDate ?? DateTime(1979);
    if (timestamp == null) {
      return newDefaultDate;
    }
    switch (timestampType) {
      case TimestampType.second:
        return DateTime.fromMillisecondsSinceEpoch(timestamp);
      case TimestampType.millisecond:
        return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
      case TimestampType.microsecond:
        return DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000000);
    }
  }
}
