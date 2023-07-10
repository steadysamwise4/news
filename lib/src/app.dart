import 'package:flutter/material.dart';
import 'screens/news_list.dart';
import 'blocs/stories_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(context) {
    return StoriesProvider(
      key: key,
      child: MaterialApp(
        title: 'News!',
        home: NewsList(),
      ),
    );
  }
}
