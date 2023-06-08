import 'package:flutter/material.dart';

class Borders {
  static const BorderSide defaultPrimaryBorder =
      BorderSide(width: 0, style: BorderStyle.none);

  static const UnderlineInputBorder primaryInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 1,
      style: BorderStyle.solid,
    ),
  );

  static const UnderlineInputBorder enabledBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 1,
      style: BorderStyle.solid,
    ),
  );

  static const UnderlineInputBorder focusedBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromARGB(255, 254, 251, 228),
      width: 2,
      style: BorderStyle.solid,
    ),
  );

  static const UnderlineInputBorder disabledBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromARGB(255, 254, 251, 228),
      width: 1,
      style: BorderStyle.solid,
    ),
  );

  static const OutlineInputBorder outlineEnabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(
      color: Color.fromARGB(255, 254, 251, 228),
      width: 1,
      style: BorderStyle.solid,
    ),
  );

  static const OutlineInputBorder outlineFocusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(
      color: Color.fromARGB(255, 254, 251, 228),
      width: 1,
      style: BorderStyle.solid,
    ),
  );

  static const OutlineInputBorder outlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(
      color: Color.fromARGB(255, 254, 251, 228),
      width: 1,
      style: BorderStyle.solid,
    ),
  );

  static const UnderlineInputBorder noBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      style: BorderStyle.none,
    ),
  );

  static customBorder({
    Color color = const Color.fromARGB(255, 254, 251, 228),
    double width = 1,
    BorderStyle style = BorderStyle.solid,
  }) {
    return BorderSide(
      color: color,
      width: width,
      style: style,
    );
  }

  static customOutlineInputBorder({
    double borderRadius = 12,
    Color color = const Color.fromARGB(255, 254, 251, 228),
    double width = 1,
    BorderStyle style = BorderStyle.solid,
  }) {

    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      borderSide: BorderSide(
        color: color,
        width: width,
        style: style,
      ),
    );
  }

  static customUnderlineInputBorder({
    Color color = const Color.fromARGB(255, 254, 251, 228),
    double width = 1,
    BorderStyle style = BorderStyle.solid,
  }) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: width,
        style: style,
      ),
    );
  }
}
