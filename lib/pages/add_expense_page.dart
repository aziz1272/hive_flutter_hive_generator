import 'package:flutter/material.dart';

import '../services/database/data_time_generator.dart';
import '../services/database/database_services.dart';
import '../services/database/id_generator.dart';
import '../services/models/expense_model.dart';
import 'home_page.dart';


class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  DatabaseServices databaseServices = DatabaseServices();
  bool isPrivate = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController textController = TextEditingController();
  TextEditingController costController = TextEditingController();

  Future<void> add() async {
    Expense expense = Expense(
      id: idGenerator(),
      title: titleController.text.trim(),
      cost: int.parse(costController.text.trim()),
      description: textController.text.trim(),
      createdTime: createdTime(),
      isPrivate: isPrivate,
    );
    databaseServices.add(expense);
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, HomePage.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new expense"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Column(
            children: [
              const SizedBox(height: 8),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: "Title",
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: "Description",
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: costController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Cost",
                ),
              ),
              const SizedBox(height: 32),
              SwitchListTile(
                value: isPrivate,
                onChanged: (bool value) {
                  setState(() {
                    isPrivate = value;
                  });
                },
                title: const Text("Is Private?"),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => add(),
                child: const Text("Add Expense"),
              )
            ],
          ),
        ),
      ),
    );
  }
}