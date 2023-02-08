// Author: Dean.Liu
// DateTime: 2023/02/04 18:01

import 'singleton.dart';
import 'util.dart';

void main() {
  ZoneDate().switchLocalLocation('Asia/Tokyo');
  print('---- ${ZoneDate().intToZoneDate(1675602751).timeZone}');
  print('---- ${DateUtil.intToDate(1675602751).timeZoneName}');
}
