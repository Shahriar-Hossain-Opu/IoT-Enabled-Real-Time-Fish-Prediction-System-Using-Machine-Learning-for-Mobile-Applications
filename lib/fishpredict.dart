import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FishPredictPage extends StatefulWidget {
  @override
  _FishPredictPageState createState() => _FishPredictPageState();
}

class _FishPredictPageState extends State<FishPredictPage> {
  String predictedFish = 'Loading...';

  // Function to fetch latest sensor data from the API
  Future<Map<String, dynamic>> fetchLatestSensorData() async {
    try {
      // Make GET request to the latest_sensor_data endpoint
      var response = await http.get(
        Uri.parse('http://172.17.113.138:8000/latest_sensor_data'), // Replace with your FastAPI server IP
      );

      // Parse the response JSON
      var data = jsonDecode(response.body);

      return data;
    } catch (e) {
      print('Error fetching latest sensor data: $e');
      return {};
    }
  }

  // Function to fetch fish prediction from the API using latest sensor data
  Future<void> fetchFishPrediction() async {
    try {
      var latestSensorData = await fetchLatestSensorData();

      // Make POST request to the predict endpoint with latest sensor data
      var response = await http.post(
        Uri.parse('http://172.17.113.138:8000/predict'), // Replace with your FastAPI server IP
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, double>{
          'pH': latestSensorData['ph'],
          'temperature': latestSensorData['temp'],
          'turbidity': latestSensorData['turbidity'],
        }),
      );

      // Parse the response JSON
      var predictionData = jsonDecode(response.body);

      // Update the state with the predicted fish
      setState(() {
        predictedFish = predictionData['predicted_fish'];
      });
    } catch (e) {
      print('Error fetching fish prediction: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchFishPrediction(); // Fetch fish prediction when the widget initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fish Prediction'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background emoji
          Image.asset(
            'assets/fish_animation.gif',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          // Content
          Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildFishPredictionBox('Predicted Fish', predictedFish),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate back to the login page
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text('Exit'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFishPredictionBox(String title, String fishName) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white.withOpacity(0.8), // Adjust opacity as needed
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            fishName,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
