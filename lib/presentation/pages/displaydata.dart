import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_csv/core/usecases/pickfile.dart';
import 'package:read_csv/presentation/riverpod/stateproviders.dart';

class DisplayData extends ConsumerWidget {
  const DisplayData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(file);
    debugPrint(data.toString());
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await pickfile(ref);
          },
          label: const Text("Open New File")),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => Card(
            margin: const EdgeInsets.all(3),
            color: index == 0 ? Colors.indigo : Colors.white,
            child: ListTile(
              leading: Text(
                data[index][0].toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: index == 0 ? 18 : 15,
                    fontWeight:
                        index == 0 ? FontWeight.bold : FontWeight.normal,
                    color: index == 0 ? Colors.white : Colors.black),
              ),
              title: Text(
                data[index][1],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: index == 0 ? 18 : 15,
                    fontWeight:
                        index == 0 ? FontWeight.bold : FontWeight.normal,
                    color: index == 0 ? Colors.white : Colors.black),
              ),
              trailing: Text(
                data[index][2].toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: index == 0 ? 18 : 15,
                    fontWeight:
                        index == 0 ? FontWeight.bold : FontWeight.normal,
                    color: index == 0 ? Colors.white : Colors.black),
              ),
            )),
      ),
    );
  }
}
