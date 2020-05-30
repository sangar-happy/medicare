import 'package:flutter/material.dart';
import 'package:mediCareApp/widgets/listItem.dart';

import '../models/medicine.dart';

class MedicineList extends StatefulWidget {
  final List<Medicine> schedule;

  MedicineList(this.schedule);

  @override
  _MedicineListState createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: widget.schedule.length,
      itemBuilder: (context, index) {
        return ListItem(
            widget.schedule[index].medicineName,
            widget.schedule[index].medicineDosage,
            widget.schedule[index].routeOfAdministration,
            widget.schedule[index].medicineRegimen);
      },
    );
  }
}
