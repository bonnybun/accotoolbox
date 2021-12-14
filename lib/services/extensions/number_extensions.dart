import 'dart:math';

extension IntExt on int {
  String formatInMeter() {
    if (this < 1000) {
      return '$this m';
    } else {
      return '${(this / 100).round() / 10} km';
    }
  }

  double toRadian() {
    return this * pi / 180.0;
  }
}

extension DoubleExt on double {
  double roundWithDecimal(int numberOfDecimal) {
    return (this * (10 * numberOfDecimal)).round().toDouble() /
        (10 * numberOfDecimal);
  }

  double toKmPerHour() {
    return this * 3600.0 / 1000.0;
  }
}
