class Loan {
  final String id;
  final String customerId;
  final double amount;
  final double interestRate;
  final int tenure; // in months
  final String interestType; // e.g., 'simple' or 'compound'
  final DateTime startDate;
  final DateTime endDate;
  final double emi;

  Loan({
    required this.id,
    required this.customerId,
    required this.amount,
    required this.interestRate,
    required this.tenure,
    required this.interestType,
    required this.startDate,
    required this.endDate,
    required this.emi,
  });

  /// Converts the Loan object to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'amount': amount,
      'interestRate': interestRate,
      'tenure': tenure,
      'interestType': interestType,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'emi': emi,
    };
  }

  /// Creates a Loan object from a JSON map.
  factory Loan.fromJson(Map<String, dynamic> json) {
    return Loan(
      id: json['id'],
      customerId: json['customerId'],
      amount: json['amount'],
      interestRate: json['interestRate'],
      tenure: json['tenure'],
      interestType: json['interestType'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      emi: json['emi'],
    );
  }
}
