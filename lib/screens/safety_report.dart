import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SafetyReport extends StatelessWidget {
  const SafetyReport({Key? key}) : super(key: key);

  Future<void> sendSafetyReport(BuildContext context, String safetyStatus) async {
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
        Future.delayed(Duration.zero, () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Thank you for your feedback!')),
          );
        });
        print('Record inserted successfully.');
      } else {
        // Handle server error
        print('Failed to insert record: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any errors
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safety Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'How safe are you feeling right now?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            // Safety Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Action for "Very Safe"
                        sendSafetyReport(context, "Green");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(24),
                      ),
                      child: const Icon(Icons.check, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    const Text('Very Safe'),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Action for "Somewhat Safe"
                        sendSafetyReport(context, "Yellow");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(24),
                      ),
                      child: const Icon(Icons.remove, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    const Text('Somewhat Safe'),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Action for "Unsafe"
                        sendSafetyReport(context, "Red");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(24),
                      ),
                      child: const Icon(Icons.close, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    const Text('Unsafe'),
                  ],
                ),
              ],
            ),
            const Spacer(),
            // Contact Buttons
            ElevatedButton(
              onPressed: () {
                // Define action to contact TriMet
              },
              child: const Text('Contact TriMet'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Define action to contact NonEmergency Services
              },
              child: const Text('Contact NonEmergency Services'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
