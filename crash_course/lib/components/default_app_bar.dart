import 'package:crash_course/styles.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends AppBar {
  @override
  // TODO: implement title
  Widget get title =>
      Text('Tourism & Co.'.toUpperCase(), style: Styles.navBarStyle);

  @override
    // TODO: implement iconTheme
    IconThemeData get iconTheme => IconThemeData(color: Colors.black);

  @override
  // TODO: implement backgroundColor
  Color get backgroundColor => Colors.white;

  @override
  // TODO: implement centerTitle
  bool get centerTitle => true;

  @override
  // TODO: implement elevation
  double get elevation => 0.5;
}
