import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/main_provider.dart';
import '../size_config.dart';
import '../widgets/body_future_builder.dart';
import '../widgets/text_field.dart';
import 'add_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.getSize(context);
    final mainData = Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text('ADA notes'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.width * 0.05,
                vertical: SizeConfig.height * 0.02),
            child: MyTextField(
              forSearch: true,
              controller: mainData.searchController,
            ),
          ),
          const Expanded(child: ProductBody())
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[900],
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddScreen(),
          ),
        ),
      ),
    );
  }
}
