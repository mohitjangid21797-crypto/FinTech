class EMISchedule {
  final String loanId;
  final DateTime dueDate;
  final double amount;
  final bool isPaid;

  EMISchedule({
    required this.loanId,
    required this.dueDate,
    required this.amount,
    required this.isPaid,
  });

  /// Converts the EMISchedule object to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'loanId': loanId,
      'dueDate': dueDate.toIso8601String(),
      'amount': amount,
      'isPaid': isPaid,
    };
  }

  /// Creates an EMISchedule object from a JSON map.
  factory EMISchedule.fromJson(Map<String, dynamic> json) {
    return EMISchedule(
      loanId: json['loanId'],
      dueDate: DateTime.parse(json['dueDate']),
      amount: json['amount'],
      isPaid: json['isPaid'],
    );
  }
}
