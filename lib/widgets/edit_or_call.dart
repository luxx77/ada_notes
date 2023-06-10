import 'package:ada_notes/dialogs/edit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/main_provider.dart';
import '../size_config.dart';

class CallOrEditPopupMenu extends StatefulWidget {
  const CallOrEditPopupMenu({super.key, this.index});
  final int? index;

  @override
  State<CallOrEditPopupMenu> createState() => _CallOrEditPopupMenuState();
}

class _CallOrEditPopupMenuState extends State<CallOrEditPopupMenu> {
  @override
  Widget build(BuildContext context) {
    final mainData = Provider.of<MainProvider>(context, listen: false);

    return PopupMenuButton(
        splashRadius: 25,
        itemBuilder: (
          context,
        ) {
          return [
            PopupMenuItem(
              onTap: () async {
                await launchUrl(Uri.parse(
                    'tel:+993${mainData.productList[widget.index!].number}'));
              },
              child: Row(
                children: [
                  const Icon(Icons.call),
                  SizedBox(width: SizeConfig.width * 0.02),
                  const Text('Call')
                ],
              ),
            ),
            PopupMenuItem(
              onTap: () {
                mainData.numEditController.text =
                    mainData.productList[widget.index!].number!;
                mainData.editController.text =
                    mainData.productList[widget.index!].description!;
                mainData.forCount = mainData.productList[widget.index!].count!;
                Future.delayed(
                  const Duration(seconds: 0),
                  () => showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (contex) {
                        return Editdialog(
                          index: widget.index,
                        );
                      }),
                );
              },
              child: Row(
                children: [
                  const Icon(Icons.edit),
                  SizedBox(width: SizeConfig.width * 0.02),
                  const Text('Edit')
                ],
              ),
            ),
          ];
        });
  }
}
