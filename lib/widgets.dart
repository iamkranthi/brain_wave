import 'package:brain_wave/helpers.dart';
import 'package:flutter/material.dart';

class Brainheading extends StatelessWidget {
  final String brainText;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? fontColor;

  const Brainheading(
      {super.key,
      required this.brainText,
      this.fontWeight,
      this.fontSize,
      this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      brainText,
      style: TextStyle(
          fontWeight: fontWeight, fontSize: fontSize, color: fontColor),
    );
  }
}

class BrainCard extends StatelessWidget {
  final Color color;
  final String text;
  final String heading;
  const BrainCard({super.key, required this.color, required this.text, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      elevation: 10,
      child: Container(
        width: double.infinity,
        
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Brainheading(
              brainText: heading,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            verticalSpacer(5),
            Brainheading(
              brainText: text,
              fontSize: 18,
            )
          ],
        ),
      ),
    );
  }
}
