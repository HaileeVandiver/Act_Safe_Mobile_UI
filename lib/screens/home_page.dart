import 'package:actsafe_ui/screens/safety_report.dart';
import 'package:actsafe_ui/screens/transit_details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100], // Light blue background
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue[100], // Match app bar to background
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.black,
            ),
            const SizedBox(width: 8),
            const Text(
              '123 current location',
              style: TextStyle(color: Colors.black),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // Search Bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Hinted search text',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Sort and Make Report Buttons
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Define Sort button action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Sort'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the Safety Report page when tapped 
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) =>  const SafetyReport(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  child: const Text('Make a Report'),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Transit Stops Near Me Section
            const Text(
              'Transit Stops Near Me',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Dummy Cards for Transit Stops
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: List.generate(4, (index) {
                  return GestureDetector(
                    onTap: () {
                      //Navigate to the bus details page when a card is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TransitDetailsPage(busNumber: '12'),
                        ),
                      );
                    },
                   child: Container(
                    color: Colors.blue,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.directions_bus,
                          size: 50,
                          color: Colors.white,
                        ),
                        SizedBox(height: 8),
                        Text(
                          '12',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                   ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
