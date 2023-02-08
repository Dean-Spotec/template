// Author: Dean.Liu
// DateTime: 2021/08/12 18:45

/// 判断 String 是否为 null，长度是否为 0
extension StringNullEmptyExtension on String? {
  /// 传入值为 null 或者长度为 0，则返回 true
  bool get isNullOrEmpty => (this ?? '').isEmpty;

  /// 传入值不为 null 或者长度大于 0，则返回 true
  bool get isNotNullOrEmpty => !isNullOrEmpty;
}

/// 判断 List 是否为 null，长度是否为 0
extension ListNullEmptyExtension on List? {
  /// 传入值为 null 或者长度为 0，则返回 true
  bool get isNullOrEmpty => (this ?? []).isEmpty;

  /// 传入值不为 null 或者长度大于 0，则返回 true
  bool get isNotNullOrEmpty => !isNullOrEmpty;
}

/// 判断 Map 是否为 null，长度是否为 0
extension MapNullEmptyExtension on Map? {
  /// 传入值为 null 或者长度为 0，则返回 true
  bool get isNullOrEmpty => (this ?? {}).isEmpty;

  /// 传入值不为 null 或者长度大于 0，则返回 true
  bool get isNotNullOrEmpty => !isNullOrEmpty;
}
