import 'dart:developer';
import 'package:hive/hive.dart';
import 'package:hive_flutter_hive_generator/services/models/expense_model.dart';

class DatabaseServices {
  ///Hive Box name
  String boxName = "expenses";

  ///Open Box
  Future<Box<Expense>> box() async {
    var box = Hive.openBox<Expense>(boxName);
    return box;
  }

  ///Add expense
  Future<void> add(Expense expense) async {
    final myBox = await box();
    myBox.put(expense.id, expense);
    log("Added to database");
  }

  ///Delete expense
  Future<void> delete(String id) async {
    final myBox = await box();
    myBox.delete(id);
    log("Deleted from database");
  }

  ///Update expense
  Future<void> update(String id, Expense expense) async {
    final myBox = await box();
    myBox.put(id, expense);
  }

  ///Get expense
  Future<List<Expense>> getList() async {
    final myBox = await box();
    List<Expense> list = [];
    for (var item in myBox.values) {
      try {
        list.add(item);
      } catch (error) {
        log("Error: $error");
      }
    }
    return list;
  }

  ///Calculate sum expense
  Future<int> calculate() async {
    int sum = 0;
    final guttedList = await getList();
    for (final item in guttedList) {
      sum += item.cost;
    }
    return sum;
  }
}