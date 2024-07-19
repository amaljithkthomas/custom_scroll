import 'package:custom_scroll/models/data.dart';
import 'package:custom_scroll/widgets/activity_card_body.dart';
import 'package:custom_scroll/widgets/activity_card_header.dart';
import 'package:custom_scroll/widgets/activity_split.dart';

import 'package:custom_scroll/widgets/profile_header.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: ProfileHeader(user: sampleUser),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                color: Colors.white,
                child: Column(
                  children: [
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                      height: .5,
                    ),
                    ActivityCardHeader(
                      userName: sampleUser.displayName!,
                      dateAndTime: sampleActivities[index].dateTime,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ActivityCardBody(
                      distance: sampleActivities[index].distance,
                      pace: sampleActivities[index].pace,
                      time: sampleActivities[index].time,
                      description: sampleActivities[index].description,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    if (sampleActivities[index].splits != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ActivitySplit(
                            splits: sampleActivities[index].splits),
                      ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                      height: .5,
                    ),
                  ],
                ),
              );
            }, childCount: sampleActivities.length),
          )
          // SliverAppBar(
          //   pinned: true,
          //   backgroundColor: Colors.amber,
          //   expandedHeight: 200,
          //   flexibleSpace: const FlexibleSpaceBar(
          //     title: Text('Sliver'),
          //   ),
          //   actions: [
          //     IconButton(
          //       onPressed: () {},
          //       icon: const Icon(Icons.more_vert),
          //     )
          //   ],
          // ),
          // SliverGrid(
          //   delegate: SliverChildBuilderDelegate(
          //     childCount: 20,
          //     (context, index) => Container(
          //       alignment: Alignment.center,
          //       color: Colors.teal[100 * (index % 9)],
          //       child: Text('grid item $index'),
          //     ),
          //   ),
          //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //     maxCrossAxisExtent: 200,
          //     crossAxisSpacing: 10,
          //     mainAxisSpacing: 10,
          //     childAspectRatio: 4,
          //   ),
          // ),
          // SliverFixedExtentList(
          //   delegate: SliverChildBuilderDelegate(
          //     childCount: 30,
          //     (context, index) => Container(
          //       alignment: Alignment.center,
          //       color: Colors.lightBlue[100 * (index % 9)],
          //       child: Text('list item $index'),
          //     ),
          //   ),
          //   itemExtent: 50,
          // )
        ],
      ),
    );
  }
}
