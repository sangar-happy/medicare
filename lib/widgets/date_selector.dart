import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelectorRaisedButton extends StatelessWidget {
  final DateTime _selectedDate;
  final Function _selectDate;

  DateSelectorRaisedButton(this._selectDate, this._selectedDate);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => _selectDate(context),
      child: (() {
        if (_selectedDate == null) {
          return Text('Set Date');
        } else {
          return Text(DateFormat('dd-MM-yyyy').format(_selectedDate));
        }
      }()),
    );
  }
}
