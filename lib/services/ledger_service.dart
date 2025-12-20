import '../models/ledger_entry.dart';
import '../models/customer.dart';
import 'customer_service.dart';
import 'loan_service.dart';

class LedgerService {
  // In a real app, this would interact with a database or API
  static final Map<String, List<LedgerEntry>> _customerLedgers = {};

  // Generate ledger entries for all customers
  void generateAllLedgers() {
    _customerLedgers.clear();
    final customers = CustomerService().getCustomers();

    for (final customer in customers) {
      _generateCustomerLedger(customer.id);
    }
  }

  // Generate ledger entries for a specific customer
  void _generateCustomerLedger(String customerId) {
    final customer = CustomerService().getCustomerById(customerId);
    if (customer == null) return;

    final customerLoans = LoanService().getLoansByCustomer(customerId);
    final ledgerEntries = <LedgerEntry>[];

    double runningBalance = 0.0;

    // Sort loans by start date
    customerLoans.sort((a, b) => a.startDate.compareTo(b.startDate));

    for (final loan in customerLoans) {
      // Add loan disbursement as credit (money given to customer)
      runningBalance += loan.amount;
      ledgerEntries.add(
        LedgerEntry(
          customerId: customerId,
          date: loan.startDate,
          description: 'Loan disbursed - ₹${loan.amount.toStringAsFixed(2)}',
          credit: loan.amount,
          debit: 0.0,
          balance: runningBalance,
          loanId: loan.id,
        ),
      );

      // Add EMI payments
      final emis = LoanService().getEMISchedulesByLoan(loan.id);
      emis.sort((a, b) => a.dueDate.compareTo(b.dueDate));

      for (final emi in emis) {
        if (emi.isPaid) {
          // EMI payment as debit (money received from customer)
          runningBalance -= emi.amount;
          ledgerEntries.add(
            LedgerEntry(
              customerId: customerId,
              date: emi.dueDate,
              description: 'EMI payment - ₹${emi.amount.toStringAsFixed(2)}',
              credit: 0.0,
              debit: emi.amount,
              balance: runningBalance,
              loanId: loan.id,
              emiId: '${emi.loanId}_${emi.dueDate.toIso8601String()}',
            ),
          );
        } else {
          // Pending EMI as potential debit (not yet paid)
          // For ledger purposes, we might want to show pending amounts differently
          // For now, we'll skip pending EMIs or show them as zero-impact entries
        }
      }
    }

    // Sort entries by date
    ledgerEntries.sort((a, b) => a.date.compareTo(b.date));

    // Recalculate running balance to ensure accuracy
    double recalculatedBalance = 0.0;
    for (int i = 0; i < ledgerEntries.length; i++) {
      recalculatedBalance += ledgerEntries[i].credit - ledgerEntries[i].debit;
      ledgerEntries[i] = LedgerEntry(
        customerId: ledgerEntries[i].customerId,
        date: ledgerEntries[i].date,
        description: ledgerEntries[i].description,
        credit: ledgerEntries[i].credit,
        debit: ledgerEntries[i].debit,
        balance: recalculatedBalance,
        loanId: ledgerEntries[i].loanId,
        emiId: ledgerEntries[i].emiId,
      );
    }

    _customerLedgers[customerId] = ledgerEntries;
  }

  // Get ledger entries for a specific customer
  List<LedgerEntry> getCustomerLedger(String customerId) {
    if (!_customerLedgers.containsKey(customerId)) {
      _generateCustomerLedger(customerId);
    }
    return _customerLedgers[customerId] ?? [];
  }

  // Get all customer ledgers
  Map<String, List<LedgerEntry>> getAllLedgers() {
    generateAllLedgers();
    return _customerLedgers;
  }

  // Get customers with outstanding balances
  List<Customer> getCustomersWithOutstandingBalances() {
    final customers = CustomerService().getCustomers();
    return customers.where((customer) {
      final ledger = getCustomerLedger(customer.id);
      return ledger.isNotEmpty && ledger.last.balance > 0;
    }).toList();
  }

  // Get total outstanding amount across all customers
  double getTotalOutstandingAmount() {
    double total = 0.0;
    for (final customer in CustomerService().getCustomers()) {
      final ledger = getCustomerLedger(customer.id);
      if (ledger.isNotEmpty) {
        total += ledger.last.balance;
      }
    }
    return total;
  }

  // Get total amount collected (all debits)
  double getTotalAmountCollected() {
    double total = 0.0;
    for (final ledger in _customerLedgers.values) {
      for (final entry in ledger) {
        total += entry.debit;
      }
    }
    return total;
  }

  // Get total amount disbursed (all credits)
  double getTotalAmountDisbursed() {
    double total = 0.0;
    for (final ledger in _customerLedgers.values) {
      for (final entry in ledger) {
        total += entry.credit;
      }
    }
    return total;
  }

  // Refresh ledger for a specific customer (after loan/EMI changes)
  void refreshCustomerLedger(String customerId) {
    _generateCustomerLedger(customerId);
  }

  // Get ledger summary for a customer
  Map<String, double> getCustomerLedgerSummary(String customerId) {
    final ledger = getCustomerLedger(customerId);
    if (ledger.isEmpty) {
      return {
        'totalCredit': 0.0,
        'totalDebit': 0.0,
        'outstandingBalance': 0.0,
        'transactionCount': 0.0,
      };
    }

    double totalCredit = 0.0;
    double totalDebit = 0.0;

    for (final entry in ledger) {
      totalCredit += entry.credit;
      totalDebit += entry.debit;
    }

    return {
      'totalCredit': totalCredit,
      'totalDebit': totalDebit,
      'outstandingBalance': ledger.last.balance,
      'transactionCount': ledger.length.toDouble(),
    };
  }
}
