import 'package:ada_notes/modal_product.dart';
import 'package:ada_notes/providers/main_provider.dart';
import 'package:ada_notes/sql_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dialogs/not_correct_num.dart';
import '../size_config.dart';

class CancleOrUpdate extends StatelessWidget {
  const CancleOrUpdate({
    super.key,
    this.forEdit,
    this.index,
    this.forAdd,
    this.inSearching,
    this.forCancle,
  });
  final bool? forEdit;
  final bool? forAdd;
  final bool? forCancle;
  final bool? inSearching;
  final int? index;

  void _addProd(BuildContext context) async {
    final mainData = Provider.of<MainProvider>(context, listen: false);
    if (mainData.phoneNumController.text.length == 8) {
      ProductModal add = ProductModal(
        number: mainData.phoneNumController.text,
        count: 1,
        date: mainData.selectedDate.toString(),
        description: mainData.discriptionController.text,
        id: mainData.productList.isEmpty
            ? 1
            : mainData.productList.last.id! + 1,
      );
      mainData.productList.add(add);
      await DBHelper.insert('user_favorites', add.toMap());
      Navigator.pop(context);
      Navigator.pop(context);
      mainData.discriptionController.text = '';
      mainData.phoneNumController.text = '';
      mainData.selectedDate = DateTime.now();
      mainData.getProduct();
      mainData.updateState();
    } else {
      Navigator.pop(context);
      showDialog(
          context: context, builder: (context) => const NotCorrectNumDialog());
    }
  }

  void _deleteProd(BuildContext context, bool inSearch, int index) {
    final mainData = Provider.of<MainProvider>(context, listen: false);
    if (!inSearch) {
      DBHelper.deleteFavorite(
          'user_favorites', mainData.productList[index].id!);
      mainData.getProduct();
      Navigator.pop(context);
      mainData.updateState();
    } else {
      DBHelper.deleteFavorite('user_favorites', mainData.serachList[index].id!);
      mainData.serachList.removeAt(index);
      mainData.getProduct();
      Navigator.pop(context);
      mainData.updateState();
    }
  }

  Future<void> _editProd(BuildContext context, int index) async {
    final mainData = Provider.of<MainProvider>(context, listen: false);
    mainData.productList[index].description = mainData.editController.text;
    mainData.productList[index].number = mainData.numEditController.text;

    mainData.productList[index].count = mainData.forCount;
    await DBHelper.uptade('user_favorites', mainData.productList[index].toMap(),
        mainData.productList[index].id!);
    Navigator.pop(context);
    mainData.updateState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      child: SizedBox(
        height: SizeConfig.height * 0.042,
        width: SizeConfig.width * 0.18,
        child: InkWell(
          onTap: () {
            if (forCancle!) {
              Navigator.pop(context);
            } else {
              if (forAdd!) {
                _addProd(context);
              } else if (forEdit!) {
                _editProd(context, index!);
              } else {
                _deleteProd(context, inSearching!, index!);
              }
            }
          },
          child: Center(
            child: Text(
              forCancle!
                  ? 'Cancel'
                  : forEdit!
                      ? 'Edit'
                      : forAdd!
                          ? 'Add'
                          : 'Delete',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
