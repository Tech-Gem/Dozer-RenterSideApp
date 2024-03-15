class ConstructionMachineModel {
  final String id;
  final String name;
  final int quantity;
  final String pricePerHour;
  final String location;
  final String description;
  final String category;
  final String image;
  final String capacity;
  final String model;
  final List<String> specifications;
  final bool transportation;
  final String renterProfileId;
  final String createdAt;
  final String updatedAt;

  ConstructionMachineModel({
    required this.id,
    required this.name,
    required this.quantity,
    required this.pricePerHour,
    required this.location,
    required this.description,
    required this.category,
    required this.image,
    required this.capacity,
    required this.model,
    required this.specifications,
    required this.transportation,
    required this.renterProfileId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ConstructionMachineModel.fromJson(Map<String, dynamic>? json) {
    return ConstructionMachineModel(
      id: json?['id'] as String? ?? '',
      name: json?['name'] as String? ?? '',
      quantity: json?['quantity'] as int? ?? 0,
      pricePerHour: json?['pricePerHour'] as String? ?? '',
      location: json?['location'] as String? ?? '',
      description: json?['description'] as String? ?? '',
      category: json?['category'] as String? ?? '',
      image: json?['image'] as String? ?? '',
      capacity: json?['capacity'] as String? ?? '',
      model: json?['model'] as String? ?? '',
      specifications: (json?['specifications'] as List<dynamic>?)?.cast<String>() ?? [],
      transportation: json?['transportation'] as bool? ?? false,
      renterProfileId: json?['renterProfileId'] as String? ?? '',
      createdAt: json?['createdAt'] as String? ?? '',
      updatedAt: json?['updatedAt'] as String? ?? '',
    );
  }
}
