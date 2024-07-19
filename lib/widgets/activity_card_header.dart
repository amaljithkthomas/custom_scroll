import 'package:custom_scroll/widgets/avatar.dart';
import 'package:flutter/material.dart';

class ActivityCardHeader extends StatelessWidget {
  const ActivityCardHeader({
    super.key,
    required this.userName,
    required this.dateAndTime,
  });
  final String userName;
  final String dateAndTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
        const SizedBox(
          height: 12,
        ),
        ListTile(
          leading: const Avatar(
            radius: 15,
          ),
          title: Text(userName),
          subtitle: Text(dateAndTime),
        ),
        const SizedBox(
          height: 12,
        ),
       
      ],
    );
  }
}
