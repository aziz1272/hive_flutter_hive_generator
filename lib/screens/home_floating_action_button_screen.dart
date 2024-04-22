import 'package:flutter/material.dart';
import '../pages/add_expense_page.dart';

class HomeFloatingActionButtonScreen extends StatelessWidget {
  const HomeFloatingActionButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddNotePage(),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}