import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/main_provider.dart';
import '../size_config.dart';
import '../widgets/edit_or_call.dart';

class InsideScreen extends StatefulWidget {
  const InsideScreen({Key? key, this.index}) : super(key: key);
  final int? index;

  @override
  State<InsideScreen> createState() => _InsideScreenState();
}

class _InsideScreenState extends State<InsideScreen> {
  int curint = 0;
  @override
  Widget build(BuildContext context) {
    final mainData = Provider.of<MainProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        title: const Text(
          ' ADA notes',
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              '+993 ${mainData.productList[widget.index!].number}',
              style: TextStyle(
                  fontSize: SizeConfig.height * 0.01 * 5, color: Colors.black),
            ),
          ),
          Text(
            'Alynan Harytlaryn Sany ${mainData.productList[widget.index!].count}',
            style: TextStyle(
                fontSize: SizeConfig.height * 0.01 * 3.5,
                color: mainData.productList[widget.index!].count! > 9
                    ? Colors.red
                    : Colors.black,
                fontWeight: mainData.productList[widget.index!].count! > 9
                    ? FontWeight.bold
                    : null),
          ),
          Text(
            DateFormat('dd/MM/yyyy')
                .format(
                  DateTime.parse(mainData.productList[widget.index!].date!),
                )
                .toString(),
            style: TextStyle(
                fontSize: SizeConfig.height * 0.01 * 3.5, color: Colors.black),
          ),
          SizedBox(
            height: SizeConfig.height * 0.02,
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              semanticChildCount: 2,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.width * 0.013),
                  child: Text(
                    '${mainData.productList[widget.index!].description}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.height * 0.01 * 2.5),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: CallOrEditPopupMenu(
        index: widget.index,
      ),
    );
  }
}
