import 'package:flutter/material.dart';
import './models/medicine.dart';
import './widgets/medicineList.dart';

void main(List<String> args) {
  runApp(MediCare());
}

class MediCare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  final List<Medicine> medicineSchedule = [
    Medicine('yolo', 100, 'rectal', DateTime.now()),
    Medicine('xpill', 100, 'oral', DateTime.now().subtract(Duration(days: 1))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.list),
            tooltip: 'Show Snackbar',
            onPressed: () {},
          ),
        ],
        title: Text('hi'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            MedicineList(medicineSchedule),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _newItem(context),
      ),
    );
  }

  void _newItem(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: "Dialog",
      transitionDuration: Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return SizedBox.expand(
          child: Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                FlatButton(
                  color: Colors.green,
                  child: Text('Save'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
