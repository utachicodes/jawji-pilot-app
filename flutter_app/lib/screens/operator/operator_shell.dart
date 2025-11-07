import 'package:flutter/material.dart';
import 'connected_screen.dart';
import 'request_list_screen.dart';
import 'active_delivery_screen.dart';

class OperatorShell extends StatefulWidget {
  const OperatorShell({super.key});

  @override
  State<OperatorShell> createState() => _OperatorShellState();
}

class _OperatorShellState extends State<OperatorShell> {
  int index = 0;
  final pages = const [OperatorConnectedScreen(), RequestListScreen(), ActiveDeliveryScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: index, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.connected_tv_outlined), label: 'Connected'),
          NavigationDestination(icon: Icon(Icons.assignment_outlined), label: 'Requests'),
          NavigationDestination(icon: Icon(Icons.tune_outlined), label: 'Active'),
        ],
      ),
    );
  }
}

