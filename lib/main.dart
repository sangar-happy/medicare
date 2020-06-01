import 'package:flutter/material.dart';
import './models/medicine.dart';
import './widgets/medicine_list.dart';
import './widgets/new_medicine_list_item_dialog.dart';

void main(List<String> args) {
  runApp(MediCare());
}

class MediCare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

// TODO: home screen shows only the meds which need to be taken in near future.
// TODO: make another screen which shows all the medicines in the regimen.
// TODO: implement reminder/ alarm
class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final List<Medicine> medicineSchedule = [
    Medicine(
        name: 'xpill',
        quantity: 1,
        unit: MedicineDosageUnit.CAPSULES,
        routeOfAdministration: MedicineAdministrationRoute.ORAL,
        regimen: MedicineFrequency.DAILY,
        time: TimeOfDay.now()),
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
        title: Text('Home Page'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            MedicineList(medicineSchedule),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewMedicineDialog(context),
      ),
    );
  }

  void _addMedicine(Medicine medicine) {
    setState(() {
      medicineSchedule.add(medicine);
    });
  }

  void _addNewMedicineDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: "Dialog",
      transitionDuration: Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return AddNewItemDialog(_addMedicine);
      },
    );
  }
}
