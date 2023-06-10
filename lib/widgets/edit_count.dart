import 'package:ada_notes/providers/main_provider.dart';
import 'package:ada_notes/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditCount extends StatefulWidget {
  const EditCount({
    super.key,
    this.index,
  });
  final int? index;
  @override
  State<EditCount> createState() => _EditCountState();
}

class _EditCountState extends State<EditCount> {
  @override
  Widget build(BuildContext context) {
    final mainData = Provider.of<MainProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: SizeConfig.width * 0.05),
          height: SizeConfig.height * 0.06,
          width: SizeConfig.width * 0.13,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(SizeConfig.height),
          ),
          child: InkWell(
            onTap: () {
              mainData.forCount--;
              mainData.updateState();
            },
            child: const ImageIcon(
              AssetImage('images/minus.png'),
            ),
          ),
        ),
        Text(
          '${mainData.forCount}',
          style: TextStyle(
              fontSize: SizeConfig.text * 9,
              color:
                  mainData.forCount == mainData.productList[widget.index!].count
                      ? Colors.red
                      : Colors.blue),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: SizeConfig.width * 0.05),
          height: SizeConfig.height * 0.06,
          width: SizeConfig.width * 0.13,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(SizeConfig.height),
          ),
          child: InkWell(
            onTap: () {
              mainData.forCount++;
              mainData.updateState();
            },
            child: const Icon(
              Icons.add,
              color: Colors.black,
              size:30
            ),
          ),
        ),
      ],
    );
  }
}
