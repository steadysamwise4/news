import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';
import '../widgets/news_list_tile.dart';
import '../widgets/refresh.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(context) {
    final bloc = StoriesProvider.of(context);
    // bad - temporary!!!
    bloc.fetchTopIds();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top News'),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        return Refresh(
          child: ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              bloc.fetchItem(snapshot.data![index]);
              return NewsListTile(itemId: snapshot.data![index]);
            },
          ),
        );
      },
    );
  }
}
