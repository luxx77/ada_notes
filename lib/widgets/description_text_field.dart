import 'package:ada_notes/providers/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DesTextFild extends StatelessWidget {
  const DesTextFild({super.key, this.controller});
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    final mainData = Provider.of<MainProvider>(context, listen: false);
    return TextField(
      controller: controller,
      maxLines: 10,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
      ),
    );
  }
}
