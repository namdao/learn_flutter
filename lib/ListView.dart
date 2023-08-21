import 'dart:math' as math;

import 'package:flutter/material.dart';

abstract class ListItem {
  Widget buildHeadLine(BuildContext context);

  Widget buildSubLine(BuildContext context);
}

class HeadingLine implements ListItem {
  HeadingLine(this.heading);
  final String heading;

  @override
  Widget buildHeadLine(BuildContext context) {
    return Text(heading, style: Theme.of(context).textTheme.headlineMedium);
  }

  @override
  Widget buildSubLine(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class SubLine implements ListItem {
  SubLine(this.subHeading, this.message);
  final String subHeading;
  final String message;
  @override
  Widget buildHeadLine(BuildContext context) {
    return Text(subHeading);
  }

  @override
  Widget buildSubLine(BuildContext context) {
    return Text(message, style: const TextStyle(color: Colors.grey));
  }
}

class ListDifferentType extends StatelessWidget {
  ListDifferentType({super.key});
  final List<ListItem> listItem = List.generate(10000, (index) {
    bool isHeadLine = index % 6 == 0;
    return isHeadLine
        ? HeadingLine('Heading $index')
        : SubLine('Sub heading $index', 'message $index');
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listItem.length,
        itemBuilder: (context, index) {
          final item = listItem[index];
          return ListTile(
            title: item.buildHeadLine(context),
            subtitle: item.buildSubLine(context),
          );
        });
  }
}

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key});

  Widget listHorizontal() => Container(
      padding: const EdgeInsets.all(12),
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 160,
            color: Colors.red,
          ),
          Container(
            width: 160,
            color: Colors.blue,
          ),
          Container(
            width: 160,
            color: Colors.green,
          ),
          Container(
            width: 160,
            color: Colors.black,
          )
        ],
      ));

  Widget listGridView(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        padding: const EdgeInsets.all(12),
        color: Colors.amberAccent,
        width: screenWidth,
        height: 240,
        child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(30, (index) {
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.redAccent),
                  color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0)),
              child: Center(
                  child: Text('Item $index',
                      style: Theme.of(context).textTheme.headlineSmall)),
            );
          }),
        ));
  }

  Widget ItemWidget(String text) => Card(
        child: SizedBox(
          height: 100,
          child: Center(child: Text(text)),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List view',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('List view'),
          ),
          body: ListDifferentType()
          // Column(children: [
          // LayoutBuilder(builder: (context, constraints) {
          //   return SingleChildScrollView(
          //     child: ConstrainedBox(
          //         constraints: BoxConstraints(minHeight: constraints.maxHeight),
          //         child: IntrinsicHeight(
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               // const Placeholder(
          //               //   fallbackHeight: 100,
          //               // ),
          //               ItemWidget('Item 1'),
          //               ItemWidget('Item 2'),
          //               ItemWidget('Item 2.1'),
          //               ItemWidget('Item 2.1'),
          //               ItemWidget('Item 2.2'),
          //               ItemWidget('Item 2.2'),
          //               ItemWidget('Item 2.3333'),
          //               ItemWidget('Item 2.3333'),
          //               Expanded(
          //                 child: ItemWidget('Item 3'),
          //               ),
          //             ],
          //           ),
          //         )),
          //   );
          // }),
          // const Text('horizontal list'),
          // listHorizontal(),
          // const Text('vertical list'),
          // listGridView(context),
          // const Text('List view different type'),
          // ListDifferentType()
          // ]),
          ),
    );
  }
}
