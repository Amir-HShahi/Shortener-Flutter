import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utility.dart';
import 'components/app_bar_widget.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  PieChartSectionData stylePieChartSectionData(double value, Color color) {
    return PieChartSectionData(
        value: value, showTitle: false, radius: scaledHeight(28), color: color);
  }

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
            mainAxisSize: MainAxisSize.min,
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
                          stylePieChartSectionData(30, const Color(0xff43E5A0)),
                          stylePieChartSectionData(25, const Color(0xff00A383)),
                          stylePieChartSectionData(20, const Color(0xff1B48DA)),
                          stylePieChartSectionData(15, const Color(0xff92C2FE)),
                          stylePieChartSectionData(10, const Color(0xffF8AC39))
                        ], sectionsSpace: 0),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text("459",
                          style: GoogleFonts.manrope(
                              fontSize: scaledHeight(24),
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff181820))),
                      Text("clicks and scans",
                          style: GoogleFonts.manrope(
                              fontSize: scaledHeight(12),
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff686C8F)))
                    ],
                  )
                ],
              ),
              SizedBox(height: scaledHeight(16)),
              const _DeviceListTile(
                  leadingColor: Color(0xff43E5A0),
                  deviceName: "Desktop",
                  clickShare: 30),
              SizedBox(height: scaledHeight(8)),
              const _DeviceListTile(
                  leadingColor: Color(0xff00A383),
                  deviceName: "Mobile",
                  clickShare: 25),
              SizedBox(height: scaledHeight(8)),
              const _DeviceListTile(
                  leadingColor: Color(0xff397CF8),
                  deviceName: "Tablet",
                  clickShare: 20),
              SizedBox(height: scaledHeight(8)),
              const _DeviceListTile(
                  leadingColor: Color(0xff92C2FE),
                  deviceName: "E-Reader",
                  clickShare: 15),
              SizedBox(height: scaledHeight(8)),
              const _DeviceListTile(
                  leadingColor: Color(0xffF8AC39),
                  deviceName: "Other",
                  clickShare: 10)
            ],
          ),
        ),
      )),
    );
  }
}

class _DeviceListTile extends StatelessWidget {
  final Color leadingColor;
  final String deviceName;
  final double clickShare;
  const _DeviceListTile(
      {required this.leadingColor,
      required this.deviceName,
      required this.clickShare});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: scaledHeight(8),
          width: scaledHeight(8),
          decoration: BoxDecoration(
            color: leadingColor,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: scaledWidth(8)),
        Text(deviceName,
            style: GoogleFonts.manrope(
                fontSize: scaledHeight(14), color: const Color(0xff686C8F))),
        const Spacer(),
        Text("${clickShare.toInt()}%",
            style: GoogleFonts.manrope(
                fontSize: scaledHeight(14), color: const Color(0xff686C8F)))
      ],
    );
  }
}
