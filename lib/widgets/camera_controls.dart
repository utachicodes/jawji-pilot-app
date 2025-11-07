import 'package:flutter/material.dart';
import 'glass.dart';
import 'status_chip.dart';

class CameraControlsOverlay extends StatefulWidget {
  final VoidCallback onCapture;
  const CameraControlsOverlay({super.key, required this.onCapture});

  @override
  State<CameraControlsOverlay> createState() => _CameraControlsOverlayState();
}

class _CameraControlsOverlayState extends State<CameraControlsOverlay> {
  bool recording = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Center reticle
        Center(
          child: Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withOpacity(0.35), width: 2),
            ),
          ),
        ),
        // Bottom chips
        Positioned(
          bottom: 16,
          left: 16,
          child: const StatusChip(icon: Icons.battery_full, label: '65%'),
        ),
        Positioned(
          bottom: 16,
          left: 110,
          child: const StatusChip(icon: Icons.straighten, label: '120m'),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: const StatusChip(icon: Icons.speed, label: '5km/h'),
        ),
        // Capture button
        Positioned(
          bottom: 36,
          left: 0,
          right: 0,
          child: Center(
            child: GestureDetector(
              onTap: () {
                setState(() => recording = !recording);
                widget.onCapture();
              },
              child: Container(
                width: 68,
                height: 68,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    width: recording ? 18 : 26,
                    height: recording ? 18 : 26,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(recording ? 4 : 999),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        // Top-left back glass button (placeholder)
        const Positioned(
          top: 12,
          left: 12,
          child: GlassCard(
            padding: EdgeInsets.all(8),
            glassColor: Color(0x80FFFFFF),
            child: Icon(Icons.chevron_left, color: Colors.black87),
          ),
        ),
        // Top-right menu glass button
        const Positioned(
          top: 12,
          right: 12,
          child: GlassCard(
            padding: EdgeInsets.all(8),
            glassColor: Color(0x80FFFFFF),
            child: Icon(Icons.more_vert, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}


