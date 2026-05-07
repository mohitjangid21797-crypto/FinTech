// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Loan Manager';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get keyMetrics => 'Key Metrics';

  @override
  String get totalLoans => 'Total Loans';

  @override
  String get activeLoans => 'Active Loans';

  @override
  String get totalCustomers => 'Total Customers';

  @override
  String get pendingEMIs => 'Pending EMIs';

  @override
  String get totalLoanAmount => 'Total Loan Amount';

  @override
  String get totalProfit => 'Total Profit';

  @override
  String get quickActions => 'Quick Actions';

  @override
  String get addCustomer => 'Add Customer';

  @override
  String get createLoan => 'Create Loan';

  @override
  String get emiLedger => 'EMI Ledger';

  @override
  String get pdfDocuments => 'PDF Documents';

  @override
  String get recentActivity => 'Recent Activity';

  @override
  String get noRecentActivity => 'No recent activity';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get userProfile => 'User Profile';

  @override
  String get settings => 'Settings';

  @override
  String get languages => 'Languages';

  @override
  String helloUser(Object user) {
    return 'Hello, $user!';
  }

  @override
  String get welcomeBack => 'Welcome back to your dashboard 👋';

  @override
  String get exitAppTitle => 'Exit App';

  @override
  String get exitAppMessage => 'Are you sure you want to exit the app?';

  @override
  String get cancel => 'Cancel';

  @override
  String get exit => 'Exit';

  @override
  String languageSelected(Object language) {
    return '$language language selected';
  }

  @override
  String get finTech => 'FinTech';

  @override
  String get secureLogin => 'Secure Login';

  @override
  String get mobileNumber => 'Mobile Number';

  @override
  String get enterMobileNumber => 'Enter your mobile number';

  @override
  String get pleaseEnterMobileNumber => 'Please enter your mobile number';

  @override
  String get enterValidMobileNumber => 'Enter a valid 10-digit mobile number';

  @override
  String get name => 'Name';

  @override
  String get enterName => 'Enter your name';

  @override
  String get pleaseEnterName => 'Please enter your name';

  @override
  String get email => 'Email';

  @override
  String get enterEmail => 'Enter your email';

  @override
  String get pleaseEnterEmail => 'Please enter your email';

  @override
  String get enterValidEmail => 'Enter a valid email address';

  @override
  String get location => 'Location';

  @override
  String get enterLocation => 'Enter your location';

  @override
  String get pleaseEnterLocation => 'Please enter your location';

  @override
  String get mPin => 'M-PIN';

  @override
  String get enterMPin => 'Enter your M-PIN';

  @override
  String get pleaseEnterMPin => 'Please enter your M-PIN';

  @override
  String get mPinMustBe4To6Digits => 'M-PIN must be 4-6 digits';

  @override
  String get login => 'Login';

  @override
  String get congratulations => 'Congratulations!';

  @override
  String get loggedInSuccessfully => 'You have logged in successfully';

  @override
  String get allCustomers => 'All Customers';

  @override
  String get searchCustomers => 'Search customers...';

  @override
  String get noCustomersYet => 'No Customers Yet';

  @override
  String get startBuildingCustomerDatabase =>
      'Start building your customer database by adding your first customer.';

  @override
  String get addYourFirstCustomer => 'Add Your First Customer';

  @override
  String get noResultsFound => 'No Results Found';

  @override
  String get tryAdjustingSearchTerms =>
      'Try adjusting your search terms or check the spelling.';

  @override
  String get deleteCustomer => 'Delete Customer';

  @override
  String areYouSureDeleteCustomer(Object name) {
    return 'Are you sure you want to delete $name? This action cannot be undone.';
  }

  @override
  String customerDeletedSuccessfully(Object name) {
    return '$name deleted successfully';
  }

  @override
  String get delete => 'Delete';

  @override
  String get addCustomerTitle => 'Add Customer';

  @override
  String get customerDetails => 'Customer Details';

  @override
  String get mobile => 'Mobile';

  @override
  String get pleaseEnterMobile => 'Please enter a mobile number';

  @override
  String get pleaseEnterEmailAddress => 'Please enter an email';

  @override
  String get smsConsent =>
      'I consent to receive SMS notifications for EMI payments';

  @override
  String get customerAdded => 'Customer Added!';

  @override
  String get customerAddedSuccessfully =>
      'Customer added successfully\nReady for loan creation!';

  @override
  String get continueText => 'Continue';

  @override
  String get pleaseFillAllRequiredFields => 'Please fill all required fields';

  @override
  String get overviewLoans => 'Overview Loans';

  @override
  String get active => 'Active';

  @override
  String get completed => 'Completed';

  @override
  String get pending => 'Pending';

  @override
  String get searchByCustomerMobile => 'Search by Customer Mobile Number';

  @override
  String get noActiveLoans => 'No active loans';

  @override
  String get noCompletedLoans => 'No completed loans';

  @override
  String get noPendingLoans => 'No pending loans';

  @override
  String get allEMIsPaidSuccessfully => 'All EMIs are paid successfully';

  @override
  String get moveToPDFDocuments =>
      'Do you want to move to PDF Documents to see its PDF?';

  @override
  String get later => 'Later';

  @override
  String get viewPDF => 'View PDF';

  @override
  String get loanEMIDetails => 'Loan EMI Details';

  @override
  String loanID(Object id) {
    return 'Loan ID: $id...';
  }

  @override
  String get principal => 'Principal';

  @override
  String get emiLabel => 'EMI';

  @override
  String get rate => 'Rate';

  @override
  String get tenure => 'Tenure';

  @override
  String get months => 'months';

  @override
  String get markAsPaid => 'Mark as Paid';

  @override
  String get paid => 'Paid';

  @override
  String get markAllEMIsPaid => 'Mark All EMIs Paid';

  @override
  String markAllPendingEMIsAsPaid(Object count) {
    return 'Mark All $count Pending EMIs as Paid';
  }

  @override
  String markAllEMIsPaidConfirm(Object count) {
    return 'Are you sure? This will mark all $count pending EMIs as paid and regenerate the completion PDF.';
  }

  @override
  String get confirm => 'Confirm';

  @override
  String allEMIsMarkedAsPaid(Object count) {
    return 'All $count EMIs marked as paid! PDF regenerated.';
  }

  @override
  String get loanCompletedSuccessfully =>
      'Loan completed successfully! PDF has been auto-generated and is available in PDF Documents.';

  @override
  String get emiMarkedAsPaid => 'EMI marked as paid successfully!';

  @override
  String get unknownCustomer => 'Unknown Customer';

  @override
  String due(Object date) {
    return 'Due: $date';
  }

  @override
  String get emiSchedule => 'EMI Schedule';

  @override
  String get searchCustomer => 'Search Customer';

  @override
  String get searchByNameOrMobile => 'Search by name or mobile number';

  @override
  String get filterByCustomer => 'Filter by Customer (Optional)';

  @override
  String get allCustomersLabel => 'All Customers';

  @override
  String get noEMISchedulesFound => 'No EMI schedules found';

  @override
  String get tryAdjustingSearchFilter =>
      'Try adjusting your search or filter criteria';

  @override
  String get allLoanPDFs => 'All Loan PDFs';

  @override
  String get noLoanCompletionPDFs =>
      'No loan completion PDFs found\nGenerate PDFs from loan summaries';

  @override
  String customer(Object name) {
    return 'Customer: $name';
  }

  @override
  String idLabel(Object value) {
    return 'ID: $value';
  }

  @override
  String get save => 'Save';

  @override
  String get share => 'Share';

  @override
  String get editPDF => 'Edit PDF';

  @override
  String get failedToSavePDF => 'Failed to save PDF. Please try again.';

  @override
  String shareFailed(Object error) {
    return 'Share failed: $error';
  }

  @override
  String get storagePermissionRequired => 'Storage Permission Required';

  @override
  String get storagePermissionMessage =>
      'This app needs storage permission to save PDFs to Downloads. Please enable it in Settings.';

  @override
  String get openSettings => 'Open Settings';

  @override
  String cannotEditInvalidFormat(Object filename) {
    return 'Cannot edit \"$filename\": Invalid PDF filename format';
  }

  @override
  String loanNotFoundCannotEdit(Object loanId) {
    return 'Loan $loanId not found. Cannot edit PDF.';
  }

  @override
  String navigationError(Object error) {
    return 'Navigation error: $error';
  }

  @override
  String get pdfDeletedSuccessfully => 'PDF deleted Successfully';

  @override
  String get fileRemovedFromStorage => 'File removed from storage';

  @override
  String get dismiss => 'Dismiss';

  @override
  String get deletePDF => 'Delete PDF?';

  @override
  String sureDeleteFilename(Object filename) {
    return 'Are you sure you want to delete \"$filename\"?';
  }

  @override
  String failedToDelete(Object error) {
    return 'Failed to delete: $error';
  }

  @override
  String get editCustomer => 'Edit Customer';

  @override
  String get personalInfo => 'Personal Info';

  @override
  String get contactInfo => 'Contact Info';

  @override
  String get preferences => 'Preferences';

  @override
  String get fullName => 'Full Name';

  @override
  String get nameRequired => 'Name is required';

  @override
  String get mobileNumberOptional => 'Mobile Number';

  @override
  String get mobileRequired => 'Mobile is required';

  @override
  String get emailOptional => 'Email (optional)';

  @override
  String get locationOptional => 'Location (optional)';

  @override
  String get receiveSMSNotifications =>
      'Receive SMS notifications for EMI payments';

  @override
  String get stayUpdatedOnPayments =>
      'Stay updated on loan payments and reminders';

  @override
  String get updateCustomer => 'Update Customer';

  @override
  String get updating => 'Updating...';

  @override
  String get customerUpdatedSuccessfully => 'Customer updated successfully!';

  @override
  String get loanAmount => 'Loan Amount';

  @override
  String get interestRate => 'Interest Rate';

  @override
  String get interestType => 'Interest Type';

  @override
  String get createLoanTitle => 'Create Loan';

  @override
  String get searchCustomerByNameOrMobile => 'Search by name or mobile number';

  @override
  String get addFirstCustomer => 'Add First Customer';

  @override
  String get selectCustomer => 'Select Customer';

  @override
  String get continueToOverview => 'Continue to Overview';

  @override
  String loanCreatedFor(Object name) {
    return 'Loan created for $name';
  }

  @override
  String amountDate(Object amount, Object date) {
    return 'Amount: ₹$amount • $date';
  }

  @override
  String get perMonth => '/month';

  @override
  String get welcomeToFinTech => 'Welcome to FinTech';

  @override
  String get yourTrustedPartner => 'Your trusted partner for loan management';

  @override
  String get trackLoansEMI => 'Track Loans & EMI Easily';

  @override
  String get monitorLoanProgress =>
      'Monitor your loan progress and EMI schedules in real-time';

  @override
  String get secureReliable => 'Secure & Reliable';

  @override
  String get dataProtected =>
      'Your data is protected with industry-standard security';

  @override
  String get secureReliableEfficient => 'Secure • Reliable • Efficient';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get customers => 'Customers';

  @override
  String get overview => 'Overview';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get toggleBetweenThemes => 'Toggle between light and dark theme';

  @override
  String get enableSMSNotifications => 'Enable SMS Notifications';

  @override
  String get sendSMSForEMI => 'Send SMS for EMI payments and reminders';

  @override
  String get myProfile => 'My Profile';

  @override
  String get permissionRequired => 'Permission Required';

  @override
  String get gallery => 'Gallery';

  @override
  String get camera => 'Camera';

  @override
  String get customerLedger => 'Customer Ledger';

  @override
  String get searchByCustomerNameOrMobile =>
      'Search by customer name or mobile...';

  @override
  String get createYourFirstLoan => 'Create Your First Loan';

  @override
  String get loanDataNotFound => 'Loan data not found';

  @override
  String get pdfUpdatedSuccessfully => 'PDF updated successfully!';

  @override
  String errorUpdatingPDF(Object error) {
    return 'Error updating PDF: $error';
  }

  @override
  String get cannotSaveDataMissing =>
      'Cannot save: Loan or customer data missing.';

  @override
  String get unknown => 'Unknown';

  @override
  String get createLoanSubtitle => 'Set up loan details and calculate EMI';

  @override
  String get enterAmount => 'Enter amount';

  @override
  String get requiredField => 'Required';

  @override
  String get invalidAmount => 'Invalid amount';

  @override
  String get monthlyInterestRate => 'Monthly Interest Rate (%)';

  @override
  String get exampleInterestRate => 'e.g., 1.0';

  @override
  String get invalidRate => 'Invalid rate';

  @override
  String get tenureMonths => 'Tenure (Months)';

  @override
  String get exampleTenure => 'e.g., 12';

  @override
  String get invalidTenure => 'Invalid tenure';

  @override
  String get calculatedEmi => 'Calculated EMI';

  @override
  String emiPerMonth(Object amount) {
    return '₹$amount per month';
  }

  @override
  String get noCustomersFound => 'No customers found';

  @override
  String get pleaseSelectCustomer => 'Please select a customer';

  @override
  String get loanCreatedSuccessfullyTitle =>
      'Loan Created Successfully! View your loans overview.';

  @override
  String get loanCreatedSuccessfullyMessage =>
      'Your loan has been created. Continue to overview to track EMIs.';

  @override
  String get simpleInterest => 'Simple';

  @override
  String get compoundInterest => 'Compound';

  @override
  String get loanCompletionCertificate => 'Loan Completion Certificate';

  @override
  String get lenderDetails => 'Lender Details:';

  @override
  String get loanDetails => 'Loan Details:';

  @override
  String get emiPaymentSummary => 'EMI Payment Summary:';

  @override
  String get payAllPendingEMI => 'Pay All Pending EMI';

  @override
  String get allEmisPaid =>
      'Congratulations! All EMIs have been successfully paid.';

  @override
  String get certificateConfirmsCompletion =>
      'This certificate confirms the completion of your loan.';

  @override
  String generatedOn(Object date) {
    return 'Generated on $date';
  }

  @override
  String get dueDate => 'Due Date';

  @override
  String get amount => 'Amount';

  @override
  String get status => 'Status';

  @override
  String get simple => 'Simple';

  @override
  String get compound => 'Compound';

  @override
  String get refreshData => 'Refresh Data';

  @override
  String get loadingLoanData => 'Loading loan data...';

  @override
  String get enterPrincipalAmount => 'Enter principal amount';

  @override
  String get annualInterestRate => 'Annual interest rate';

  @override
  String get loanDurationMonths => 'Loan duration in months';

  @override
  String get selectInterestTypeHint => 'Select interest calculation type';

  @override
  String get customerFullName => 'Customer full name';

  @override
  String get tenDigitPhoneNumber => '10 digit phone number';

  @override
  String get forNotifications => 'For notifications';

  @override
  String get cityOrAddress => 'City or address';

  @override
  String get saveAndRegeneratePDF => 'Save & Regenerate PDF';

  @override
  String get regeneratingPDF => 'Regenerating PDF...';

  @override
  String get customerDataNotFound => 'Customer data not found';

  @override
  String get editPDFDetails => 'Edit PDF Details';

  @override
  String get ledgerOutstanding => 'Outstanding';

  @override
  String get ledgerCollected => 'Collected';

  @override
  String get ledgerStatusReceive => 'You will get';

  @override
  String get ledgerStatusPay => 'You will give';

  @override
  String get ledgerStatusSettled => 'Settled';

  @override
  String get recentTransactions => 'Recent Transactions';

  @override
  String moreTransactions(Object count) {
    return '+$count more transactions';
  }

  @override
  String get givenAmount => 'Given';

  @override
  String get receivedAmount => 'Received';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get tomorrow => 'Tomorrow';

  @override
  String get noCustomersLedger => 'No Customers Yet';

  @override
  String get ledgerEmptyMessage =>
      'Start by creating loans to see your customer ledger. Track transactions and manage your business efficiently.';

  @override
  String get createFirstLoanLedger => 'Create Your First Loan';

  @override
  String get loanDisbursed => 'Loan Disbursed';

  @override
  String get emiPayment => 'EMI Payment';

  @override
  String get updateProfile => 'Update Profile';

  @override
  String get saving => 'Saving...';

  @override
  String get logout => 'Logout';

  @override
  String get appearance => 'Appearance';

  @override
  String get smsNotifications => 'SMS Notifications';

  @override
  String get enableSmsNotifications => 'Enable SMS Notifications';

  @override
  String get darkModeToggleSubtitle => 'Toggle between light and dark theme';

  @override
  String get smsToggleSubtitle => 'Send SMS for EMI payments and reminders';

  @override
  String get loadingPDFs => 'Loading PDFs...';

  @override
  String get completeLoansWillGeneratePDFsHere =>
      'Complete loans will generate PDFs here';

  @override
  String pdfCount(int count) {
    return '$count PDFs';
  }

  @override
  String get tapPDFToShareViaWhatsApp => 'Tap any PDF to share via WhatsApp';

  @override
  String get saveToDownloads => 'Save to Downloads';

  @override
  String get shareViaWhatsApp => 'Share via WhatsApp';

  @override
  String get gotIt => 'Got it!';

  @override
  String get permanentlyDeleteWarning => 'This will permanently delete:';

  @override
  String get actionCannotBeUndone => 'This action cannot be undone.';

  @override
  String get retry => 'Retry';

  @override
  String get noLanguageMatch => 'No language matches your search';

  @override
  String get selected => 'Selected';

  @override
  String get allow => 'Allow';

  @override
  String get logoutConfirmation => 'Are you sure you want to logout?';

  @override
  String get loanManagementProfessional => 'Loan Management Professional';

  @override
  String get accountDetails => 'Account Details';
}
