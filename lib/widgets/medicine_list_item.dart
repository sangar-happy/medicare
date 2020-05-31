import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mediCareApp/models/medicine.dart';

class ListItem extends StatelessWidget {
  Medicine medicine;

  ListItem(this.medicine);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Text(
                  medicine.name,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 24.0,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DefaultTextStyle(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(medicine.dosage.toString()),
                      Text(medicine.routeOfAdministration),
                    ],
                  ),
                ),
                RaisedButton(
                  // TODO: implement logic to remove medicine if taken
                  child: Text('Taken'), onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
