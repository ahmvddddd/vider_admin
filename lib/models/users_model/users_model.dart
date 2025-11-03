class UsersModel {
  final String userId;
  final String firstname;
  final String lastname;
  final String username;
  final String email;
  final bool isIdVerified;
  final String userType;
  final double rating;
  final String category;
  final String service;
  final String bio;
  final String verificationStatus;

  UsersModel({
    required this.userId,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.username,
    required this.isIdVerified,
    required this.userType,
    required this.rating,
    required this.category,
    required this.service,
    required this.bio,
    required this.verificationStatus,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      userId: json['userId'] ?? '',
      firstname: json['firstname'] ?? '',
      lastname: json['lastname'] ?? '',
      email: json['email'] ?? '',
      username: json['username'] ?? '',
      isIdVerified: json['isIdVerified'] ?? false,
      userType: json['userType'],
      rating: (json['rating'] ?? 0).toDouble(),
      category: json['category'] ?? '',
      service: json['service'],
      bio: json['bio'] ?? '',
      verificationStatus: json['verificationStatus'] ?? 'denied',
    );
  }
}
