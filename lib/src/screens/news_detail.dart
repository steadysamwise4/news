import 'dart:async';
import 'package:flutter/material.dart';
import '../blocs/comments_provider.dart';
import '../models/item_model.dart';

class NewsDetail extends StatelessWidget {
  final int itemId;

  const NewsDetail({super.key, required this.itemId});

  @override
  Widget build(context) {
    final bloc = CommentsProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: buildBody(bloc),
    );
  }

  Widget buildBody(CommentsBloc bloc) {
    return StreamBuilder(
      stream: bloc.itemWithComments,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel?>>> snapshot) {
        if (!snapshot.hasData) {
          return const Text('Loading');
        }

        final itemFuture = snapshot.data![itemId];

        return FutureBuilder(
          future: itemFuture,
          builder: (context, AsyncSnapshot<ItemModel?> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return const Text('Loading');
            }

            return buildTitle(itemSnapshot.data);
          },
        );
      },
    );
  }

  Widget buildTitle(ItemModel? item) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      alignment: Alignment.topCenter,
      child: Text(
        item!.title ?? '',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
