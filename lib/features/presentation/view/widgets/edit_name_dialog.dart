import 'package:flutter/material.dart';
import 'package:quiz_app/features/data/data_sources/local/AppPrefs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/providers/user_data_provider.dart';


Future<void> showEditNameDialog(BuildContext context, WidgetRef ref) async {
  final TextEditingController nameController = TextEditingController();

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Enter New Name"),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: "Name",
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              final newName = nameController.text.trim();
              if (newName.isEmpty) return;

              // خزّنيه في SharedPreferences
              await AppPrefs.saveUsername(newName);

              // حدثي الـ Provider
              ref.read(userName.notifier).state = newName;

              Navigator.pop(context); // اغلق الـ Dialog
            },
            child: const Text("Save"),
          )
        ],
      );
    },
  );
}
