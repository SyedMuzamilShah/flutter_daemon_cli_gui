import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool completed;
  final VoidCallback? onToggle;
  final VoidCallback? onDelete;

  const TaskTile({
    super.key,
    required this.title,
    required this.completed,
    this.onToggle,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(completed ? Icons.check_box : Icons.check_box_outline_blank),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (onToggle != null)
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: onToggle,
            ),
          if (onDelete != null)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onDelete,
            ),
        ],
      ),
    );
  }
}
