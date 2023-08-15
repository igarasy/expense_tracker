import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  //when whe have lists that we dont know the length its better to use ListView.builder()
  //the builder will create the element only when they are visible

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
          decoration: ShapeDecoration(
            color: Theme.of(context).colorScheme.error.withOpacity(0.75),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}
