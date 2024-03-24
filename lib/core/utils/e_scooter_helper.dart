import 'package:flutter/material.dart';
import '../e_scooter_export.dart';

class EScooterHelper{

  static Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lbl_hello,
          style: theme.textTheme.headlineSmall,
        ),
        SizedBox(height: 9.0),
        Text(
          lbl_name,
          style: theme.textTheme.headlineSmall,
        ),
      ],
    );
  }

  static Widget desc(String desc, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white70,
          size: 20,
        ),
        Text(
          '   ' + desc,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  static Widget specs(String value, String title, String desc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(value, style: theme.textTheme.labelLarge),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(title, style: theme.textTheme.labelMedium),
            ),
          ],
        ),
        Text(desc, style: theme.textTheme.labelSmall),
      ],
    );
  }

  static Widget reserve11(String title, String del, String purch) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.displayLarge),
            SizedBox(width: 8,),
            SizedBox(
              width: 1,
              height: 40,
              child: Container(
                decoration: BoxDecoration(color: Colors.white38, borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(width: 8,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Starting from', style: theme.textTheme.displaySmall),
                SizedBox(height: 5,),
                Text('₹ 99,999', style: theme.textTheme.displayMedium),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            width: 120,
            height: 30,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff16AB51), Color(0xff60BE85)],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Reserve",
                    style: EScooterTextStyles.displaySmall1
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  static Widget charger11() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text('26 Km', style: EScooterTextStyles.displaySmall1),
            SizedBox(height: 5,),
            Text('30 mins', style: theme.textTheme.displaySmall),
          ],
        ),
        SizedBox(width: 8,),
        SizedBox(
          width: 1,
          height: 40,
          child: Container(
            decoration: BoxDecoration(color: Colors.white38, borderRadius: BorderRadius.circular(8)),
          ),
        ),
        SizedBox(width: 8,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('IHR 09MIN', style:  EScooterTextStyles.displaySmall1),
            SizedBox(height: 5,),
            Text('Charge Estimate', style: theme.textTheme.displaySmall),
          ],
        ),
      ],
    );
  }
}