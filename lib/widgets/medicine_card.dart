import 'package:flutter/material.dart';
import 'package:mediCareApp/models/medicine.dart';

class MedicineCard extends StatelessWidget {
  final Medicine medicine;
  final Function removeMedicine;

  MedicineCard(this.medicine, this.removeMedicine);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).accentColor,
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
                    Icons.delete_forever,
                    size: 24.0,
                  ),
                  onPressed: () => _deleteMedicine(context),
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
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(medicine.quantity.toString()),
                            SizedBox(
                              width: 10,
                            ),
                            Text(medicine.unit
                                .toString()
                                .replaceFirst(RegExp(r'^\w+.'), '')),
                          ],
                        ),
                        Text(medicine.routeOfAdministration
                            .toString()
                            .replaceFirst(RegExp(r'^\w+.'), '')),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteMedicine(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete ${medicine.name}?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
                removeMedicine(medicine.name);
              },
            ),
          ],
        );
      },
    );
  }
}
