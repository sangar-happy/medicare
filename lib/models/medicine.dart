import 'package:flutter/material.dart';

enum MedicineFrequency { Daily, Weekly, Monthly, Emergency }
enum MedicineDosageUnit { Mg, Ml, Drops, Capsules, Puffs }
enum MedicineAdministrationRoute {
  Oral,
  Local,
  Mouth_Inhalation,
  Nasal_Inhalation,
  Parenteral,
  Intranasal,
  Sublingual,
  Buccal,
  Sublabial
}

class Medicine {
  final String name;
  final double quantity;
  final MedicineDosageUnit unit;
  final MedicineAdministrationRoute routeOfAdministration;
  final MedicineFrequency regimen;
  final TimeOfDay time;

  Medicine(
      {@required this.name,
      @required this.quantity,
      @required this.unit,
      @required this.routeOfAdministration,
      @required this.regimen,
      this.time});
}
