import 'package:flutter/material.dart';
import '../../widgets/brand_app_bar.dart';

class RequestListScreen extends StatelessWidget {
  const RequestListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BrandAppBar(title: 'Available Requests'),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (_, i) => Card(
          child: ListTile(
            title: Text('Request #${i + 1}'),
            subtitle: const Text('Pickup: 123 Main • Dropoff: 456 Oak • ~30 min'),
            trailing: ElevatedButton(onPressed: () {}, child: const Text('Accept')),
          ),
        ),
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemCount: 6,
      ),
    );
  }
}

