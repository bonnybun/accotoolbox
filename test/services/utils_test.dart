import 'dart:math';

import 'package:accotoolbox/accotoolbox.dart';
import 'package:accotoolbox/constants/default_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils_data_provider.dart';

void main() {
  test('toDegree', () {
    final radianAngle = pi / 2;
    final result = toDegree(radianAngle);
    expect(result, 90);
  });

  test('toRadian', () {
    final degreeAngle = 90.0;
    final result = toRadians(degreeAngle);
    expect(result, pi / 2);
  });

  test("azimut from 2 coords", () {
    UtilsTestDataProvider.COORDS.forEach((CoordData data) {
      final bearing =
          bearingBetween(data.lat1, data.lng1, data.lat2, data.lng2);
      expect(bearing, data.bearing);
    });
  });

  test("distance from 2 coords", () {
    UtilsTestDataProvider.COORDS.forEach((CoordData data) {
      final bearing =
          distanceBetween(data.lat1, data.lng1, data.lat2, data.lng2);
      expect(bearing, data.distance);
    });
  });

  test("random id generator", () {
    List.generate(10, (_) {
      final id = generateID();
      expect(id >= 0 && id < INT_MAX_VALUE, true);
    });
  });

  test("text size", () {
    final style = TextStyle();
    UtilsTestDataProvider.TEXTS.forEach((text, sizeExpected) {
      final textWidth = textSize(text, style);
      expect(textWidth, sizeExpected);
    });
  });

  test("decrypt AES 128", () {
    final key = generateKey(UtilsTestDataProvider.DOT_ENV_KEY);
    expect(key.length, 16);
    final decryptedText = decrypt(
      key,
      UtilsTestDataProvider.ENCRYPTED_TEXT,
    );
    expect(decryptedText, "Super ça fonctionne !");
  });

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  test("loading png ", () async {
    final bytes = await imageToPngBytes(
        MockBuildContext(), "assets/icons/coccinelle.svg", 50);
    expect(bytes, UtilsTestDataProvider.LADYBIRD_BYTES);
  });
}
