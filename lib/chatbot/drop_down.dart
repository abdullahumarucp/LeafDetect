import 'package:LeafDetect/chatbot/models_provider.dart';
import 'package:LeafDetect/chatbot/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModelsDropDownWidget extends StatefulWidget {
  const ModelsDropDownWidget({super.key});

  @override
  State<ModelsDropDownWidget> createState() => _ModelsDropDownWidgetState();
}

class _ModelsDropDownWidgetState extends State<ModelsDropDownWidget> {
  String? currentModel;

  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context, listen: false);

    return FutureBuilder(
      future: modelsProvider.getAllModels(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: TextWidget(label: snapshot.error.toString()),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox.shrink();
        }

        final models = snapshot.data!;

// Ensure currentModel matches a model id in the list, else fallback to first model id
        if (currentModel == null ||
            !models.any((model) => model.id == currentModel)) {
          currentModel = models.isNotEmpty ? models.first.id : null;
        }

        return FittedBox(
          child: DropdownButton<String>(
            dropdownColor: Colors.blueGrey,
            iconEnabledColor: Colors.white,
            value: currentModel,
            items: models
                .map(
                  (model) => DropdownMenuItem(
                    value: model.id,
                    child: TextWidget(
                      label: model.id,
                      fontSize: 15,
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                currentModel = value.toString();
              });
              modelsProvider.setCurrentModel(value.toString());
            },
          ),
        );
      },
    );
  }
}
