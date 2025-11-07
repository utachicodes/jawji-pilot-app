import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'request_form_screen.dart';
import 'live_tracking_screen.dart';

class ClientShell extends StatefulWidget {
  const ClientShell({super.key});

  @override
  State<ClientShell> createState() => _ClientShellState();
}

class _ClientShellState extends State<ClientShell> {
  int index = 0;
  final pages = const [ClientHomeScreen(), LiveTrackingScreen(), Placeholder()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: index, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.place_outlined), label: 'Tracking'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
      floatingActionButton: index == 0
          ? FloatingActionButton.extended(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DeliveryRequestFormScreen())),
              label: const Text('Request Delivery'),
              icon: const Icon(Icons.add),
            )
          : null,
    );
  }
}

