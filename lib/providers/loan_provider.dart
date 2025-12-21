import 'package:flutter/foundation.dart';
import '../models/loan.dart';
import '../services/loan_service.dart';

class LoanProvider with ChangeNotifier {
  final LoanService _loanService = LoanService();
  List<Loan> _loans = [];

  List<Loan> get loans => _loans;

  LoanProvider() {
    loadLoans();
  }

  void loadLoans() {
    _loans = _loanService.getLoans();
    notifyListeners();
  }

  void addLoan(Loan loan) {
    _loanService.addLoan(loan);
    loadLoans();
  }

  void updateLoan(String id, Loan updatedLoan) {
    _loanService.updateLoan(id, updatedLoan);
    loadLoans();
  }

  void deleteLoan(String id) {
    _loanService.deleteLoan(id);
    loadLoans();
  }

  Loan? getLoanById(String id) {
    return _loanService.getLoanById(id);
  }

  List<Loan> getLoansByCustomer(String customerId) {
    return _loanService.getLoansByCustomer(customerId);
  }
}
