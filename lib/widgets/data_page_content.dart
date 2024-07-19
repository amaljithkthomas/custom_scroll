import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataPageContent extends StatefulWidget {
  const DataPageContent({super.key});

  @override
  State<DataPageContent> createState() => _DataPageContentState();
}

class _DataPageContentState extends State<DataPageContent> {
  late Future<String> _loader;
  bool _shouldFail = false;

  // mock function to load some data or fail after some delay
  Future<String> getData(bool shouldFail) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    if (shouldFail) {
      throw PlatformException(code: '404');
    }
    return 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?';
  }

  void _retry() {
    // update loader
    _loader = getData(!_shouldFail);
    setState(() => _shouldFail = !_shouldFail);
  }

  @override
  void initState() {
    super.initState();
    _loader = getData(_shouldFail);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loader,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.deepPurple,
                  semanticsLabel: 'Loading',
                ),
              ),
            );
          }

          if (snapshot.hasError) {
            return SliverFillRemaining(
              child: TextAndButton(
                content: 'An error occurred',
                buttonText: 'Reload',
                onPressed: _retry,
              ),
            );
          }
          if (snapshot.hasData) {
            return SliverToBoxAdapter(
              child: TextAndButton(
                content: snapshot.requireData,
                buttonText: 'Reload',
                onPressed: _retry,
              ),
            );
          }
          return const SliverFillRemaining(
            child: Center(child: Text('No Content')),
          );
        });
  }
}

class TextAndButton extends StatelessWidget {
  const TextAndButton({
    super.key,
    required this.content,
    required this.buttonText,
    required this.onPressed,
  });
  final String content;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            content,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
            ),
          ),
        ],
      ),
    );
  }
}