class Customer {
  final String id;
  final String name;
  final String mobile;
  final String email;
  final String location;
  final bool smsConsent;

  Customer({
    required this.id,
    required this.name,
    required this.mobile,
    required this.email,
    required this.location,
    this.smsConsent = false,
  });

  /// Converts the Customer object to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'mobile': mobile,
      'email': email,
      'location': location,
      'smsConsent': smsConsent,
    };
  }

  /// Creates a Customer object from a JSON map.
  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      name: json['name'],
      mobile: json['mobile'],
      email: json['email'],
      location: json['location'],
      smsConsent: json['smsConsent'] ?? false,
    );
  }
}
