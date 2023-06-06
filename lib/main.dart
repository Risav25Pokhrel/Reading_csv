import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/pages/homepage.dart';

void main() {
  runApp(const ProviderScope(child: Lava()));
}

class Lava extends StatelessWidget {
  const Lava({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.indigo,
      debugShowCheckedModeBanner: false,
      scrollBehavior: const ScrollBehavior(),
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const Homepage(),
    );
  }
}
