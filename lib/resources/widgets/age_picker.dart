import 'package:flutter/material.dart';
import 'package:start_up_workspace/resources/helpers/all_imports.dart';

class AgePicker extends StatelessWidget {
  final int? selectedAge;
  final ValueChanged<int?> onSelect;

  AgePicker({required this.selectedAge, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
        localizations.age,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(width: 10),
        DropdownButton<int?>(
          value: selectedAge,
          items: List.generate(100, (index) => index + 1)
              .map((age) => DropdownMenuItem<int?>(
                    value: age,
                    child: Text(age.toString()),
                  ))
              .toList(),
          onChanged: onSelect,
        ),
      ],
    );
  }
}
