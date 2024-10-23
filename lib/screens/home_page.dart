import 'package:actsafe_ui/screens/safety_report.dart';
import 'package:actsafe_ui/screens/transit_details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface, // Match app bar to background
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
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.account_circle),
                          title: const Text('My Account'),
                          onTap: () {
                            Navigator.pop(context);
                            // Add navigation logic for My Account
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.directions_bus),
                          title: const Text('Find Transit'),
                          onTap: () {
                            Navigator.pop(context);
                            // Add navigation logic for Find Transit
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.report),
                          title: const Text('Make a Report'),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SafetyReport()),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
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
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black54,
                ),
                hintText: 'Search for bus or stop address',
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                    width: 1.0,
                  ),
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
                  child: const Text('Sort'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the Safety Report page when tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SafetyReport()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent, // Custom color override
                  ),
                  child: const Text('Make a Report'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Transit Stops Near Me Section
            const Text(
              'Transit Stops Near Me',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Colored block containing transit stops
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.1), // Subtle color difference
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: SizedBox(
                height: 180, // Increased height
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(4, (index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to the bus details page when a card is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TransitDetailsPage(busNumber: '12'),
                          ),
                        );
                      },
                      child: Container(
                        width: 120,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary, // Use theme color
                          borderRadius: BorderRadius.circular(12),
                        ),
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
            ),
            const SizedBox(height: 20),
            // Frequently Used Section
            const Text(
              'Frequently Used',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Colored block containing frequently used transit stops
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.1), // Subtle color difference
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: SizedBox(
                height: 180, // Increased height
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(4, (index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to the bus details page when a card is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TransitDetailsPage(busNumber: '14'),
                          ),
                        );
                      },
                      child: Container(
                        width: 120,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.orange, // Custom color override
                          borderRadius: BorderRadius.circular(12),
                        ),
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
                              '14',
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
            ),
          ],
        ),
      ),
    );
  }
}
