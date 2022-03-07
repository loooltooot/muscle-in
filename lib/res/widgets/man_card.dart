import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ManCard extends StatelessWidget {
  final String title;

  const ManCard(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: title));
        _showSnackBar(context);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xFF4C4C4C)
        ),
        child: Text(title),
      ),
    );
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('скопировано'),
        duration: Duration(seconds: 1),
      )
    );
  }
}
