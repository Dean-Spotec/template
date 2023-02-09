// Author: Dean.Liu
// DateTime: 2023/02/08 17:49

import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';

import '../util/date_util.dart';

/// 处理带时区时间的单例
class ZoneDate {

  factory ZoneDate() => _instance;
  ZoneDate._internal() {
    initializeTimeZones();
    // 默认设置本地时区为utc
    setLocalLocation(UTC);
  }

  static final ZoneDate _instance = ZoneDate._internal();

  /// 全局时区
  Location get localLocation => local;

  /// 切换全局时区
  void switchLocalLocation(String locationName) {
    final location = getLocation(locationName);
    setLocalLocation(location);
  }

  /// 格式化时间戳为字符串，字符串不为空
  /// - [formatPattern] 格式化字符串
  /// - [timestampType] 时间戳的类型
  /// - [location] 时区
  /// - [defaultValue] 解析失败时的默认值
  String intToZoneString(
    int? timestamp, {
    String? formatPattern = DateFormatPreset.ymdhms,
    TimestampType timestampType = TimestampType.millisecond,
    Location? location,
    String defaultValue = '',
  }) {
    if (timestamp == null) {
      return defaultValue;
    }
    final date = intToZoneDate(
      timestamp,
      timestampType: timestampType,
      location: location,
    );
    return DateFormat(formatPattern).format(date);
  }

  /// 将时间戳转换为DateTime对象，返回值不可为空。如果不传入默认值，则显示1970.01.01
  /// - [timestampType] 时间戳的类型
  /// - [location] 时区
  /// - [defaultDate] 解析失败时的默认值
  TZDateTime intToZoneDate(
    int? timestamp, {
    TimestampType timestampType = TimestampType.millisecond,
    Location? location,
    TZDateTime? defaultDate,
  }) {
    final tmpLocation = location ?? local;
    if (timestamp == null) {
      return defaultDate ?? TZDateTime(tmpLocation, 1970);
    }
    switch (timestampType) {
      case TimestampType.second:
        return TZDateTime.fromMillisecondsSinceEpoch(tmpLocation, timestamp);
      case TimestampType.millisecond:
        return TZDateTime.fromMillisecondsSinceEpoch(
            tmpLocation, timestamp * 1000,);
      case TimestampType.microsecond:
        return TZDateTime.fromMicrosecondsSinceEpoch(
            tmpLocation, timestamp * 1000000,);
    }
  }
}
