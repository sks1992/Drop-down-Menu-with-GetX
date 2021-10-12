import 'package:eskool/core/models/chart_data_model.dart';
import 'package:eskool/ui/shared/formats.dart';
import 'package:eskool/ui/widgets/description.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PieChartCard extends StatelessWidget {
  final double width;
  final double height;
  final List<ChartData> chartData;

  PieChartCard({
    required this.chartData,
    this.width = 150,
    this.height = 150,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          width: width,
          height: height,
          child: PieChart(
            PieChartData(
                pieTouchData: PieTouchData(enabled: false),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 30,
                sections: showingSections()),
          ),
        ),
        //legend
        ...List.generate(chartData.length, (i) {
          return _infoTile(
            chartData[i].color,
            chartData[i].label,
            chartData[i].value,
          );
        }),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(chartData.length, (i) {
      final double radius = 40;
      return PieChartSectionData(
        color: chartData[i].color,
        value: chartData[i].value,
        title: '',
        radius: radius,
      );
    });
  }

  Widget _infoTile(Color color, String label, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                    ),
                    width: 12,
                    height: 12,
                    child: const SizedBox.shrink(),
                  ),
                  const SizedBox(width: 4),
                  DescriptionText(label, fontSize: 12),
                ],
              ),
              DescriptionText(getFormattedValue(value), fontSize: 12),
            ],
          ),
        ],
      ),
    );
  }
}
