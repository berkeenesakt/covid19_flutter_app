class Covid {
  final String date;
  final String totalTests;
  final String totalPatients;
  final String totalDeaths;
  final String totalIntensiveCare;
  final String totalIntubated;
  final String totalRecovered;
  final String tests;
  final String cases;
  final String patients;
  final String critical;
  final String pneumoniaPercent;
  final String deaths;
  final String recovered;

  Covid({
    this.date,
    this.totalTests,
    this.totalPatients,
    this.totalDeaths,
    this.totalIntensiveCare,
    this.totalIntubated,
    this.totalRecovered,
    this.tests,
    this.cases,
    this.patients,
    this.critical,
    this.pneumoniaPercent,
    this.deaths,
    this.recovered,
  });

  factory Covid.fromJson(Map<String, dynamic> json) {
    return Covid(
      date: json["date"],
      totalTests: json["totalTests"],
      totalPatients: json["totalPatients"],
      totalDeaths: json["totalDeaths"],
      totalIntensiveCare: json["totalIntensiveCare"],
      totalIntubated: json["totalIntubated"],
      totalRecovered: json["totalRecovered"],
      tests: json["tests"],
      cases: json["cases"] == null ? null : json["cases"],
      patients: json["patients"],
      critical: json["critical"],
      pneumoniaPercent: json["pneumoniaPercent"],
      deaths: json["deaths"],
      recovered: json["recovered"],
    );
  }
}
