import 'package:flutter/material.dart';

class SliverListApp extends StatelessWidget {
  const SliverListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SliverList Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              title: Text('Sliver app bar'),
              // expandedHeight: 200.0,
              flexibleSpace: Placeholder(),
              // pinned: true,
              // floating: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
                childCount: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
