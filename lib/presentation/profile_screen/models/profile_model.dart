class Profile {
  final String? id;
  final String? fullName;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? jobTitle;
  final String? image;
  final String? createdAt;
  final String? updatedAt;
  final String? email;
  final String? phoneNumber;
  final bool? phoneNumberVerified;
  final String? role;

  Profile({
    this.id,
    this.fullName,
    this.firstName,
    this.middleName,
    this.lastName,
    this.jobTitle,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.email,
    this.phoneNumber,
    this.phoneNumberVerified,
    this.role,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    final formattedProfile = json['formattedProfile'] ?? {};

    return Profile(
      id: formattedProfile['id'],
      fullName: formattedProfile['fullName'],
      firstName: formattedProfile['firstName'],
      middleName: formattedProfile['middleName'],
      lastName: formattedProfile['lastName'],
      jobTitle: formattedProfile['jobTitle'],
      image: formattedProfile['image'],
      createdAt: formattedProfile['createdAt'],
      updatedAt: formattedProfile['updatedAt'],
      email: formattedProfile['email'],
      phoneNumber: formattedProfile['phoneNumber'],
      phoneNumberVerified: formattedProfile['phoneNumberVerified'],
      role: formattedProfile['role'],
    );
  }
}
