import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'fishpredict.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class SensorData {
  final int id;
  final double temp;
  final double turbidity;
  final double ph;

  SensorData({required this.id, required this.temp, required this.turbidity, required this.ph});

  factory SensorData.fromJson(Map<String, dynamic> json) {
    return SensorData(
      id: json['id'],
      temp: json['temp'],
      turbidity: json['turbidity'],
      ph: json['ph'],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pond Current State',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SensorDataPage(),
    );
  }
}

class SensorDataPage extends StatefulWidget {
  @override
  _SensorDataPageState createState() => _SensorDataPageState();
}

class _SensorDataPageState extends State<SensorDataPage> {
  late Future<SensorData> sensorData;
  bool isListView = true;

  Future<SensorData> fetchSensorData() async {
    final response = await http.get(Uri.parse('http://172.17.113.138:8000/latest_sensor_data/'));
    if (response.statusCode == 200) {
      return SensorData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load sensor data');
    }
  }

  @override
  void initState() {
    super.initState();
    sensorData = fetchSensorData();

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pond Current State'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isListView = !isListView;
              });
            },
            icon: Icon(isListView ? Icons.grid_view : Icons.list),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<SensorData>(
          future: sensorData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return isListView
                  ? SensorDataListView(sensorData: snapshot.data!)
                  : SensorDataGridView(sensorData: snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FishPredictPage()),
          );
        },
        label: Text('Predict Fish'),
        icon: Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class SensorDataListView extends StatelessWidget {
  final SensorData sensorData;

  const SensorDataListView({Key? key, required this.sensorData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        SensorDataCard(title: 'ID', value: '${sensorData.id}'),
        SizedBox(height: 16),
        SensorDataCard(title: 'Temperature', value: '${sensorData.temp}'),
        SizedBox(height: 16),
        SensorDataCard(title: 'Turbidity', value: '${sensorData.turbidity}'),
        SizedBox(height: 16),
        SensorDataCard(title: 'pH', value: '${sensorData.ph}'),
      ],
    );
  }
}

class SensorDataGridView extends StatelessWidget {
  final SensorData sensorData;

  const SensorDataGridView({Key? key, required this.sensorData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(16),
      children: [
        SensorDataCard(title: 'ID', value: '${sensorData.id}'),
        SensorDataCard(title: 'Temperature', value: '${sensorData.temp}'),
        SensorDataCard(title: 'Turbidity', value: '${sensorData.turbidity}'),
        SensorDataCard(title: 'pH', value: '${sensorData.ph}'),
      ],
    );
  }
}

class SensorDataCard extends StatelessWidget {
  final String title;
  final String value;

  const SensorDataCard({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28, // Increased font size
              ),
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 27, // Increased font size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
