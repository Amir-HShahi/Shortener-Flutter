import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utility.dart';
import 'components/app_bar_widget.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(isHomeButtonActive: true),
      backgroundColor: const Color(0xfff8f9fa),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            vertical: scaledHeight(16), horizontal: scaledWidth(16)),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              vertical: scaledHeight(16), horizontal: scaledWidth(16)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Clicks and code scans by device",
                style: GoogleFonts.manrope(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: scaledHeight(16)),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Center(
                    child: SizedBox(
                      height: scaledHeight(220),
                      child: PieChart(
                        PieChartData(sections: [
                          PieChartSectionData(
                              value: 30,
                              showTitle: false,
                              radius: scaledHeight(28),
                              color: const Color(0xff43E5A0)),
                          PieChartSectionData(
                              value: 25,
                              showTitle: false,
                              radius: scaledHeight(28),
                              color: const Color(0xff00A383)),
                          PieChartSectionData(
                              value: 20,
                              showTitle: false,
                              radius: scaledHeight(28),
                              color: const Color(0xff1B48DA)),
                          PieChartSectionData(
                              value: 15,
                              showTitle: false,
                              radius: scaledHeight(28),
                              color: const Color(0xff92C2FE)),
                          PieChartSectionData(
                              value: 10,
                              showTitle: false,
                              radius: scaledHeight(28),
                              color: const Color(0xffF8AC39))
                        ], sectionsSpace: 0),
                        swapAnimationDuration: const Duration(milliseconds: 150),
                        swapAnimationCurve: Curves.linear, // Optional
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
