import 'package:flutter/material.dart';

class FullScreenNoDataFoundWidget extends StatelessWidget {
  const FullScreenNoDataFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: const Center(
        child: Text('No data found'),
      ),
    );
  }
}