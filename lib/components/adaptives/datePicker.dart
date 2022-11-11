// ignore: file_names
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime)? onDateChange;

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      onDateChange!(pickedDate);
    });
  }

  const AdaptativeDatePicker({
    this.onDateChange,
    this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2022),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChange!,
            ),
          )
        : Container(
            height: 70,
            child: Row(
              children: [
                Text(selectedDate == null
                    ? 'Nenhuma data selecionada'
                    : 'Data Selecionada: ${DateFormat('d MMM y').format(selectedDate!)}'),
                TextButton(
                  style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
                  onPressed: () => _showDatePicker(context),
                  child: Text("Selecionar Data"),
                )
              ],
            ),
          );
  }
}
