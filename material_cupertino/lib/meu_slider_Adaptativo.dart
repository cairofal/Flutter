import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MeuSliderAdaptativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Slider(
        value: 10,
        onChanged: (valor) {},
        min: 0,
        max: 20,
      );
    } else {
      return CupertinoSlider(
        value: 10,
        onChanged: (valor) {},
        min: 0,
        max: 20,
      );
    }
  }
}
