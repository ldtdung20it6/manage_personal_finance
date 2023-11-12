import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'analytics_controller.dart';

class AnalyticsPage extends StatelessWidget {
  final AnalyticsController analyticsController =
      Get.put(AnalyticsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
      ),
      body: Obx(
        () {
          if (analyticsController.financeData.isEmpty) {
            return Center(
              child: Text('No finance data available.'),
            );
          } else {
            return Center(
              child: PieChart(
                PieChartData(
                  sections: analyticsController.financeData.map(
                    (finance) {
                      final price = finance['price'];
                      final parsedPrice =
                          double.tryParse(price.toString()) ?? 0.0;

                      return PieChartSectionData(
                        color: getRandomColor(),
                        value: parsedPrice,
                        title: '${finance['name']} ($price)',
                        radius: 80,
                        titleStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      );
                    },
                  ).toList(),
                  sectionsSpace: 0,
                  centerSpaceRadius: 60,
                  borderData: FlBorderData(show: false),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Color getRandomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
}
