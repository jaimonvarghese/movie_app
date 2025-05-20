
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.white24)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text('or', style: TextStyle(color: Colors.white60)),
        ),
        Expanded(child: Divider(color: Colors.white24)),
      ],
    );
  }
}
