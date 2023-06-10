import 'package:flutter/material.dart';

import '../size_config.dart';

class NotCorrectNumDialog extends StatelessWidget {
  const NotCorrectNumDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: SizeConfig.height * 0.2,
        width: SizeConfig.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'The Phone number is not correct!',
              style: TextStyle(
                fontSize: SizeConfig.height * 0.01 * 2.3,
              ),
            ),
            Text(
              'Try to correct!',
              style: TextStyle(fontSize: SizeConfig.height * 0.01 * 2.5),
            )
          ],
        ),
      ),
    );
  }
}
