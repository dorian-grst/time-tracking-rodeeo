import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TimeGraph extends StatefulWidget {
  const TimeGraph({super.key, required this.timeSpent, required this.timePrevision});

  final int timeSpent;
  final int timePrevision;

  @override
  State<TimeGraph> createState() => _TimeGraphState();
}

class _TimeGraphState extends State<TimeGraph> {
  List<int> data = [];

  @override
  void initState() {
    super.initState();
    data = [
      widget.timeSpent,
      widget.timePrevision,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 40, 30, 40),
          child: BarGraph(
            timePrevision: widget.timePrevision,
            data: data,
          ),
        ),
      ),
    );
    ;
  }
}

class IndividualBar {
  final int x;
  final int y;

  IndividualBar({required this.x, required this.y});
}

class BarData {
  final int timeSpent;
  final int timePrevision;

  BarData({required this.timeSpent, required this.timePrevision});

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: timeSpent),
      IndividualBar(x: 1, y: timePrevision),
    ];
  }
}

class BarGraph extends StatelessWidget {
  const BarGraph({super.key, required this.timePrevision, required this.data});
  final List data;
  final int timePrevision;

  int modulo5Above(int variable) {
    return (variable / 5).ceil() * 5;
  }

  @override
  Widget build(BuildContext context) {
    Widget getBottomTitles(double value, TitleMeta meta) {
      TextStyle style = TextStyle(
        color: context.colorScheme.onSurface,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );
      Widget text;
      switch (value.toInt()) {
        case 0:
          text = Text('Temps passé', style: style);
          break;
        case 1:
          text = Text('Temps estimé', style: style);
          break;
        default:
          text = const Text('');
      }
      return SideTitleWidget(axisSide: meta.axisSide, child: text);
    }

    Widget getLeftTitles(double value, TitleMeta meta) {
      TextStyle style = TextStyle(
        color: context.colorScheme.onSurface,
      );
      String text = '${value.toInt()}h';
      return SideTitleWidget(axisSide: meta.axisSide, child: Text(text, style: style));
    }

    BarData myBarData = BarData(timeSpent: data[0], timePrevision: data[1]);
    myBarData.initializeBarData();

    return SizedBox(
      child: BarChart(
        BarChartData(
            maxY: modulo5Above(timePrevision).toDouble(),
            minY: 0,
            borderData: FlBorderData(
              border: Border(bottom: BorderSide(width: 1, color: context.colorScheme.onSurface)),
            ),
            gridData: FlGridData(
              drawHorizontalLine: true,
              drawVerticalLine: false,
            ),
            titlesData: FlTitlesData(
              show: true,
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true, getTitlesWidget: getBottomTitles),
              ),
              leftTitles: AxisTitles(
                sideTitles:
                    SideTitles(showTitles: true, getTitlesWidget: getLeftTitles, reservedSize: 50),
              ),
            ),
            barGroups: myBarData.barData
                .map((data) => BarChartGroupData(
                      barRods: [
                        BarChartRodData(
                          toY: data.y.toDouble(),
                          color: context.colorScheme.primary,
                          width: 100,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                      ],
                      x: myBarData.barData.indexOf(data),
                    ))
                .toList()),
      ),
    );
  }
}
