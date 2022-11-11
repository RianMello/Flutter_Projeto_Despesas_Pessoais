import 'package:flutter/material.dart';
import 'adaptives/textField.dart';
import 'adaptives/button.dart';
import 'adaptives/datePicker.dart';

class TransactionsForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubimit;
  TransactionsForm(this.onSubimit);

  @override
  State<TransactionsForm> createState() => _TransactionsFormState();
}

class _TransactionsFormState extends State<TransactionsForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty ||
        (value.isNegative || value == 0) ||
        _selectedDate == null) {
      return;
    }
    widget.onSubimit(title, value, _selectedDate!);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          elevation: 6,
          child: Padding(
            padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              children: [
                AdaptativeTextField(
                  label: 'Titulo',
                  controller: _titleController,
                  onSubmitted: (_) => _submitForm(),
                ),
                AdaptativeTextField(
                  label: 'Valor(R\$)',
                  controller: _valueController,
                  keyboarType:
                      const TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => _submitForm(),
                ),
                AdaptativeDatePicker(
                  selectedDate: _selectedDate,
                  onDateChange: (newDate) {
                    setState(() => _selectedDate = newDate);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 5,
                        ),
                        child: AdaptativeButton(
                          label: 'Nova Transação',
                          onPressed: _submitForm,
                        ))
                  ],
                )
              ],
            ),
          )),
    );
  }
}
