import 'package:flutter/material.dart';

Size textSize(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr)
    ..layout(minWidth: 0, maxWidth: double.infinity);
  return textPainter.size;
}

TextStyle tStyle(double size, Color color,
        [FontWeight weight = FontWeight.w500]) =>
    TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
        overflow: TextOverflow.ellipsis);
