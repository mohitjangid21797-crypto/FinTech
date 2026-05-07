import 'dart:math';
import 'dart:io';

void main() {
  stdout.write('--- EMI Calculator ---');

  // Taking User Inputs
  stdout.write('Enter Principal Amount: ');
  double principal = double.tryParse(stdin.readLineSync()!) ?? 0.0;

  stdout.write('Enter Monthly Interest Rate (%): ');
  double monthlyRate = double.tryParse(stdin.readLineSync()!) ?? 0.0;

  stdout.write('Enter Tenure in Months: ');
  int tenureMonths = int.tryParse(stdin.readLineSync()!) ?? 0;

  stdout.write('\n--- Results for Principal: $principal ---');

  // Calculate CI EMI (Total Compounded Amount Method)
  double ciEmi = Calculations.calculateEMI(principal, monthlyRate, tenureMonths, 'compound');
  stdout.write('Compound Interest EMI: ${ciEmi.toStringAsFixed(5)}');

  // Calculate SI EMI (Flat Interest Method)
  double siEmi = Calculations.calculateEMI(principal, monthlyRate, tenureMonths, 'simple');
  stdout.write('Simple Interest EMI: ${siEmi.toStringAsFixed(2)}');
}

class Calculations {
  /// Calculate EMI based on Interest Type
  static double calculateEMI(
    double principal,
    double monthlyRate,
    int tenureMonths,
    String interestType,
  ) {
    if (principal <= 0 || monthlyRate <= 0 || tenureMonths <= 0) {
      return 0;
    }

    if (interestType == 'simple') {
      return _calculateSimpleInterestEMI(principal, monthlyRate, tenureMonths);
    } else {
      return _calculateCompoundInterestEMI(principal, monthlyRate, tenureMonths);
    }
  }

  /// Simple Interest EMI
  /// Formula: (P + (P * r * n)) / n
  static double _calculateSimpleInterestEMI(
    double principal,
    double monthlyRate,
    int tenureMonths,
  ) {
    double r = monthlyRate / 100;
    double totalInterest = principal * r * tenureMonths;
    double totalAmount = principal + totalInterest;
    return totalAmount / tenureMonths;
  }

  /// Compound Interest EMI (Total Compounded Amount divided by months)
  /// Formula: (P * (1 + r)^n) / n
  static double _calculateCompoundInterestEMI(
    double principal,
    double monthlyRate,
    int tenureMonths,
  ) {
    double r = monthlyRate / 100;
    // Compounding the full amount first
    double totalCompoundedAmount = principal * pow(1 + r, tenureMonths);
    // Dividing by number of months
    return totalCompoundedAmount / tenureMonths;
  }
}