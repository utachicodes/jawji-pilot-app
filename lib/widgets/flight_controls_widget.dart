import 'package:flutter/material.dart';
import 'virtual_joystick.dart';

class FlightControlsWidget extends StatefulWidget {
  const FlightControlsWidget({super.key});

  @override
  State<FlightControlsWidget> createState() => _FlightControlsWidgetState();
}

class _FlightControlsWidgetState extends State<FlightControlsWidget> {
  double throttle = 0, yaw = 0, pitch = 0, roll = 0;
  bool autoPilot = false;

  Color _latencyColor(int ms) {
    if (ms < 100) return Colors.greenAccent; // good
    if (ms < 200) return Colors.orangeAccent; // warning
    return Colors.redAccent; // poor
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final latencyMs = 85; // mock
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  const Text('Latency', style: TextStyle(color: Colors.white70)),
                  const SizedBox(width: 8),
                  Icon(Icons.circle, color: _latencyColor(latencyMs), size: 12),
                  const SizedBox(width: 6),
                  Text('${latencyMs}ms', style: const TextStyle(fontWeight: FontWeight.bold)),
                ]),
                Row(children: [
                  const Text('Auto‑pilot', style: TextStyle(color: Colors.white70)),
                  Switch(value: autoPilot, onChanged: (v) => setState(() => autoPilot = v)),
                ]),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Altitude / Yaw', style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 8),
                  VirtualJoystick(
                    disabled: autoPilot,
                    onChanged: (o) => setState(() {
                      throttle = o.dy;
                      yaw = o.dx;
                    }),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Pitch / Roll', style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 8),
                  VirtualJoystick(
                    disabled: autoPilot,
                    onChanged: (o) => setState(() {
                      pitch = o.dy;
                      roll = o.dx;
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(children: [
          Expanded(child: OutlinedButton(onPressed: () {}, child: const Text('Return to Home'))),
          const SizedBox(width: 8),
          Expanded(child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.error), onPressed: () {}, child: const Text('Emergency Land'))),
          const SizedBox(width: 8),
          Expanded(child: OutlinedButton(onPressed: () {}, child: const Text('Pause'))),
        ]),
      ],
    );
  }
}

