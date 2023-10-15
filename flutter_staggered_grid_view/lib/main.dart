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
            itemBuilder: (context, index) => const Text('data'),
            staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
          ),
        ),
      ),
    );
  }
}
