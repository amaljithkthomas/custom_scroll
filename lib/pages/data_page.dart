import 'package:custom_scroll/widgets/data_page_content.dart';
import 'package:custom_scroll/widgets/data_page_header.dart';
import 'package:flutter/material.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: DataPageHeader(
              maxExtentData: 250,
              minExtentData: 150,
            ),
          ),
          const DataPageContent()
        ],
      ),
    );
  }
}
