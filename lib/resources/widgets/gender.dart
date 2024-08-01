import 'package:flutter/material.dart';
import 'package:start_up_workspace/resources/helpers/all_imports.dart';

class GenderDropdown extends StatelessWidget {
  final String? selectedGender;
  final ValueChanged<String?> onSelect;

  GenderDropdown({required this.selectedGender, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          localizations.gender,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(width: 10),
        DropdownButton<String?>(
          value: selectedGender,
          items: ['Male', 'Female', 'Other']
              .map((gender) => DropdownMenuItem<String?>(
                    value: gender,
                    child: Text(gender),
                  ))
              .toList(),
          onChanged: onSelect,
        ),
      ],
    );
  }
}
