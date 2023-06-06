import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_csv/core/usecases/pickfile.dart';
import 'package:read_csv/presentation/riverpod/providers.dart';
import 'package:read_csv/presentation/riverpod/stateproviders.dart';
import '../widgets/mybutton.dart';
import 'displaydata.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utils = ref.watch(utilsProvider);
    final filestatus = ref.watch(fileStatusProvider);
    final loading = ref.watch(loadingStatus);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: const Center(
              child: Text("READ CSV",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      color: Colors.white)),
            ),
          ),
          const SizedBox(height: 80),
          Mybutton(
            title: "Pick .CSV File From Device",
            isAbsorbed: loading,
            onTap: () async {
              ref.read(loadingStatus.notifier).state = true;
              await pickfile(ref);
              ref.read(loadingStatus.notifier).state = false;
            },
          ),
          const SizedBox(height: 50),
          Mybutton(
            isAbsorbed: loading,
            title: filestatus ? "Display Data" : "No File",
            onTap: () {
              if (filestatus) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const DisplayData()));
              } else {
                utils.showToast(message: "File not available");
              }
            },
            color: filestatus ? Colors.green : Colors.grey,
            loading: loading,
          )
        ],
      ),
    );
  }
}
