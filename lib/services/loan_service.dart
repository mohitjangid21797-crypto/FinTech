import '../models/loan.dart';
import '../models/emi_schedule.dart';
import '../utils/calculations.dart';

class LoanService {
  // In a real app, this would interact with a database or API
  static final List<Loan> _loans = [];
  static final List<EMISchedule> _emiSchedules = [];

  // Add a new loan
  void addLoan(Loan loan) {
    _loans.add(loan);
    _generateEMISchedule(loan);
  }

  // Get all loans
  List<Loan> getLoans() {
    return _loans;
  }

  // Get loans by customer ID
  List<Loan> getLoansByCustomer(String customerId) {
    return _loans.where((loan) => loan.customerId == customerId).toList();
  }

  // Get a loan by ID
  Loan? getLoanById(String id) {
    return _loans.firstWhere((loan) => loan.id == id);
  }

  // Update a loan
  void updateLoan(String id, Loan updatedLoan) {
    final index = _loans.indexWhere((loan) => loan.id == id);
    if (index != -1) {
      _loans[index] = updatedLoan;
    }
  }

  // Delete a loan
  void deleteLoan(String id) {
    _loans.removeWhere((loan) => loan.id == id);
    _emiSchedules.removeWhere((emi) => emi.loanId == id);
  }

  // Calculate EMI
  double calculateEMI(
    double principal,
    double rate,
    int tenure,
    String interestType,
  ) {
    return Calculations.calculateEMI(principal, rate, tenure, interestType);
  }

  // Generate EMI schedule for a loan
  void _generateEMISchedule(Loan loan) {
    final emiAmount = loan.emi;
    final startDate = loan.startDate;
    for (int i = 1; i <= loan.tenure; i++) {
      final dueDate = DateTime(
        startDate.year,
        startDate.month + i,
        startDate.day,
      );
      final emi = EMISchedule(
        loanId: loan.id,
        dueDate: dueDate,
        amount: emiAmount,
        isPaid: false,
      );
      _emiSchedules.add(emi);
    }
  }

  // Get EMI schedules
  List<EMISchedule> getEMISchedules() {
    return _emiSchedules;
  }

  // Get EMI schedules by loan ID
  List<EMISchedule> getEMISchedulesByLoan(String loanId) {
    return _emiSchedules.where((emi) => emi.loanId == loanId).toList();
  }

  // Mark EMI as paid
  void markEMIPaid(EMISchedule emi) {
    final index = _emiSchedules.indexWhere(
      (e) => e.loanId == emi.loanId && e.dueDate == emi.dueDate,
    );
    if (index != -1) {
      _emiSchedules[index] = EMISchedule(
        loanId: emi.loanId,
        dueDate: emi.dueDate,
        amount: emi.amount,
        isPaid: true,
      );
    }
  }

  // Get total loan amount disbursed
  double getTotalLoanAmount() {
    return _loans.fold(0.0, (sum, loan) => sum + loan.amount);
  }

  // Get total profit earned (total interest collected)
  double getTotalProfit() {
    return _loans.fold(0.0, (sum, loan) {
      final totalPaid = loan.emi * loan.tenure;
      final interest = totalPaid - loan.amount;
      return sum + interest;
    });
  }

  // Check if a loan is completed (all EMIs paid)
  bool isLoanCompleted(String loanId) {
    final emis = getEMISchedulesByLoan(loanId);
    return emis.isNotEmpty && emis.every((emi) => emi.isPaid);
  }
}
