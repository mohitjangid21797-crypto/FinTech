import 'package:flutter/material.dart';
import '../models/loan.dart';
import '../models/emi_schedule.dart';
import '../models/customer.dart';
import '../services/loan_service.dart';
import '../services/customer_service.dart';
import '../services/pdf_service.dart';
import '../utils/theme.dart';

class LoanSummaryScreen extends StatefulWidget {
  final Loan loan;

  const LoanSummaryScreen({super.key, required this.loan});

  @override
  LoanSummaryScreenState createState() => LoanSummaryScreenState();
}

class LoanSummaryScreenState extends State<LoanSummaryScreen> {
  late List<EMISchedule> _emiSchedules;
  late Customer? _customer;
  bool _isGeneratingPDF = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    _emiSchedules = LoanService().getEMISchedulesByLoan(widget.loan.id);
    _customer = CustomerService().getCustomerById(widget.loan.customerId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isCompleted = LoanService().isLoanCompleted(widget.loan.id);
    final totalPaid = _emiSchedules.where((emi) => emi.isPaid).length;
    final totalEMIs = _emiSchedules.length;
    final remainingBalance = (totalEMIs - totalPaid) * widget.loan.emi;

    return Scaffold(
      appBar: AppBar(title: const Text('Loan Summary'), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Customer Details Card
            _buildCustomerDetailsCard(),

            const SizedBox(height: 16.0),

            // Loan Details Card
            _buildLoanDetailsCard(),

            const SizedBox(height: 16.0),

            // Payment Summary Card
            _buildPaymentSummaryCard(totalPaid, totalEMIs, remainingBalance),

            const SizedBox(height: 24.0),

            // PDF Generation Button
            if (isCompleted)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _isGeneratingPDF ? null : _generatePDF,
                  icon: _isGeneratingPDF
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                      : const Icon(Icons.picture_as_pdf),
                  label: Text(
                    _isGeneratingPDF ? 'Generating PDF...' : 'Generate PDF',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.secondaryGreen,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              )
            else
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: Colors.orange.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: Colors.orange),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: Text(
                        'PDF generation is available only when all EMIs are paid.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.orange[800],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerDetailsCard() {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppTheme.primaryBlue.withValues(alpha: 0.1),
                  child: Icon(Icons.person, color: AppTheme.primaryBlue),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _customer?.name ?? 'Unknown Customer',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Loan ID: ${widget.loan.id.substring(0, 8)}...',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            if (_customer != null) ...[
              _buildDetailRow('Mobile', _customer!.mobile),
              _buildDetailRow('Email', _customer!.email),
              _buildDetailRow('Location', _customer!.location),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLoanDetailsCard() {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Loan Details',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: _buildLoanDetailItem(
                    'Principal',
                    '₹${widget.loan.amount.toStringAsFixed(2)}',
                    Icons.attach_money,
                  ),
                ),
                Expanded(
                  child: _buildLoanDetailItem(
                    'EMI',
                    '₹${widget.loan.emi.toStringAsFixed(2)}',
                    Icons.payment,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                Expanded(
                  child: _buildLoanDetailItem(
                    'Interest Rate',
                    '${widget.loan.interestRate}%',
                    Icons.percent,
                  ),
                ),
                Expanded(
                  child: _buildLoanDetailItem(
                    'Tenure',
                    '${widget.loan.tenure} months',
                    Icons.calendar_today,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            _buildDetailRow(
              'Start Date',
              widget.loan.startDate.toLocal().toString().split(' ')[0],
            ),
            _buildDetailRow(
              'End Date',
              widget.loan.endDate.toLocal().toString().split(' ')[0],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentSummaryCard(
    int totalPaid,
    int totalEMIs,
    double remainingBalance,
  ) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Summary',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: _buildPaymentItem(
                    'Total EMIs',
                    totalEMIs.toString(),
                    Icons.list_alt,
                  ),
                ),
                Expanded(
                  child: _buildPaymentItem(
                    'Paid EMIs',
                    totalPaid.toString(),
                    Icons.check_circle,
                    color: AppTheme.secondaryGreen,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                Expanded(
                  child: _buildPaymentItem(
                    'Remaining EMIs',
                    (totalEMIs - totalPaid).toString(),
                    Icons.pending,
                    color: Colors.orange,
                  ),
                ),
                Expanded(
                  child: _buildPaymentItem(
                    'Remaining Balance',
                    '₹${remainingBalance.toStringAsFixed(2)}',
                    Icons.account_balance_wallet,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppTheme.textSecondary,
            ),
          ),
          Expanded(
            child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }

  Widget _buildLoanDetailItem(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 20.0, color: AppTheme.primaryBlue),
        const SizedBox(width: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppTheme.textSecondary),
            ),
            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentItem(
    String label,
    String value,
    IconData icon, {
    Color? color,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20.0, color: color ?? AppTheme.primaryBlue),
        const SizedBox(width: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppTheme.textSecondary),
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _generatePDF() async {
    if (_customer == null) return;

    setState(() => _isGeneratingPDF = true);

    try {
      final pdfFile = await PDFService.generateLoanCompletionPDF(
        widget.loan,
        _customer!,
        _emiSchedules,
      );

      await PDFService.sharePDFViaWhatsApp(pdfFile, _customer!.mobile);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('PDF generated and shared successfully!'),
            backgroundColor: AppTheme.secondaryGreen,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error generating PDF: $e'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        );
      }
    } finally {
      setState(() => _isGeneratingPDF = false);
    }
  }
}
