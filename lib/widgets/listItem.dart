import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListItem extends StatelessWidget {
  final String medicineName;
  final double medicineDosage;
  final String routeOfAdministration;
  final DateTime medicineRegimen;

  ListItem(this.medicineName, this.medicineDosage, this.routeOfAdministration,
      this.medicineRegimen);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                medicineName,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                onPressed: () {},
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              DefaultTextStyle(
                style: TextStyle(fontSize: 18, color: Colors.black),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(medicineDosage.toString()),
                    Text(routeOfAdministration),
                    Text(DateFormat('jm').format(medicineRegimen)),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
