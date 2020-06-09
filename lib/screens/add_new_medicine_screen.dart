import 'package:flutter/material.dart';
import '../models/medicine.dart';
import '../widgets/show_time_picker.dart';
import '../widgets/show_date_picker.dart';

class AddNewMedicine extends StatefulWidget {
  static const routeName = '/addNewMedicine';
  @override
  _AddNewMedicineState createState() => _AddNewMedicineState();
}

class _AddNewMedicineState extends State<AddNewMedicine> {
  final _nameController = TextEditingController();
  final _dosageController = TextEditingController();
  MedicineAdministrationRoute _selectedRoute;
  MedicineFrequency _selectedFrequency;
  MedicineDosageUnit _selectedUnit;
  DateTime _selectedDate;
  TimeOfDay _selectedTime;

  @override
  Widget build(BuildContext context) {
    final AddNewMedicineScreenArguments args =
        ModalRoute.of(context).settings.arguments;

    return SizedBox.expand(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Medicine Details'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () => _saveMedicineInfo(args.addMedicine),
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
                      // TODO: don't return plural unit for dosage value <= 1
                      return DropdownMenuItem(
                        child: new Text(() {
                          var s = dosage
                              .toString()
                              .replaceFirst(RegExp(r'\w+.'), '');
                          return s;
                          // else if (double.parse(_dosageController.text) <= 1)
                          //   return s.replaceFirst(RegExp(r's$'), '');
                          // else
                          //   return s;
                        }()),
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
                              .replaceFirst('_', ' ')),
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
                              .replaceFirst(RegExp(r'\w+.'), '')),
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
                  case MedicineFrequency.Daily:
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
                  case MedicineFrequency.Weekly:
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
                  case MedicineFrequency.Monthly:
                    break;
                  case MedicineFrequency.Emergency:
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

  void _saveMedicineInfo(Function addMedicine) {
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
      addMedicine(medicine);
      Navigator.of(context).pop();
    }
  }
}

class AddNewMedicineScreenArguments {
  final Function addMedicine;

  AddNewMedicineScreenArguments(this.addMedicine);
}
