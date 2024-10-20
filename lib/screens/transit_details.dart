import 'package:flutter/material.dart';

class TransitDetailsPage extends StatelessWidget {
  final String busNumber;

  const TransitDetailsPage({super.key, required this.busNumber});

  @override
  Widget build(BuildContext context) {
    // Hard-coded stop data for now
    final List<Map<String, dynamic>> stops = [
      {'name': 'Stop 1', 'status': Colors.green},
      {'name': 'Stop 2', 'status': Colors.yellow},
      {'name': 'Stop 3', 'status': Colors.red},
      {'name': 'Stop 4', 'status': Colors.green},
      {'name': 'Stop 5', 'status': Colors.yellow},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Bus $busNumber Details'),
      ),
      body: ListView.builder(
        itemCount: stops.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: stops[index]['status'],
            ),
            title: Text(stops[index]['name']),
          );
        },
      ),
    );
  }
}
