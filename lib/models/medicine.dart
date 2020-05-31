enum MedicineFrequency { daily, weekly, monthly, emergency }

class Medicine {
  final String name;
  final double dosage;
  final String routeOfAdministration;
  MedicineFrequency frequency;
  DateTime time;
  DateTime day;
  DateTime date;

  Medicine.daily(this.name, this.dosage, this.routeOfAdministration) {
    this.frequency = MedicineFrequency.daily;
    // TODO: set the time
  }

  Medicine.weekly(
      this.name, this.dosage, this.routeOfAdministration, this.time) {
    this.frequency = MedicineFrequency.weekly;
    // TODO: set the day and time
  }

  Medicine.monthly(this.name, this.dosage, this.routeOfAdministration) {
    this.frequency = MedicineFrequency.monthly;
    // TODO: set the date and time
  }

  Medicine.emergency(this.name, this.dosage, this.routeOfAdministration) {
    this.frequency = MedicineFrequency.emergency;
  }
}
