import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chart2 extends StatefulWidget {
  @override
  _Chart2State createState() => _Chart2State();
}

class _Chart2State extends State<Chart2> {
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
               Text("Mean DTR Trends [1951 -2010]",
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
        ),],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      backgroundColor: Color(0xffF4EEFF),
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
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
              return 'DEL';
              case 3:
                return 'KAR';
              case 5:
                return 'MAH';
              case 7:
                return 'TN';
              case 9:
                return 'UP';
            }
            return '';
          },
          margin: 3,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 8,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'Very Low';
              case 2:
                return 'Low';
              case 3:
                return 'No Trend';
              case 4:
                return 'High';
              case 5:
                return 'Very High';
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
            FlSpot(0, 0),
            FlSpot(1, 1),
            FlSpot(3, 5),
            FlSpot(5, 4),
            FlSpot(7, 4),
            FlSpot(9, 1),
            FlSpot(11, 0),
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