import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class Chart1 extends StatefulWidget {
  const Chart1({Key? key}) : super(key: key);

  @override
  _Chart1State createState() => _Chart1State();
}

class _Chart1State extends State<Chart1> {
  List<Color> gradientColors = [
    const Color(0xff1E2558),
    const Color(0xff1E2558),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Text(
              "Air Quality Index [Nov 2020]",
              style: GoogleFonts.openSans(
                  color: const Color(0xff1E2558),
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            AspectRatio(
              aspectRatio: 1.70,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 18.0, left: 12.0, top: 24, bottom: 12),
                child: LineChart(
                  mainData(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      backgroundColor: const Color(0xffF4EEFF),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff1E2558),
            strokeWidth: 0.0,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff1E2558),
            strokeWidth: 0.0,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'DEL';
              case 3:
                return 'BLR';
              case 5:
                return 'BOM';
              case 7:
                return 'HYD';
              case 9:
                return 'KOL';
            }
            return '';
          },
          margin: 3,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '100';
              case 3:
                return '150';
              case 5:
                return '200';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 0.5)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            const FlSpot(0, 0),
            const FlSpot(1, 5),
            const FlSpot(3, 0.3),
            const FlSpot(5, 2.5),
            const FlSpot(7, 0.7),
            const FlSpot(9, 4),
            const FlSpot(11, 0),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 0.5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
