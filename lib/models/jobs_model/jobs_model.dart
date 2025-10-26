class JobsModel {
  final String id;
  final String employerId;
  final String providerId;
  final String? employerImage;
  final String? providerImage;
  final String employerName;
  final String providerName;
  final String jobTitle;
  final double pay;
  final String status;
  final int duration;
  final DateTime startTime;
  final DateTime createdAt;
  final DateTime updatedAt;

  JobsModel({
    required this.id,
    required this.employerId,
    required this.providerId,
    this.employerImage,
    this.providerImage,
    required this.employerName,
    required this.providerName,
    required this.jobTitle,
    required this.pay,
    required this.status,
    required this.duration,
    required this.startTime,
    required this.createdAt,
    required this.updatedAt,
  });

  factory JobsModel.fromJson(Map<String, dynamic> json) {
    return JobsModel(
      id: json['_id'] ?? '',
      employerId: json['employerId'] ?? '',
      providerId: json['providerId'] ?? '',
      employerImage: json['employerImage'],
      providerImage: json['providerImage'],
      employerName: json['employerName'] ?? '', 
      providerName: json['providerName'] ?? '',
      jobTitle: json['jobTitle'] ?? '',
      pay: (json['pay'] ?? 0).toDouble(),
      status: json['status'] ?? 'Pending',
      duration: json['duration'] ?? 0,
      startTime: DateTime.parse(json['startTime'] ?? DateTime.now().toIso8601String()),
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }
}