import 'package:hive/hive.dart';
part 'expense_model.g.dart';

@HiveType(typeId: 1)
class Expense {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  int cost;

  @HiveField(3)
  String id;

  @HiveField(5)
  String createdTime;

  @HiveField(4)
  bool isPrivate;

  Expense({
    required this.id,
    required this.title,
    required this.cost,
    required this.description,
    required this.createdTime,
    required this.isPrivate,
  });
}