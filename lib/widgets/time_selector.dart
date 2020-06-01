import 'package:flutter/material.dart';

class TimeSelectorRaisedButton extends StatelessWidget {
  final TimeOfDay _selectedTime;
  final Function _selectTimeCallback;

  TimeSelectorRaisedButton(this._selectTimeCallback, this._selectedTime);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => _selectTime(context),
      child: (() {
        if (_selectedTime == null) {
          return Text('Set Time');
        } else {
          return Text('${_selectedTime.hour}:${_selectedTime.minute}');
        }
      }()),
    );
  }

  Future<Null> _selectTime(BuildContext context) async {
    _selectTimeCallback(
        await showTimePicker(context: context, initialTime: TimeOfDay.now()));
  }
}
