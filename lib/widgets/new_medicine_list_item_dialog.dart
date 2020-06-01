import 'package:flutter/material.dart';
import '../models/medicine.dart';
import './time_selector.dart';
import './date_selector.dart';

class AddNewItemDialog extends StatefulWidget {
  final Function addMedicine;

  AddNewItemDialog(this.addMedicine);

  @override
  _AddNewItemDialogState createState() => _AddNewItemDialogState();
}

class _AddNewItemDialogState extends State<AddNewItemDialog> {
  final _nameController = TextEditingController();
  final _dosageController = TextEditingController();
  MedicineAdministrationRoute _selectedRoute;
  MedicineFrequency _selectedFrequency;
  MedicineDosageUnit _selectedUnit;
  DateTime _selectedDate;
  TimeOfDay _selectedTime;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: _saveMedicineInfo,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  controller: _nameController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Row(children: <Widget>[
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Dosage',
                        border: OutlineInputBorder(),
                      ),
                      controller: _dosageController,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  DropdownButton(
                    hint: Text('Select'),
                    value: _selectedUnit,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedUnit = newValue;
                      });
                    },
                    items: MedicineDosageUnit.values.map((dosage) {
                      return DropdownMenuItem(
                        child: new Text(
                          dosage
                              .toString()
                              .replaceFirst(RegExp(r'\w+.'), '')
                              .toLowerCase(),
                        ),
                        value: dosage,
                      );
                    }).toList(),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Route of administration'),
                    DropdownButton(
                      hint: Text('Select'),
                      value: _selectedRoute,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedRoute = newValue;
                        });
                      },
                      items: MedicineAdministrationRoute.values.map((route) {
                        return DropdownMenuItem(
                          child: new Text(route
                              .toString()
                              .replaceFirst(RegExp(r'\w+.'), '')
                              .toLowerCase()),
                          value: route,
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Regimen'),
                    DropdownButton<MedicineFrequency>(
                      hint: Text('Select'),
                      value: _selectedFrequency,
                      onChanged: (MedicineFrequency newValue) {
                        setState(() {
                          _selectedFrequency = newValue;
                        });
                      },
                      items: MedicineFrequency.values
                          .map((MedicineFrequency frequency) {
                        return DropdownMenuItem(
                          child: new Text(frequency
                              .toString()
                              .replaceFirst(RegExp(r'\w+.'), '')
                              .toLowerCase()),
                          value: frequency,
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              // TODO: implement weekly, monthly and emergency cases
              // TODO: implement day picker
              (() {
                switch (_selectedFrequency) {
                  case MedicineFrequency.DAILY:
                    return (Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Time'),
                          SizedBox(
                            height: 20.0,
                          ),
                          TimeSelectorRaisedButton(_selectTime, _selectedTime),
                        ],
                      ),
                    ));

                    break;
                  case MedicineFrequency.WEEKLY:
                    return (Padding(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            DateSelectorRaisedButton(
                                _selectDate, _selectedDate),
                            TimeSelectorRaisedButton(
                                _selectTime, _selectedTime),
                          ],
                        )));
                    break;
                  case MedicineFrequency.MONTHLY:
                    break;
                  case MedicineFrequency.EMERGENCY:
                    break;
                }
                return Text('');
              }()),
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  void _selectTime(TimeOfDay picked) {
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }

  void _saveMedicineInfo() {
    if (_nameController == null ||
        _dosageController == null ||
        _selectedRoute == null ||
        _selectedFrequency == null ||
        _selectedUnit == null ||
        _selectedTime == null) {
      print('yo null');
    } else {
      var medicine = Medicine(
          name: _nameController.text,
          quantity: double.parse(_dosageController.text),
          unit: _selectedUnit,
          routeOfAdministration: _selectedRoute,
          regimen: _selectedFrequency,
          time: _selectedTime);
      widget.addMedicine(medicine);
      Navigator.of(context).pop();
    }
  }
}
