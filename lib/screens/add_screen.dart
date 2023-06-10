import 'package:ada_notes/dialogs/add_and_delate_dialog.dart';
import 'package:ada_notes/size_config.dart';
import 'package:ada_notes/widgets/description_text_field.dart';
import 'package:ada_notes/widgets/select_data.dart';
import 'package:ada_notes/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/main_provider.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    final mainData = Provider.of<MainProvider>(
      context,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text('AddScreen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * 0.06,
          vertical: SizeConfig.height * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextField(
              forSearch: false,
              controller: mainData.phoneNumController,
            ),
            const SelectdateWidget(),
            SizedBox(height: SizeConfig.height * 0.03),
            Text(
              'Description',
              style: TextStyle(
                fontSize: SizeConfig.height * 0.01 * 3.5,
              ),
            ),
            DesTextFild(
              controller: mainData.discriptionController,
            ),
            SizedBox(height: SizeConfig.height * 0.01),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  overlayColor: MaterialStateProperty.all(Colors.grey[200]),
                ),
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => const AddAndDelateDialog(
                    forAdd: true,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Tap to add++',
                    style: TextStyle(
                        fontSize: SizeConfig.height * 0.01 * 4,
                        color: Colors.black),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
