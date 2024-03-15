class BookingModel {
  final String? equipmentId;
  final String? name;
  final String? email;
  final String? startDate;
  final String? endDate;
  final String? location;
  final int? quantity;
  final String? signature;
  final bool? termsAndConditions;

  BookingModel({
    required this.equipmentId,
    required this.name,
    required this.email,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.quantity,
    required this.signature,
    required this.termsAndConditions,
  });

  Map<String, dynamic> toJson() {
    return {
      'equipmentId': equipmentId ?? '',
      'name': name ?? '',
      'email': email ?? '',
      'startDate': startDate ?? '',
      'endDate': endDate ?? '',
      'location': location ?? '',
      'quantity': quantity ?? 0,
      'signature': signature ?? '',
      'termsAndConditions': termsAndConditions ?? false,
    };
  }
}
