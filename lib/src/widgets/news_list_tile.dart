import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/stories_provider.dart';

class NewsListTile extends StatelessWidget {
  final int itemId;

  const NewsListTile({super.key, required this.itemId});

  @override
  Widget build(context) {
    final bloc = StoriesProvider.of(context);

    return StreamBuilder(
      stream: bloc.items,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Text('Stream still loading');
        }

        return FutureBuilder(
          future: snapshot.data![itemId],
          builder: (context, itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return Text('Still loading item $itemId');
            }

            return Text(itemSnapshot.data!.title ?? '');
          },
        );
      },
    );
  }
}
