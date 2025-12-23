import 'dart:math';
import 'dart:io';

void main() {
  stdout.write('--- EMI Calculator ---');

  stdout.write('Enter Principal Amount: ');
  double principal = double.tryParse(stdin.readLineSync()!) ?? 0;

  stdout.write('Enter Monthly Interest Rate (%): ');
  double monthlyRate = double.tryParse(stdin.readLineSync()!) ?? 0;

  stdout.write('Enter Tenure in Months: ');
  int tenureMonths = int.tryParse(stdin.readLineSync()!) ?? 0;

 stdout.write('\n--- Results ---');

  // Calculate CI EMI
  double ciEmi = Calculations.calculateEMI(principal, monthlyRate, tenureMonths, 'compound');
  double totalCiInterest = Calculations.calculateTotalInterest(principal, ciEmi, tenureMonths);

  // Calculate SI EMI
  double siEmi = Calculations.calculateEMI(principal, monthlyRate, tenureMonths, 'simple');
  double totalSiInterest = Calculations.calculateTotalInterest(principal, siEmi, tenureMonths);

  stdout.write('Compound Interest (Reducing Balance):');
  stdout.write('  EMI: ${ciEmi.toStringAsFixed(2)}');
  stdout.write('  Total Interest: ${totalCiInterest.toStringAsFixed(2)}');

  stdout.write('\nSimple Interest (Flat Rate):');
  stdout.write('  Total Interest: ${totalSiInterest.toStringAsFixed(2)}');
}

class Calculations {
  /// Main EMI Calculation logic
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

  /// Simple Interest EMI logic
  static double _calculateSimpleInterestEMI(
    double principal,
    double monthlyRate,
    int tenureMonths,
  ) {
    double totalInterest = principal * (monthlyRate / 100) * tenureMonths;
    double totalAmount = principal + totalInterest;
    return totalAmount / tenureMonths;
  }

  /// Compound Interest EMI logic
  static double _calculateCompoundInterestEMI(
    double principal,
    double monthlyRate,
    int tenureMonths,
  ) {
    final double r = monthlyRate / 100;
    final num powerTerm = pow(1 + r, tenureMonths);
    return (principal * r * powerTerm) / (powerTerm - 1);
  }

  static double calculateTotalInterest(double principal, double emi, int tenureMonths) {
    return (emi * tenureMonths) - principal;
  }
}