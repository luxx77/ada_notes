import 'package:ada_notes/size_config.dart';
import 'package:ada_notes/widgets/cancel_or_done.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/main_provider.dart';

class AddAndDelateDialog extends StatelessWidget {
  const AddAndDelateDialog({super.key, this.inSearch, this.index, this.forAdd});
  final bool? forAdd;
  final bool? inSearch;
  final int? index;
  @override
  Widget build(BuildContext context) {
    final mainData = Provider.of<MainProvider>(context);
    return Dialog(
      child: SizedBox(
        height: SizeConfig.height * 0.25,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width * 0.02,
              vertical: SizeConfig.height * 0.012),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                forAdd!
                    ? '+993${mainData.phoneNumController.text}'
                    : '+993${mainData.numForDialog}',
                style: TextStyle(fontSize: (SizeConfig.height * 0.01) * 3),
              ),
              Expanded(
                child: FittedBox(
                  child: Text(
                    forAdd!
                        ? 'Do you really want to add?'
                        : 'Do you really want delete?',
                    style: TextStyle(
                        fontSize: (SizeConfig.height * 0.01) * 2.7,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CancleOrUpdate(
                    forAdd: false,
                    forEdit: false,
                    inSearching: false,
                    index: index,
                    forCancle: true,
                  ),
                  CancleOrUpdate(
                    inSearching: inSearch,
                    index: index,
                    forCancle: false,
                    forAdd: forAdd,
                    forEdit: false,
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
