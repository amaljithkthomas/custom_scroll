import 'package:flutter/material.dart';

class ActivityCardBody extends StatelessWidget {
  const ActivityCardBody({
    super.key,
    required this.distance,
    required this.pace,
    required this.time,
    this.description,
  });
  final String distance;
  final String pace;
  final String time;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null)
          Text(
            description!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text('Distance'),
                  Text(distance),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Text('Pace'),
                  Text(pace),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Text('Time'),
                  Text(time),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
