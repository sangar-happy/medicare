import 'package:flutter/foundation.dart';

@immutable
class Medicine {
  final String medicineName;
  final double medicineDosage;
  final String routeOfAdministration;
  final DateTime medicineRegimen;
  Medicine(this.medicineName, this.medicineDosage, this.routeOfAdministration,
      this.medicineRegimen);
}