import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<Uint8List> loadFileAsUint8List(String assetPathToFile) async {
  ByteData fileData = await rootBundle.load(assetPathToFile);
  return Uint8List.view(fileData.buffer);
}

Future<Uint8List> imageToPngBytes(
    BuildContext context, String assetSVG, int size) async {
  String svgString = await DefaultAssetBundle.of(context).loadString(assetSVG);
  DrawableRoot svgDrawableRoot = await svg.fromSvgString(svgString, "BB");

  MediaQueryData mediaQuery = MediaQuery.of(context);
  double width = size * mediaQuery.devicePixelRatio;
  double height = size * mediaQuery.devicePixelRatio;

  // Convert to ui.Picture
  ui.Picture picture = svgDrawableRoot.toPicture(size: Size(width, height));

  // Convert to ui.Image. toImage() takes width and height as parameters
  // you need to find the best size to suit your needs and take into account the screen DPI
  ui.Image image = await picture.toImage(width.toInt(), height.toInt());
  ByteData? bytes = await image.toByteData(format: ui.ImageByteFormat.png);

  Uint8List asUint8List = bytes?.buffer.asUint8List() ?? Uint8List(0);

  return asUint8List;
}
