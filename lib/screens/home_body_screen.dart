import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter_hive_generator/screens/home_listtile_screen.dart';
import 'package:hive_flutter_hive_generator/services/models/expense_model.dart';


class HomeBodyScreen extends StatefulWidget {
  final List<Expense> list;

  const HomeBodyScreen({
    super.key,
    required this.list,
  });

  @override
  State<HomeBodyScreen> createState() => _HomeBodyScreenState();
}

class _HomeBodyScreenState extends State<HomeBodyScreen> {
  bool showPrivate = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (context, index) {
        final item = widget.list[index];
        if (!item.isPrivate) {
          return HomeListTileScreen(
            onLongPress: () {
              log("Salom Flutter");
              setState(() {
                showPrivate = !showPrivate;
              });
            },
            item: item,
          );
        }
        if (showPrivate) {
          return HomeListTileScreen(
            onLongPress: () {
              setState(() {
                showPrivate = !showPrivate;
              });
            },
            item: item,
          );
        }
        return const SizedBox();
      },
    );
  }
}