import 'package:flutter/material.dart';
import '../widgets/medicine_list_item.dart';

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
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.schedule.length,
        itemBuilder: (context, index) {
          return ListItem(widget.schedule[index]);
        },
      ),
    );
  }
}
