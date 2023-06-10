import 'package:ada_notes/widgets/cancel_or_done.dart';
import 'package:ada_notes/widgets/edit_count.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/main_provider.dart';
import '../size_config.dart';
import '../widgets/description_text_field.dart';
import '../widgets/text_field.dart';

class Editdialog extends StatefulWidget {
  const Editdialog({super.key, this.index});
  final int? index;
  @override
  State<Editdialog> createState() => _EditdialogState();
}

class _EditdialogState extends State<Editdialog> {
  @override
  Widget build(BuildContext context) {
    final mainData = Provider.of<MainProvider>(context, listen: false);

    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.height * 0.015,
              horizontal: SizeConfig.width * 0.015),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextField(
                forSearch: false,
                controller: mainData.numEditController,
              ),
              EditCount(index: widget.index),
              SizedBox(height: SizeConfig.height * 0.01),
              Text('Edit description',
                  style: TextStyle(fontSize: (SizeConfig.height * 0.01) * 3)),
              SizedBox(height: SizeConfig.height * 0.008),
              DesTextFild(
                controller: mainData.editController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CancleOrUpdate(
                    forEdit: false,
                    forCancle: true,
                    forAdd: false,
                  ),
                  CancleOrUpdate(
                    forAdd: false,
                    inSearching: false,
                    forCancle: false,
                    index: widget.index,
                    forEdit: true,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
