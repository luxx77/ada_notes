import 'package:ada_notes/dialogs/add_and_delate_dialog.dart';
import 'package:ada_notes/providers/main_provider.dart';
import 'package:ada_notes/screens/inside_screen.dart';
import 'package:ada_notes/sql_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../size_config.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget(
      {Key? key,
      this.datee,
      this.countColor,
      this.pushIndex,
      this.id,
      this.num})
      : super(key: key);
  final String? num;
  final String? datee;
  final String? id;
  final int? pushIndex;
  final Color? countColor;

  @override
  Widget build(BuildContext context) {
    final mainData = Provider.of<MainProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.width * 0.04),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: SizeConfig.height * 0.009),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.9),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(1),
        ),
        height: SizeConfig.height * 0.07,
        width: SizeConfig.width * 0.9,
        child: InkWell(
          onLongPress: () {
            if (mainData.searchController.text != '') {
              showDialog(
                context: context,
                builder: ((context) => AddAndDelateDialog(
                inSearch: true,
                      forAdd: false,
                      index: pushIndex,
                    )),
              );
            } else {
              mainData.numForDialog = mainData.productList[pushIndex!].number!;
              showDialog(
                context: context,
                builder: ((context) => AddAndDelateDialog(
                inSearch: false,

                      forAdd: false,
                      index: pushIndex,
                    )),
              );
            }
          },
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => InsideScreen(
                  index: pushIndex,
                ),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width * 0.025,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '+993$num',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.height * 0.01 * 2),
                ),
                Text(
                  DateFormat('dd/MM/yyyy').format(DateTime.parse(datee!)),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.height * 0.01 * 2),
                ),
                Text(
                  '${pushIndex!+1}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.height * 0.01 * 3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
