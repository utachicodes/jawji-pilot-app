import 'dart:math' as math;
import 'package:flutter/material.dart';

class VirtualJoystick extends StatefulWidget {
  final ValueChanged<Offset> onChanged; // x,y in [-1,1]
  final double size;
  final bool disabled;

  const VirtualJoystick({super.key, required this.onChanged, this.size = 140, this.disabled = false});

  @override
  State<VirtualJoystick> createState() => _VirtualJoystickState();
}

class _VirtualJoystickState extends State<VirtualJoystick> {
  Offset knob = Offset.zero;

  double get radius => (widget.size / 2) - 24; // padding for knob

  void _update(Offset local) {
    final center = Offset(widget.size / 2, widget.size / 2);
    final delta = local - center;
    final distance = delta.distance;
    Offset clamped;
    if (distance > radius) {
      final angle = math.atan2(delta.dy, delta.dx);
      clamped = Offset(math.cos(angle) * radius, math.sin(angle) * radius);
    } else {
      clamped = delta;
    }
    setState(() => knob = clamped);
    final x = (clamped.dx / radius).clamp(-1.0, 1.0);
    final y = (clamped.dy / radius).clamp(-1.0, 1.0);
    widget.onChanged(Offset(x, -y)); // invert Y for intuitive control
  }

  void _reset() {
    setState(() => knob = Offset.zero);
    widget.onChanged(Offset.zero);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IgnorePointer(
      ignoring: widget.disabled,
      child: GestureDetector(
        onPanDown: (d) => _update(d.localPosition),
        onPanUpdate: (d) => _update(d.localPosition),
        onPanEnd: (_) => _reset(),
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            shape: BoxShape.circle,
            border: Border.all(color: theme.colorScheme.primary.withOpacity(0.25), width: 2),
          ),
          child: Center(
            child: Transform.translate(
              offset: knob,
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 10, offset: const Offset(0, 6))],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

