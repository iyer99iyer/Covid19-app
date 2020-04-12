import 'package:flutter/material.dart';

const double baseHeight = 700.0;

double screenAwareSize(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.height / baseHeight;
}
