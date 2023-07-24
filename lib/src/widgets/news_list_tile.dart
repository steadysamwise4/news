import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/stories_provider.dart';
import 'loading_container.dart';

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
          return const LoadingContainer();
        }

        return FutureBuilder(
          future: snapshot.data![itemId],
          builder: (context, itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return const LoadingContainer();
            }

            return buildTile(itemSnapshot.data);
          },
        );
      },
    );
  }

  Widget buildTile(ItemModel? item) {
    return Column(
      children: [
        ListTile(
          title: Text(item!.title ?? ''),
          subtitle: Text('${item.score} points'),
          trailing: Column(
            children: [
              const Icon(Icons.comment),
              Text('${item.descendants}'),
            ],
          ),
        ),
        const Divider(height: 8.0),
      ],
    );
  }
}
