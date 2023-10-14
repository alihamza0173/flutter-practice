import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverMainAxisGroup(slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('SliverAppBar'),
                background: Image.network(
                  'https://picsum.photos/200/300',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ]),
          SliverMainAxisGroup(slivers: [
            const SliverPersistentHeader(
              pinned: true,
              delegate: HeaderDelegate('Section 1'),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: _getDecoratedSliverList(10),
            ),
          ]),
          SliverMainAxisGroup(slivers: [
            const SliverPersistentHeader(
              pinned: true,
              delegate: HeaderDelegate('Section 2'),
            ),
            SliverCrossAxisGroup(
              slivers: [
                SliverConstrainedCrossAxis(
                  maxExtent: 100,
                  sliver: SliverPadding(
                    padding: const EdgeInsets.all(8.0),
                    sliver: _getDecoratedSliverList(10),
                  ),
                ),
                SliverCrossAxisExpanded(
                  flex: 2,
                  sliver: SliverPadding(
                    padding: const EdgeInsets.all(8.0),
                    sliver: _getDecoratedSliverList(20),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: _getDecoratedSliverList(10),
                ),
              ],
            ),
          ]),
        ],
      ),
    );
  }

  Widget _getDecoratedSliverList(int itemCount) {
    return DecoratedSliver(
      decoration: BoxDecoration(
        color: Colors.purple[50],
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      sliver: SliverList.separated(
        itemBuilder: (_, int index) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('Item $index'),
        ),
        separatorBuilder: (_, __) => const Divider(indent: 8, endIndent: 8),
        itemCount: itemCount,
      ),
    );
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  const HeaderDelegate(this.title);
  final String title;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 30,
      color: Colors.purple[100],
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(title),
      ),
    );
  }

  @override
  double get maxExtent => minExtent;

  @override
  double get minExtent => 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
