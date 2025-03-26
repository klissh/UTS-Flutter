class ScheduleDetails {
  final String name;
  final String type;
  final String startTime;
  final String endTime;
  final String description;

  ScheduleDetails({
    required this.name,
    required this.type,
    required this.startTime,
    required this.endTime,
    required this.description,
  });

  // Konversi ke JSON
  Map<String, dynamic> toJson() => {
        'name': name,
        'type': type,
        'startTime': startTime,
        'endTime': endTime,
        'description': description,
      };

  // Konversi dari JSON
  factory ScheduleDetails.fromJson(Map<String, dynamic> json) {
    return ScheduleDetails(
      name: json['name'],
      type: json['type'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      description: json['description'],
    );
  }
}