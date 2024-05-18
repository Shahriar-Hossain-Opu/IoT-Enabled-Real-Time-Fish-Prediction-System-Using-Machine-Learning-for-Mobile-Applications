import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';

class GraphActivity extends StatefulWidget {
  @override
  _GraphActivityState createState() => _GraphActivityState();
}

class _GraphActivityState extends State<GraphActivity> {
  List<double> temperatureData = [];
  List<double> phData = [];
  List<double> turbidityData = [];
  List<String> timestamps = [];

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data initially
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('http://172.17.113.138:8000/realtime_data/'));

      if (response.statusCode == 200) {
        final List<dynamic> dataList = jsonDecode(response.body);
        print('Response data: $dataList'); // Print response body
        if (dataList.isNotEmpty) {
          setState(() {
            temperatureData = dataList.map<double>((data) => data['temp']?.toDouble() ?? 0.0).toList().reversed.toList();
            phData = dataList.map<double>((data) => data['ph']?.toDouble() ?? 0.0).toList().reversed.toList();
            turbidityData = dataList.map<double>((data) => data['turbidity']?.toDouble() ?? 0.0).toList().reversed.toList();
            timestamps = dataList.map<String>((data) => data['timestamp']?.toString() ?? '').toList().reversed.toList();
          });
        } else {
          print('No monitoring data available');
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History of the Data'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: fetchData, // Call fetchData() to update the data when the refresh button is clicked
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding to create free space
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LegendItem(color: Colors.brown, text: 'Temperature'),
                LegendItem(color: Colors.purple, text: 'pH'),
                LegendItem(color: Colors.black, text: 'Turbidity'),
              ],
            ),
            SizedBox(height: 16.0), // Add some space between the legend and the graph
            Expanded(
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: timestamps.length.toDouble() - 1,
                  minY: 0,
                  maxY: 50,
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const style = TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          );
                          Widget text = Text(
                            timestamps.isNotEmpty ? timestamps[value.toInt()] : '',
                            style: style,
                          );
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: text,
                          );
                        },
                        interval: (timestamps.length / 5).toDouble(), // Adjust interval for x-axis labels
                        reservedSize: 30, // Ensure enough space for labels
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const style = TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          );
                          Widget text = Text(value.toString(), style: style);
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: text,
                          );
                        },
                        reservedSize: 70, // Increase reserved space for y-axis labels
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  lineBarsData: [
                    if (temperatureData.isNotEmpty)
                      LineChartBarData(
                        spots: List.generate(temperatureData.length, (index) => FlSpot(index.toDouble(), temperatureData[index])),
                        isCurved: true,
                        color: Colors.brown, // Use 'color' instead of 'colors'
                        barWidth: 2,
                        belowBarData: BarAreaData(show: false),
                      ),
                    if (phData.isNotEmpty)
                      LineChartBarData(
                        spots: List.generate(phData.length, (index) => FlSpot(index.toDouble(), phData[index])),
                        isCurved: true,
                        color: Colors.purple, // Use 'color' instead of 'colors'
                        barWidth: 2,
                        belowBarData: BarAreaData(show: false),
                      ),
                    if (turbidityData.isNotEmpty)
                      LineChartBarData(
                        spots: List.generate(turbidityData.length, (index) => FlSpot(index.toDouble(), turbidityData[index])),
                        isCurved: true,
                        color: Colors.black, // Use 'color' instead of 'colors'
                        barWidth: 2,
                        belowBarData: BarAreaData(show: false),
                      ),
                  ],
                  lineTouchData: LineTouchData(
                    enabled: true,
                    touchTooltipData: LineTouchTooltipData(

                     // tooltipBgColor: Colors.blueAccent.withOpacity(0.8), // Ensure this is the correct parameter name
                      getTooltipItems: (List<LineBarSpot> touchedSpots) {
                        return touchedSpots.map((LineBarSpot touchedSpot) {
                          final flSpot = touchedSpot;
                          if (flSpot.x != null && flSpot.y != null) {
                            return LineTooltipItem(
                              'Timestamp: ${timestamps[flSpot.x.toInt()]}, Y: ${flSpot.y}',
                              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            );
                          }
                          return null;
                        }).toList();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  LegendItem({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: color,
        ),
        SizedBox(width: 8),
        Text(text, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
