import 'package:flutter/material.dart';
import '../models/medicine.dart';

class AddNewItemDialog extends StatefulWidget {
  final Function addMedicine;

  AddNewItemDialog(this.addMedicine);

  @override
  _AddNewItemDialogState createState() => _AddNewItemDialogState();
}

class _AddNewItemDialogState extends State<AddNewItemDialog> {
  final _nameController = TextEditingController();

  final _dosageController = TextEditingController();

  List<String> _routeOfAdministration = [
    'Oral',
    'Local',
    'Mouth inhalation',
    'Nasal inhalation',
    'Parenteral',
    'Intranasal',
    'Sublingual',
    'Buccal',
    'Sublabial'
  ];
  // List<String> _frequencyOfAdministration = [
  //   'Daily',
  //   'Weekly',
  //   'Montly',
  //   'Emergency Only'
  // ];

  String _selectedRoute;
  MedicineFrequency _selectedFrequency;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: _saveMedicineInfo,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: TextField(
                  decoration: const InputDecoration(
                    prefix: Text('Medicine Name'),
                    border: OutlineInputBorder(),
                  ),
                  controller: _nameController,
                  onChanged: (val) {
                    print('${_nameController.text}');
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefix: Text('Dosage'),
                    border: OutlineInputBorder(),
                  ),
                  controller: _dosageController,
                  onChanged: (val) {
                    print('${_dosageController.text}');
                  },
                ),
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
                      items: _routeOfAdministration.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
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
                              .replaceFirst('MedicineFrequency.', '')),
                          value: frequency,
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              // TODO: implement time, day and date selector according to the frequency selected
              (() {
                switch (_selectedFrequency) {
                  case MedicineFrequency.daily:
                    return Text('<daily logic here>');
                    break;
                  case MedicineFrequency.weekly:
                    return Text('weekly');
                    break;
                  case MedicineFrequency.monthly:
                    break;
                  case MedicineFrequency.emergency:
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

  void _saveMedicineInfo() {
    if (_nameController == null ||
        _dosageController == null ||
        _selectedRoute == null ||
        _selectedFrequency == null) {
    } else {
      var medicine = Medicine.daily(_nameController.text,
          double.parse(_dosageController.text), _selectedRoute);
      widget.addMedicine(medicine);
      Navigator.of(context).pop();
    }
  }
}
