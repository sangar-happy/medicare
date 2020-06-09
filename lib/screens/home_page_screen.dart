import 'package:flutter/material.dart';
import '../models/medicine.dart';
import '../widgets/medicine_list.dart';
import '../screens/add_new_medicine_screen.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Medicine> medicineSchedule = [
    Medicine(
        name: 'xpill',
        quantity: 1,
        unit: MedicineDosageUnit.Capsules,
        routeOfAdministration: MedicineAdministrationRoute.Oral,
        regimen: MedicineFrequency.Daily,
        time: TimeOfDay.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.list),
          onPressed: () {},
        ),
        title: Text('Home Page'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            MedicineList(medicineSchedule, _removeMedicine),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddNewMedicine.routeName,
              arguments: AddNewMedicineScreenArguments(_addMedicine));
        },
      ),
    );
  }

  void _addMedicine(Medicine medicine) {
    setState(() {
      medicineSchedule.add(medicine);
    });
  }

  void _removeMedicine(String name) {
    setState(() {
      medicineSchedule.removeWhere((medicine) => medicine.name == name);
    });
  }

  // void _addNewMedicineDialog(BuildContext context) {
  //   showGeneralDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     barrierLabel: "Dialog",
  //     transitionDuration: Duration(milliseconds: 400),
  //     pageBuilder: (_, __, ___) {
  //       return AddNewItemDialog(_addMedicine);
  //     },
  //   );
  // }
}
