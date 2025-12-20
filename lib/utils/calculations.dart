import 'dart:math';

class Calculations {
  /// Calculate EMI (Equated Monthly Installment)
  ///
  /// Rules:
  /// - Simple Interest: Interest calculated only on principal
  /// - Compound Interest: Reducing balance (bank standard)
  /// - For same inputs: CI EMI > SI EMI (always)
  static double calculateEMI(
    double principal,
    double annualRate,
    int tenureMonths,
    String interestType,
  ) {
    if (principal <= 0 || annualRate <= 0 || tenureMonths <= 0) {
      return 0;
    }

    if (interestType == 'simple') {
      return _calculateSimpleInterestEMI(
        principal,
        annualRate,
        tenureMonths,
      );
    } else {
      return _calculateCompoundInterestEMI(
        principal,
        annualRate,
        tenureMonths,
      );
    }
  }

  /// Simple Interest EMI
  /// Formula:
  /// Total Interest = (P × R × T) / 100
  /// EMI = (Principal + Total Interest) / Months
  static double _calculateSimpleInterestEMI(
    double principal,
    double annualRate,
    int tenureMonths,
  ) {
    final tenureYears = tenureMonths / 12;
    final totalInterest =
        principal * annualRate * tenureYears / 100;
    final totalAmount = principal + totalInterest;
    return totalAmount / tenureMonths;
  }

  /// Compound Interest EMI (Reducing Balance)
  /// Standard banking EMI formula
  static double _calculateCompoundInterestEMI(
    double principal,
    double annualRate,
    int tenureMonths,
  ) {
    final monthlyRate = annualRate / (12 * 100);

    final emi = (principal *
            monthlyRate *
            pow(1 + monthlyRate, tenureMonths)) /
        (pow(1 + monthlyRate, tenureMonths) - 1);

    return emi;
  }

  /// Total interest paid
  static double calculateTotalInterest(
    double principal,
    double emi,
    int tenureMonths,
  ) {
    return (emi * tenureMonths) - principal;
  }

  /// Total amount paid (Principal + Interest)
  static double calculateTotalAmount(
    double emi,
    int tenureMonths,
  ) {
    return emi * tenureMonths;
  }
}
