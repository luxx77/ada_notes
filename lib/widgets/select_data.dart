import 'package:ada_notes/providers/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../size_config.dart';

class SelectdateWidget extends StatefulWidget {
  const SelectdateWidget({super.key, this.onTapp});
  final void Function()? onTapp;

  @override
  State<SelectdateWidget> createState() => _SelectdateWidgetState();
}

class _SelectdateWidgetState extends State<SelectdateWidget> {
  final List<String> _months = [
    'January',
    'february',
    'March',
    'April',
    'May',
    'june',
    'jule',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  Future<void> _selectDate(BuildContext context) async {
    final mainData = Provider.of<MainProvider>(context, listen: false);
    final DateTime? picked = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.black45, // header background color
                onPrimary: Colors.white, // header text color
                onSurface: Colors.black, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: mainData.selectedDate,
        firstDate: DateTime(
          2000,
        ),
        lastDate: DateTime(2100));
    if (picked != null && picked != mainData.selectedDate) {
      setState(() {
        mainData.selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mainData = Provider.of<MainProvider>(context, listen: false);
    return InkWell(
      onTap: () => _selectDate(context),
      child: Container(
        
        alignment: Alignment.center,
        height: SizeConfig.height * 0.1,
        width: SizeConfig.width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1.9),
        ),
        child: FittedBox(child:Text(
          '${_months[mainData.selectedDate.month - 1]} ${mainData.selectedDate.day}, ${mainData.selectedDate.year}',
          style: TextStyle(fontSize: SizeConfig.text * 9),)
        ),
      ),
    );
  }
}
