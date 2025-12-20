import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/loan.dart';
import '../models/customer.dart';
import '../models/emi_schedule.dart';

// PDF Theme Colors
class PDFTheme {
  static const PdfColor primaryBlue = PdfColor.fromInt(0xFF1A73E8);
  static const PdfColor secondaryGreen = PdfColor.fromInt(0xFF34A853);
  static const PdfColor accentGreen = PdfColor.fromInt(0xFF00C853);
  static const PdfColor backgroundWhite = PdfColor.fromInt(0xFFFFFFFF);
  static const PdfColor surfaceGrey = PdfColor.fromInt(0xFFF5F5F5);
  static const PdfColor textPrimary = PdfColor.fromInt(0xFF202124);
  static const PdfColor textSecondary = PdfColor.fromInt(0xFF5F6368);
}

class PDFService {
  static Future<File> generateLoanCompletionPDF(
    Loan loan,
    Customer customer,
    List<EMISchedule> emis,
  ) async {
    final pdf = pw.Document();

    // Retrieve lender details from shared preferences
    final prefs = await SharedPreferences.getInstance();
    final lenderName = prefs.getString('lenderName') ?? 'N/A';
    final lenderMobile = prefs.getString('lenderMobile') ?? 'N/A';
    final lenderEmail = prefs.getString('lenderEmail') ?? 'N/A';
    final lenderLocation = prefs.getString('lenderLocation') ?? 'N/A';

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(40),
        build: (pw.Context context) {
          return [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Header
                pw.Container(
                  padding: pw.EdgeInsets.all(16),
                  decoration: pw.BoxDecoration(
                    color: PDFTheme.primaryBlue,
                    borderRadius: pw.BorderRadius.circular(8),
                  ),
                  child: pw.Center(
                    child: pw.Text(
                      'Loan Completion Certificate',
                      style: pw.TextStyle(
                        fontSize: 24,
                        fontWeight: pw.FontWeight.bold,
                        color: PDFTheme.backgroundWhite,
                      ),
                    ),
                  ),
                ),
                pw.SizedBox(height: 20),

                // Lender and Customer Details in same row
                pw.Row(
                  children: [
                    pw.Expanded(
                      child: pw.Container(
                        padding: pw.EdgeInsets.all(12),
                        decoration: pw.BoxDecoration(
                          color: PDFTheme.surfaceGrey,
                          border: pw.Border.all(
                            color: PDFTheme.accentGreen,
                            width: 1,
                          ),
                          borderRadius: pw.BorderRadius.circular(8),
                        ),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              'Lender Details:',
                              style: pw.TextStyle(
                                fontSize: 18,
                                fontWeight: pw.FontWeight.bold,
                                color: PDFTheme.accentGreen,
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Text(
                              'Name: $lenderName',
                              style: pw.TextStyle(color: PDFTheme.textPrimary),
                            ),
                            pw.Text(
                              'Mobile: $lenderMobile',
                              style: pw.TextStyle(color: PDFTheme.textPrimary),
                            ),
                            pw.Text(
                              'Email: $lenderEmail',
                              style: pw.TextStyle(color: PDFTheme.textPrimary),
                            ),
                            pw.Text(
                              'Location: $lenderLocation',
                              style: pw.TextStyle(color: PDFTheme.textPrimary),
                            ),
                          ],
                        ),
                      ),
                    ),
                    pw.SizedBox(width: 20),
                    pw.Expanded(
                      child: pw.Container(
                        padding: pw.EdgeInsets.all(12),
                        decoration: pw.BoxDecoration(
                          color: PDFTheme.surfaceGrey,
                          border: pw.Border.all(
                            color: PDFTheme.primaryBlue,
                            width: 1,
                          ),
                          borderRadius: pw.BorderRadius.circular(8),
                        ),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              'Customer Details:',
                              style: pw.TextStyle(
                                fontSize: 18,
                                fontWeight: pw.FontWeight.bold,
                                color: PDFTheme.primaryBlue,
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Text(
                              'Name: ${customer.name}',
                              style: pw.TextStyle(color: PDFTheme.textPrimary),
                            ),
                            pw.Text(
                              'Mobile: ${customer.mobile}',
                              style: pw.TextStyle(color: PDFTheme.textPrimary),
                            ),
                            pw.Text(
                              'Email: ${customer.email}',
                              style: pw.TextStyle(color: PDFTheme.textPrimary),
                            ),
                            pw.Text(
                              'Location: ${customer.location}',
                              style: pw.TextStyle(color: PDFTheme.textPrimary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 20),

                // Loan Details
                pw.Container(
                  padding: pw.EdgeInsets.all(12),
                  decoration: pw.BoxDecoration(
                    color: PDFTheme.surfaceGrey,
                    border: pw.Border.all(
                      color: PDFTheme.secondaryGreen,
                      width: 1,
                    ),
                    borderRadius: pw.BorderRadius.circular(8),
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Loan Details:',
                        style: pw.TextStyle(
                          fontSize: 18,
                          fontWeight: pw.FontWeight.bold,
                          color: PDFTheme.secondaryGreen,
                        ),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        'Loan ID: ${loan.id}',
                        style: pw.TextStyle(color: PDFTheme.textPrimary),
                      ),
                      pw.Text(
                        'Principal Amount: Rs. ${loan.amount.toStringAsFixed(2)}',
                        style: pw.TextStyle(color: PDFTheme.textPrimary),
                      ),
                      pw.Text(
                        'Interest Rate: ${loan.interestRate}%',
                        style: pw.TextStyle(color: PDFTheme.textPrimary),
                      ),
                      pw.Text(
                        'Tenure: ${loan.tenure} months',
                        style: pw.TextStyle(color: PDFTheme.textPrimary),
                      ),
                      pw.Text(
                        'EMI Amount: Rs. ${loan.emi.toStringAsFixed(2)}',
                        style: pw.TextStyle(color: PDFTheme.textPrimary),
                      ),
                      pw.Text(
                        'Start Date: ${loan.startDate.toString().split(' ')[0]}',
                        style: pw.TextStyle(color: PDFTheme.textPrimary),
                      ),
                      pw.Text(
                        'End Date: ${loan.endDate.toString().split(' ')[0]}',
                        style: pw.TextStyle(color: PDFTheme.textPrimary),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 20),

                // EMI Schedule Summary
                pw.Text(
                  'EMI Payment Summary:',
                  style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                    color: PDFTheme.secondaryGreen,
                  ),
                ),
                pw.SizedBox(height: 10),
                pw.Table(
                  border: pw.TableBorder.all(
                    color: PDFTheme.primaryBlue,
                    width: 1,
                  ),
                  defaultColumnWidth: pw.IntrinsicColumnWidth(),
                  children: [
                    // Header row
                    pw.TableRow(
                      decoration: pw.BoxDecoration(color: PDFTheme.primaryBlue),
                      children: [
                        pw.Container(
                          padding: pw.EdgeInsets.all(8),
                          child: pw.Text(
                            'Due Date',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              color: PDFTheme.backgroundWhite,
                            ),
                          ),
                        ),
                        pw.Container(
                          padding: pw.EdgeInsets.all(8),
                          child: pw.Text(
                            'Amount',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              color: PDFTheme.backgroundWhite,
                            ),
                          ),
                        ),
                        pw.Container(
                          padding: pw.EdgeInsets.all(8),
                          child: pw.Text(
                            'Status',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              color: PDFTheme.backgroundWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Data rows
                    ...emis.map((emi) {
                      final statusText = emi.isPaid ? 'Paid' : 'Pending';
                      final statusColor = emi.isPaid
                          ? PDFTheme.secondaryGreen
                          : PDFTheme.textPrimary;
                      return pw.TableRow(
                        decoration: pw.BoxDecoration(
                          color: PDFTheme.surfaceGrey,
                        ),
                        children: [
                          pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            child: pw.Text(
                              emi.dueDate.toString().split(' ')[0],
                              style: pw.TextStyle(color: PDFTheme.textPrimary),
                            ),
                          ),
                          pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            child: pw.Text(
                              'Rs. ${emi.amount.toStringAsFixed(2)}',
                              style: pw.TextStyle(color: PDFTheme.textPrimary),
                            ),
                          ),
                          pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            child: pw.Text(
                              statusText,
                              style: pw.TextStyle(
                                color: statusColor,
                                fontWeight: emi.isPaid
                                    ? pw.FontWeight.bold
                                    : pw.FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
                pw.SizedBox(height: 20),

                // Completion Message
                pw.Center(
                  child: pw.Text(
                    'Congratulations! All EMIs have been successfully paid.',
                    style: pw.TextStyle(
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                    ),
                    textAlign: pw.TextAlign.center,
                  ),
                ),
                pw.SizedBox(height: 10),
                pw.Center(
                  child: pw.Text(
                    'This certificate confirms the completion of your loan.',
                    textAlign: pw.TextAlign.center,
                  ),
                ),
                pw.SizedBox(height: 20),

                // Footer
                pw.Container(
                  padding: pw.EdgeInsets.all(12),
                  decoration: pw.BoxDecoration(
                    color: PDFTheme.surfaceGrey,
                    borderRadius: pw.BorderRadius.circular(8),
                  ),
                  child: pw.Center(
                    child: pw.Text(
                      'Generated on ${DateTime.now().toString().split(' ')[0]}',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontStyle: pw.FontStyle.italic,
                        color: PDFTheme.textSecondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ];
        },
      ),
    );

    // Save PDF to temporary directory
    final output = await getTemporaryDirectory();
    final file = File('${output.path}/loan_completion_${loan.id}.pdf');
    await file.writeAsBytes(await pdf.save());

    return file;
  }

  static Future<void> sharePDFViaWhatsApp(
    File pdfFile,
    String mobileNumber,
  ) async {
    // Format mobile number for WhatsApp URL
    String formattedNumber = mobileNumber.replaceAll(RegExp(r'[^\d]'), '');
    if (!formattedNumber.startsWith('+')) {
      formattedNumber = '+$formattedNumber';
    }

    // Share the PDF file
    await Share.shareXFiles(
      [XFile(pdfFile.path)],
      text: 'Loan Completion Certificate',
      subject: 'Loan Completion Certificate',
    );
  }
}
