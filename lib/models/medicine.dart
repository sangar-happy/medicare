import 'package:flutter/material.dart';

enum MedicineFrequency { DAILY, WEEKLY, MONTHLY, EMERGENCY }
enum MedicineDosageUnit { MG, ML, DROPS, CAPSULES, PUFFS }
enum MedicineAdministrationRoute {
  ORAL,
  LOCAL,
  MOUTH_INHALATION,
  NASAL_INHALATION,
  PARENTERAL,
  INTRANASAL,
  SUBLINGUAL,
  BUCCAL,
  SUBLABIAL
}

class Medicine {
  final String name;
  final double quantity;
  final MedicineDosageUnit unit;
  final MedicineAdministrationRoute routeOfAdministration;
  final MedicineFrequency regimen;
  TimeOfDay time;

  Medicine(
      {@required this.name,
      @required this.quantity,
      @required this.unit,
      @required this.routeOfAdministration,
      @required this.regimen,
      this.time});
}
