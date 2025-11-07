import 'package:flutter/material.dart';
import '../../widgets/flight_controls_widget.dart';
import '../../widgets/brand_app_bar.dart';
import '../../widgets/operator_hud.dart';
import '../../widgets/camera_controls.dart';

class ActiveDeliveryScreen extends StatelessWidget {
  const ActiveDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const BrandAppBar(title: 'Active Delivery'),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.45,
            child: Stack(
              children: [
                const Positioned.fill(
                  child: Center(child: Text('Camera/Map view placeholder')),
                ),
                Positioned(
                  left: 12,
                  right: 12,
                  top: 12,
                  child: const OperatorHudBar(battery: 84, gps: 92, latencyMs: 85, autoPilot: false),
                ),
                Positioned.fill(
                  child: CameraControlsOverlay(onCapture: () {}),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: FlightControlsWidget(),
            ),
          ),
        ],
      ),
    );
  }
}

