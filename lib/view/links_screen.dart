import 'package:expandable_text/expandable_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener/view_model/link_view_model.dart';
import 'package:flutter/services.dart';


import 'components/my_component.dart';

class LinksScreen extends StatelessWidget {
  const LinksScreen({super.key, required this.size, required this.textTheme,});

  final Size size;
  final TextTheme textTheme;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: SafeArea(child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(decoration: BoxDecoration(
          color: const Color.fromARGB(240, 246, 246, 249),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 10,)
          ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.fromLTRB(20, 16, 0, 16),
              child: Text("Links", style: textTheme.titleLarge,),),
            const ShortenerDivider(),
            LinkList(size: size, textTheme: textTheme),
          ],),),),),);
  }
}

class LinkList extends StatelessWidget {
  const LinkList({super.key, required this.size, required this.textTheme,});

  final Size size;
  final TextTheme textTheme;


  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<LinkViewModel>();
    return ConstrainedBox(constraints: BoxConstraints(
        maxHeight: size.height / 1.4, minHeight: size.height / 9.63),
      child: viewModel.links.isEmpty ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("empty", style: textTheme.headlineSmall,),
        ],) : ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: viewModel.links.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return GestureDetector(onLongPress: () async {
            Clipboard.setData(ClipboardData(
                text: "http://195.177.255.95:616/${viewModel.links[index]
                    .id}"));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  "Shortened link copied to clipboard :)",
                  style: textTheme.displayMedium,
                )));
          },
            child: Column(children: [
              Padding(padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: size.width / 1.57,
                      child: Column(crossAxisAlignment: CrossAxisAlignment
                          .start, children: [
                        Text(viewModel.links[index].name,
                          style: textTheme.labelMedium,),
                        const SizedBox(height: 8,),
                        ExpandableText(viewModel.links[index].address,
                          style: textTheme.bodySmall,
                          expandText: "",
                          collapseText: "less",
                          maxLines: 1,)
                      ],),),
                    SizedBox(width: size.width / 6.23, child: Column(children: [
                      SizedBox(width: 64,
                        height: 24,
                        child: LineChart(LineChartData(
                          gridData: const FlGridData(show: false),
                          titlesData: const FlTitlesData(show: false),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                const FlSpot(0, 1),
                                const FlSpot(1, 10),
                                const FlSpot(2, 2),
                                const FlSpot(3, 4),
                                const FlSpot(4, 1),
                              ],
                              isCurved: true,
                              color: const Color.fromARGB(154, 67, 229, 170),
                              dotData: const FlDotData(show: false),
                              belowBarData: BarAreaData(show: true,
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromARGB(100, 67, 229, 170),
                                      Color.fromARGB(0, 67, 229, 170),
                                    ],)),),
                          ],),),),
                      const SizedBox(height: 8,),
                      Text("53 clicks", style: textTheme.bodyMedium,),
                    ],),),
                  ],),),
              if (index !=
                  viewModel.links.length - 1)(const ShortenerDivider()),
            ],),);
        },),);
  }
}
