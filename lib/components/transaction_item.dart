import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class TransactionItem extends StatefulWidget {
  final Transaction tr;
  final Function(String) onRemove;
  const TransactionItem({
    Key? key,
    required this.tr,
    required this.onRemove,
  }) : super(key: key);

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  final colors = [
    Colors.purple,
    Colors.pink,
    Colors.black,
    Color.fromARGB(255, 0, 98, 109),
    Color.fromARGB(255, 7, 107, 10)
  ];

  Color? _backgroundColor;

  @override
  void initState() {
    int i = Random().nextInt(5);
    _backgroundColor = colors[i];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 8,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgroundColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: FittedBox(
              child: Text(
                'R\$${widget.tr.value.toStringAsFixed(1)}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        title: Text(
          widget.tr.title,
          style: Theme.of(context).textTheme.headline5,
        ),
        subtitle: Text(DateFormat('d MMM y').format(widget.tr.date)),
        trailing: MediaQuery.of(context).size.width > 450
            ? TextButton.icon(
                onPressed: () => widget.onRemove(widget.tr.id),
                icon: const Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
                label: Text(
                  "Excluir",
                  style: TextStyle(color: Colors.red[400]),
                ))
            : IconButton(
                icon: const Icon(Icons.delete_forever),
                color: Colors.red[400],
                onPressed: () => widget.onRemove(widget.tr.id),
              ),
      ),
    );
  }
}
