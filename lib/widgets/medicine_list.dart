import 'package:flutter/material.dart';
import '../widgets/medicine_card.dart';

import '../models/medicine.dart';

class MedicineList extends StatefulWidget {
  final List<Medicine> schedule;
  final Function removeMedicine;

  MedicineList(this.schedule, this.removeMedicine);

  @override
  _MedicineListState createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.schedule.length,
        itemBuilder: (context, index) {
          return MedicineCard(widget.schedule[index], widget.removeMedicine);
        },
      ),
    );
  }
}
