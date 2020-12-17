import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';

class ResColor extends HexColor {
  final String _hex;
  ResColor(String hexCode)
      : this._hex = hexCode,
        super(hexCode);

  String get hexCode {
    String hexColor = _hex.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return hexColor;
  }

  // solid
  static final ResColor lightBlue = ResColor('76CBF0');
  static final ResColor darkBlue = ResColor('27A4DA');
  static final ResColor lightGrey = ResColor('F3F3F3');
  static final ResColor lightOrange = ResColor('FFB400');

  static createGradient(List<ResColor> colors) {
    return LinearGradient(
      colors: colors,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}

extension ColorConvert on int {
  String toHex() => this.toRadixString(16).padLeft(8, '0');
  ResColor toRes() => ResColor(toHex());
}
