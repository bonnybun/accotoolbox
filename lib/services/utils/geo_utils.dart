import 'dart:math';

import 'package:accotoolbox/constants/default_constants.dart';

/// Calculates the distance between the supplied coordinates in meters.
double distanceBetween(
  double startLatitude,
  double startLongitude,
  double endLatitude,
  double endLongitude,
) {
  var earthRadius = 6378137.0;
  var dLat = toRadians(endLatitude - startLatitude);
  var dLon = toRadians(endLongitude - startLongitude);

  var a = pow(sin(dLat / 2), 2) +
      pow(sin(dLon / 2), 2) *
          cos(toRadians(startLatitude)) *
          cos(toRadians(endLatitude));
  var c = 2 * asin(sqrt(a));

  return earthRadius * c;
}

double toRadians(double degree) {
  return degree * pi / 180;
}

double toDegree(double radian) {
  return radian * 180.0 / pi;
}

/// Calculates the initial bearing between two points
int bearingBetween(
  double startLatitude,
  double startLongitude,
  double endLatitude,
  double endLongitude,
) {
  var startLongitudeRadians = toRadians(startLongitude);
  var startLatitudeRadians = toRadians(startLatitude);
  var endLongitudeRadians = toRadians(endLongitude);
  var endLatitudeRadians = toRadians(endLatitude);

  var y = sin(endLongitudeRadians - startLongitudeRadians) *
      cos(endLatitudeRadians);
  var x = cos(startLatitudeRadians) * sin(endLatitudeRadians) -
      sin(startLatitudeRadians) *
          cos(endLatitudeRadians) *
          cos(endLongitudeRadians - startLongitudeRadians);

  var bearing = toDegree(atan2(y, x)).round();
  if (bearing < TOUR_IN_DEGREE) {
    bearing += TOUR_IN_DEGREE;
  }
  if (bearing > TOUR_IN_DEGREE) {
    bearing -= TOUR_IN_DEGREE;
  }
  return bearing;
}
