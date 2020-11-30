import 'package:flutter/material.dart';

class TimerCountPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 60),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 64,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
