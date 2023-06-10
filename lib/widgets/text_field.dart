import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/main_provider.dart';
import '../size_config.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    this.forSearch,
    this.controller,
  }) : super(key: key);
  final TextEditingController? controller;
  final bool? forSearch;

  @override
  Widget build(BuildContext context) {
    final mainData = Provider.of<MainProvider>(context);
    return TextField(
      onChanged: (val) {
        if (forSearch!) {
          mainData.doSearch();
        }
      },
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      cursorColor: Colors.black,
      style: TextStyle(fontSize: SizeConfig.text * 7),
      controller: controller,
      maxLength: 8,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelStyle: forSearch!
            ? TextStyle(
                color: Colors.black, fontSize: SizeConfig.height * 0.01 * 2.7)
            : null,
        label: forSearch! ? const Text('Search') : null,
        hintText: '6xxxxxxx',
        prefixStyle: TextStyle(
            color: Colors.black, fontSize: (SizeConfig.height * 0.01) * 2.53),
        icon: Text(
          '+993',
          style: TextStyle(fontSize: (SizeConfig.height * 0.01) * 3.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
      ),
    );
  }
}
