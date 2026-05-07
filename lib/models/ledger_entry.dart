class LedgerEntry {
  final String customerId;
  final DateTime date;
  final String description;
  final double credit; // Money coming in (loan disbursement)
  final double debit; // Money going out (EMI payment)
  final double balance; // Running balance after this entry
  final String? loanId; // Reference to loan if applicable
  final String? emiId; // Reference to EMI if applicable

  LedgerEntry({
    required this.customerId,
    required this.date,
    required this.description,
    this.credit = 0.0,
    this.debit = 0.0,
    required this.balance,
    this.loanId,
    this.emiId,
  });

  /// Converts the LedgerEntry object to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'date': date.toIso8601String(),
      'description': description,
      'credit': credit,
      'debit': debit,
      'balance': balance,
      'loanId': loanId,
      'emiId': emiId,
    };
  }

  /// Creates a LedgerEntry object from a JSON map.
  factory LedgerEntry.fromJson(Map<String, dynamic> json) {
    return LedgerEntry(
      customerId: json['customerId'],
      date: DateTime.parse(json['date']),
      description: json['description'],
      credit: json['credit'] ?? 0.0,
      debit: json['debit'] ?? 0.0,
      balance: json['balance'],
      loanId: json['loanId'],
      emiId: json['emiId'],
    );
  }
}
