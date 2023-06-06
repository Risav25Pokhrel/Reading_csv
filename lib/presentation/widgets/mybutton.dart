import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  const Mybutton(
      {super.key,
      required this.title,
      this.loading = false,
      this.color = Colors.teal,
      required this.onTap,
      this.isAbsorbed = false});

  final String title;
  final bool loading;
  final Color color;
  final bool isAbsorbed;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width - 20,
      child: AbsorbPointer(
        absorbing: isAbsorbed,
        child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: loading
                ? const Center(
                    child: CircularProgressIndicator(
                        strokeWidth: 4, color: Colors.white))
                : Text(title, style: const TextStyle(fontSize: 20))),
      ),
    );
  }
}
