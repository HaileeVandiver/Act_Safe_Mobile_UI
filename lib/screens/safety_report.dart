import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SafetyReport extends StatelessWidget {
  const SafetyReport({Key? key}) : super(key: key);

  Future<void> sendSafetyReport(String safetyStatus) async {
    const String apiUrl = "https://8dt3ectcia.execute-api.us-west-2.amazonaws.com/Test/ActSafeDbManager";

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'userId': 'sampleUserId', // Replace with dynamic user ID if available
          'transitId': null,
          'stopId': null,
          'safetyStatus': safetyStatus,
        }),
      );

      if (response.statusCode == 200) {
        // Handle successful response
        print('Record inserted successfully.');
      } else {
        // Handle server error
        print('Failed to insert record: \${response.statusCode}');
      }
    } catch (e) {
      // Handle any errors
      print('Error: \$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Safety Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'How safe are you feeling right now?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            // Safety Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Action for "Very Safe"
                        sendSafetyReport("Green");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(24),
                      ),
                      child: Icon(Icons.check, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text('Very Safe'),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Action for "Somewhat Safe"
                        sendSafetyReport("yellow");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(24),
                      ),
                      child: Icon(Icons.remove, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text('Somewhat Safe'),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Action for "Unsafe"
                        sendSafetyReport("red");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(24),
                      ),
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text('Unsafe'),
                  ],
                ),
              ],
            ),
            Spacer(),
            // Contact Buttons
            ElevatedButton(
              onPressed: () {
                // Define action to contact TriMet
              },
              child: Text('Contact TriMet'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Define action to contact NonEmergency Services
              },
              child: Text('Contact NonEmergency Services'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
