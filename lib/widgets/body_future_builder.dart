import 'package:ada_notes/modal_product.dart';
import 'package:ada_notes/providers/main_provider.dart';
import 'package:ada_notes/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductBody extends StatefulWidget {
  const ProductBody({Key? key}) : super(key: key);

  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  Future? _getSome;
  @override
  void initState() {
    final mainData = Provider.of<MainProvider>(context, listen: false);
    super.initState();
    _getSome = mainData.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    final mainData = Provider.of<MainProvider>(context);
    return mainData.searchController.text == ''
        ? FutureBuilder(
            future: _getSome,
            builder: (context, snap) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: mainData.productList.length,
                itemBuilder: (context, index) {
                  return ProductWidget(
                    countColor: Colors.amber,
                    datee: mainData.productList[index].date,
                    id: mainData.productList[index].id.toString(),
                    num: mainData.productList[index].number,
                    pushIndex: index,
                  );
                },
              );
            },
          )
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount:
                mainData.serachList.isEmpty ? 1 : mainData.serachList.length,
            itemBuilder: (context, index) {
              return mainData.serachList.isEmpty
                  ? const Center(
                      child: Text('Nothing found'),
                    )
                  : ProductWidget(
                      countColor: Colors.amber,
                      datee: mainData.serachList[index].date,
                      id: mainData.serachList[index].id.toString(),
                      num: mainData.serachList[index].number,
                      pushIndex: index,
                    );
            },
          );
  }
}
