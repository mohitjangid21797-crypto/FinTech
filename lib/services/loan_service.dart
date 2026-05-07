import '../models/loan.dart';
import '../models/emi_schedule.dart';
import '../utils/calculations.dart';
import 'data_storage_service.dart';
import '../services/pdf_service.dart';
import '../services/customer_service.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class LoanService {
  // In a real app, this would interact with a database or API
  static List<Loan> _loans = [];
  static List<EMISchedule> _emiSchedules = [];

  /// Initialize - load data from storage
  static Future<void> init() async {
    _loans = await DataStorageService.loadListFromJson(
      'loans.json',
      Loan.fromJson,
    );
    _emiSchedules = await DataStorageService.loadListFromJson(
      'emi_schedules.json',
      EMISchedule.fromJson,
    );
  }

  /// Force reload data from storage into memory - fixes stale data issue
  static Future<void> reloadData() async {
    await init();
  }

  /// Save all data
  static Future<bool> _saveAll() async {
    final saveLoans = DataStorageService.saveListToJson(
      'loans.json',
      _loans,
      (loan) => loan.toJson(),
    );
    final saveEmi = DataStorageService.saveListToJson(
      'emi_schedules.json',
      _emiSchedules,
      (emi) => emi.toJson(),
    );
    return (await Future.wait([saveLoans, saveEmi])).every((s) => s);
  }

  // Add a new loan
  Future<void> addLoan(Loan loan) async {
    _loans.add(loan);
    _generateEMISchedule(loan);
    await _saveAll();
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
    try {
      return _loans.firstWhere((loan) => loan.id == id);
    } catch (e) {
      return null;
    }
  }

  // Update a loan
  Future<void> updateLoan(String id, Loan updatedLoan) async {
    final index = _loans.indexWhere((loan) => loan.id == id);
    if (index != -1) {
      _loans[index] = updatedLoan;
      regenerateEMISchedule(id);
      await _saveAll();
    }
  }

  /// Regenerate EMI schedule when loan details change (amount/tenure/interest)
  void regenerateEMISchedule(String loanId) {
    // Remove old EMIs
    _emiSchedules.removeWhere((emi) => emi.loanId == loanId);

    // Get current loan (with updated values)
    final loan = getLoanById(loanId);
    if (loan != null) {
      _generateEMISchedule(loan);
    }
  }

  // Delete a loan
  Future<void> deleteLoan(String id) async {
    _loans.removeWhere((loan) => loan.id == id);
    _emiSchedules.removeWhere((emi) => emi.loanId == id);
    await _saveAll();
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
  Future<void> markEMIPaid(EMISchedule emi) async {
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
      await _saveAll();

      // Auto-generate completion PDF if loan is now completed
      if (isLoanCompleted(emi.loanId)) {
        await _autoGenerateCompletionPDF(emi.loanId);
      }
    }
  }

  /// Auto-generate PDF when loan completes (all EMIs paid)
  Future<void> _autoGenerateCompletionPDF(String loanId) async {
    final loan = getLoanById(loanId);
    if (loan == null) return;

    final customerService = CustomerService();
    final customer = customerService.getCustomerById(loan.customerId);
    if (customer == null) return;

    final emis = getEMISchedulesByLoan(loanId);

    // Check if PDF already exists to avoid duplicates
    try {
      final dir = await getApplicationDocumentsDirectory();
      final pdfDir = Directory(path.join(dir.path, 'loan_pdfs'));
      final pdfPath = path.join(pdfDir.path, 'loan_${loan.id}_completion.pdf');
      final pdfFile = File(pdfPath);
      if (await pdfFile.exists()) {
        await pdfFile.delete(); // Delete old PDF to force regeneration
      }
    } catch (e) {
      // Ignore errors, proceed to generate
    }

    try {
      await PDFService.generateLoanCompletionPDF(loan, customer, emis);
    } catch (e) {
      // Log error, but don't fail EMI marking
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
