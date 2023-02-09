// Author: Dean.Liu
// DateTime: 2023/02/09 16:57

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// 简单的本地存储工具类，基于shared_preferences
class KeyStorage {
  factory KeyStorage() => _instance;

  KeyStorage._internal();

  static final KeyStorage _instance = KeyStorage._internal();

  SharedPreferences? _spf;

  /// 初始化SharedPreferences类，异步函数
  Future<SharedPreferences?> init() async {
    return _spf = await SharedPreferences.getInstance();
  }

  /// 所有的key
  Set<String>? get keys => _spf?.getKeys();

  /// 获取对象
  /// - [constructor] 通过json字符串构造泛型对象
  T? getObject<T>(String key, T Function(String str) constructor) {
    final jsonStr = _spf?.getString(key);
    return jsonStr == null ? null : constructor(jsonStr);
  }

  /// 存储对象
  Future<bool>? putObject(String key, Object? value) {
    if (value == null) {
      return _spf?.remove(key);
    }
    return _spf?.setString(key, json.encode(value));
  }

  /// 获取对象列表
  /// - [constructor] 通过json字符串构造泛型对象
  List<T>? getObjectList<T>(String key, T Function(String str) constructor) {
    final jsonList = _spf?.getStringList(key);
    return jsonList?.map((value) {
      return constructor(value);
    }).toList();
  }

  /// 存储对象列表
  Future<bool>? putObjectList(String key, List<Object>? value) {
    if (value == null) {
      return _spf?.remove(key);
    }
    final list = value.map((value) {
      return json.encode(value);
    }).toList();
    return _spf?.setStringList(key, list);
  }

  /// 获取字符串
  String? getString(String key) {
    return _spf?.getString(key);
  }

  /// 存储字符串
  Future<bool>? putString(String key, String? value) {
    if (value == null) {
      return _spf?.remove(key);
    }
    return _spf?.setString(key, value);
  }

  /// 获取bool值
  bool? getBool(String key) {
    return _spf?.getBool(key);
  }

  /// 存储bool值
  Future<bool>? putBool(String key, {required bool? value}) {
    if (value == null) {
      return _spf?.remove(key);
    }
    return _spf?.setBool(key, value);
  }

  /// 获取int值
  int? getInt(String key) {
    return _spf?.getInt(key);
  }

  /// 存储int值
  Future<bool>? putInt(String key, int? value) {
    if (value == null) {
      return _spf?.remove(key);
    }
    return _spf?.setInt(key, value);
  }

  /// 获取double值
  double? getDouble(String key) {
    return _spf?.getDouble(key);
  }

  /// 存储double值
  Future<bool>? putDouble(String key, double? value) {
    if (value == null) {
      return _spf?.remove(key);
    }
    return _spf?.setDouble(key, value);
  }

  /// 获取字符串数组
  List<String>? getStringList(String key) {
    return _spf?.getStringList(key);
  }

  /// 存储字符串数组
  Future<bool>? putStringList(String key, List<String>? value) {
    if (value == null) {
      return _spf?.remove(key);
    }
    return _spf?.setStringList(key, value);
  }

  /// 该key对应是否有值
  bool? containsKey(String key) {
    return _spf?.containsKey(key);
  }

  /// 删除指定key对应的值
  Future<bool>? remove(String key) {
    return _spf?.remove(key);
  }

  /// 清楚所有存储值
  Future<bool>? clear() {
    return _spf?.clear();
  }

  /// 原生代码修改本地存储后，同步到flutter中
  Future<void>? reload() {
    return _spf?.reload();
  }
}
