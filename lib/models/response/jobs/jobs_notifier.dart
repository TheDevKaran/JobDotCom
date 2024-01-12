import 'dart:convert';

List<jobsNotifier> jobsResponseFromJson(String str) => List<jobsNotifier>.from(json.decode(str).map((x) => jobsNotifier.fromJson(x)));

class jobsNotifier {
  jobsNotifier({
    required this.id,
    required this.title,
    required this.location,
    required this.company,
    required this.hiring,
    required this.description,
    required this.salary,
    required this.period,
    required this.contract,
    required this.requirements,
    required this.imageUrl,
    required this.agentId,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String title;
  final String location;
  final String company;
  final bool hiring;
  final String description;
  final String salary;
  final String period;
  final String contract;
  final List<String> requirements;
  final String imageUrl;
  final String agentId;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory jobsNotifier.fromJson(Map<String, dynamic> json) => jobsNotifier(
    id: json["_id"],
    title: json["title"],
    location: json["location"],
    company: json["company"],
    hiring: json["hiring"],
    description: json["description"],
    salary: json["salary"],
    period: json["period"],
    contract: json["contract"],
    requirements: List<String>.from(json["requirements"].map((x) => x)),
    imageUrl: json["imageUrl"],
    agentId: json["agentId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

}
