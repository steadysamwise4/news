import 'package:flutter/material.dart';

class NewsDetail extends StatelessWidget {
  final int itemId;

  const NewsDetail({super.key, required this.itemId});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Text('$itemId'),
    );
  }
}
