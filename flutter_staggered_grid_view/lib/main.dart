import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 3,
            itemBuilder: (context, index) => Container(
              color: index.isEven ? Colors.green : Colors.blue,
              height: index.isEven ? 200 : 100,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text('$index'),
                ),
              ),
            ),
            staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
          ),
        ),
      ),
    );
  }
}
