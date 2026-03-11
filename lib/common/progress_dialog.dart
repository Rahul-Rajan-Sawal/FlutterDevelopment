import 'package:flutter/material.dart';

class ProgressDialogWidget extends StatelessWidget {
  final String message;

  const ProgressDialogWidget({Key? key, required this.message})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(strokeWidth: 3),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Text(message, style: const TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}
