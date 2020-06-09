import 'package:flutter/material.dart';
import 'package:mediCareApp/screens/add_new_medicine_screen.dart';
import './screens/home_page_screen.dart';

void main(List<String> args) {
  runApp(MediCare());
}

class MediCare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        AddNewMedicine.routeName: (context) => AddNewMedicine(),
      },
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 210, 1),
      ),
    );
  }
}

// TODO: home screen shows only the meds which need to be taken in near future.
// TODO: make another screen which shows all the medicines in the regimen.
// TODO: implement reminder/ alarm
