import 'package:flutter/material.dart';
import 'package:e_scooter/core/e_scooter_export.dart';

class EScooterAppbarTitle extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? margin;
  final Function? onTap;

  EScooterAppbarTitle({Key? key, required this.text, this.margin, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ));
  }
}
