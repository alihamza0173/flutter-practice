import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Android Native Code',
      debugShowMaterialGrid: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int randomeNumber = 0;
  // Create by passing channel name!
  final channel = const MethodChannel('NativeChannel');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Android Native Code")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Random Number: $randomeNumber",
                style: const TextStyle(color: Colors.red, fontSize: 30)),
            ElevatedButton(
              onPressed: () async {
                Map data = await channel.invokeMethod("generateRandomNumber");
                debugPrint(data.toString());
                setState(() {
                  randomeNumber = data["RandomNumber"];
                });
              },
              child: const Text("Referesh"),
            )
          ],
        ),
      ),
    );
  }
}
