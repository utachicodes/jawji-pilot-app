import 'package:flutter/material.dart';
import '../../widgets/brand_app_bar.dart';
import '../../widgets/gradient_bg.dart';

class DeliveryRequestFormScreen extends StatefulWidget {
  const DeliveryRequestFormScreen({super.key});

  @override
  State<DeliveryRequestFormScreen> createState() => _DeliveryRequestFormScreenState();
}

class _DeliveryRequestFormScreenState extends State<DeliveryRequestFormScreen> {
  final pickupCtrl = TextEditingController();
  final dropoffCtrl = TextEditingController();
  final weightCtrl = TextEditingController();
  bool fragile = false;
  double estimate = 0;

  void _recalc() {
    final w = double.tryParse(weightCtrl.text) ?? 0;
    setState(() => estimate = (10 + w * 2 + (fragile ? 5 : 0)).toDouble());
  }

  @override
  void initState() {
    super.initState();
    weightCtrl.addListener(_recalc);
  }

  @override
  void dispose() {
    weightCtrl.removeListener(_recalc);
    pickupCtrl.dispose();
    dropoffCtrl.dispose();
    weightCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BrandAppBar(title: 'Request Delivery'),
      body: GradientBg(
        child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: pickupCtrl, decoration: const InputDecoration(hintText: 'Pickup location')),
            const SizedBox(height: 12),
            TextField(controller: dropoffCtrl, decoration: const InputDecoration(hintText: 'Dropoff location')),
            const SizedBox(height: 12),
            TextField(controller: weightCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(hintText: 'Weight (kg)')),
            const SizedBox(height: 12),
            SwitchListTile(
              value: fragile,
              onChanged: (v) {
                setState(() => fragile = v);
                _recalc();
              },
              title: const Text('Fragile'),
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Estimated Price'),
                    Text('4${estimate.toStringAsFixed(2)}'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Request Operator')),
          ],
        ),
      ),
      ),
    );
  }
}

