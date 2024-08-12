import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';

class Text24Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const Text24Normal(
      {super.key,
      required this.text,
      this.color = AppColors.primaryText,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 24, color: color, fontWeight: fontWeight),
    );
  }
}

class Text16Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight weight;
  const Text16Normal(
      {super.key,
      required this.text,
      this.color = AppColors.primarySecondaryElementText,
      this.weight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        color: color,
        fontWeight: weight,
      ),
    );
  }
}

class Text14Normal extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign? alignment;
  final FontWeight weight;
  const Text14Normal(
      {super.key,
      required this.text,
      this.color = AppColors.primaryThreeElementText,
      this.alignment,
      this.weight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment ?? TextAlign.center,
      style: TextStyle(
        fontSize: 14,
        color: color,
        fontWeight: weight,
      ),
    );
  }
}

class Text10Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight weight;
  const Text10Normal(
      {super.key,
      required this.text,
      this.color = AppColors.primaryThreeElementText,
      this.weight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 10,
        color: color,
        fontWeight: weight,
      ),
    );
  }
}
