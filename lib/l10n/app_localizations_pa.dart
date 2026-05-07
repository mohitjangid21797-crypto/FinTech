// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => 'ਲੋਨ ਮੈਨੇਜਰ';

  @override
  String get dashboardTitle => 'ਡੈਸ਼ਬੋਰਡ';

  @override
  String get keyMetrics => 'ਮੁੱਖ ਮੈਟ੍ਰਿਕਸ';

  @override
  String get totalLoans => 'ਕੁੱਲ ਲੋਨ';

  @override
  String get activeLoans => 'ਸਰਗਰਮ ਲੋਨ';

  @override
  String get totalCustomers => 'ਕੁੱਲ ਗਾਹਕ';

  @override
  String get pendingEMIs => 'ਬਾਕੀ EMI';

  @override
  String get totalLoanAmount => 'ਕੁੱਲ ਲੋਨ ਰਕਮ';

  @override
  String get totalProfit => 'ਕੁੱਲ ਲਾਭ';

  @override
  String get quickActions => 'ਤੁਰੰਤ ਕਾਰਵਾਈਆਂ';

  @override
  String get addCustomer => 'ਗਾਹਕ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get createLoan => 'ਲੋਨ ਬਣਾਓ';

  @override
  String get emiLedger => 'EMI ਖਾਤਾ';

  @override
  String get pdfDocuments => 'PDF ਦਸਤਾਵੇਜ਼';

  @override
  String get recentActivity => 'ਹਾਲੀਆ ਗਤੀਵਿਧੀ';

  @override
  String get noRecentActivity => 'ਕੋਈ ਹਾਲੀਆ ਗਤੀਵਿਧੀ ਨਹੀਂ';

  @override
  String get selectLanguage => 'ਭਾਸ਼ਾ ਚੁਣੋ';

  @override
  String get userProfile => 'ਉਪਭੋਗਤਾ ਪ੍ਰੋਫਾਈਲ';

  @override
  String get settings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get languages => 'ਭਾਸ਼ਾਵਾਂ';

  @override
  String helloUser(Object user) {
    return 'ਸਤ ਸ੍ਰੀ ਅਕਾਲ, $user!';
  }

  @override
  String get welcomeBack => 'ਤੁਹਾਡੇ ਡੈਸ਼ਬੋਰਡ ਤੇ ਵਾਪਸ ਜੀ ਆਇਆਂ ਨੂੰ 👋';

  @override
  String get exitAppTitle => 'ਐਪ ਤੋਂ ਬਾਹਰ ਜਾਓ';

  @override
  String get exitAppMessage => 'ਕੀ ਤੁਸੀਂ ਪੱਕਾ ਐਪ ਤੋਂ ਬਾਹਰ ਜਾਣਾ ਚਾਹੁੰਦੇ ਹੋ?';

  @override
  String get cancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get exit => 'ਬਾਹਰ ਜਾਓ';

  @override
  String languageSelected(Object language) {
    return '$language ਭਾਸ਼ਾ ਚੁਣੀ ਗਈ';
  }

  @override
  String get finTech => 'ਫਿਨਟੈਕ';

  @override
  String get secureLogin => 'ਸੁਰੱਖਿਅਤ ਲੌਗਿਨ';

  @override
  String get mobileNumber => 'ਮੋਬਾਈਲ ਨੰਬਰ';

  @override
  String get enterMobileNumber => 'ਆਪਣਾ ਮੋਬਾਈਲ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get pleaseEnterMobileNumber => 'ਕਿਰਪਾ ਕਰਕੇ ਆਪਣਾ ਮੋਬਾਈਲ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get enterValidMobileNumber => 'ਇੱਕ ਵੈਧ 10-ਅੰਕੀ ਮੋਬਾਈਲ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get name => 'ਨਾਮ';

  @override
  String get enterName => 'ਆਪਣਾ ਨਾਮ ਦਰਜ ਕਰੋ';

  @override
  String get pleaseEnterName => 'ਕਿਰਪਾ ਕਰਕੇ ਆਪਣਾ ਨਾਮ ਦਰਜ ਕਰੋ';

  @override
  String get email => 'ਈਮੇਲ';

  @override
  String get enterEmail => 'ਆਪਣੀ ਈਮੇਲ ਦਰਜ ਕਰੋ';

  @override
  String get pleaseEnterEmail => 'ਕਿਰਪਾ ਕਰਕੇ ਆਪਣੀ ਈਮੇਲ ਦਰਜ ਕਰੋ';

  @override
  String get enterValidEmail => 'ਇੱਕ ਵੈਧ ਈਮੇਲ ਪਤਾ ਦਰਜ ਕਰੋ';

  @override
  String get location => 'ਸਥਾਨ';

  @override
  String get enterLocation => 'ਆਪਣਾ ਸਥਾਨ ਦਰਜ ਕਰੋ';

  @override
  String get pleaseEnterLocation => 'ਕਿਰਪਾ ਕਰਕੇ ਆਪਣਾ ਸਥਾਨ ਦਰਜ ਕਰੋ';

  @override
  String get mPin => 'ਐਮ-ਪਿੰਨ';

  @override
  String get enterMPin => 'ਆਪਣਾ ਐਮ-ਪਿੰਨ ਦਰਜ ਕਰੋ';

  @override
  String get pleaseEnterMPin => 'ਕਿਰਪਾ ਕਰਕੇ ਆਪਣਾ ਐਮ-ਪਿੰਨ ਦਰਜ ਕਰੋ';

  @override
  String get mPinMustBe4To6Digits => 'ਐਮ-ਪਿੰਨ 4-6 ਅੰਕਾਂ ਦਾ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ';

  @override
  String get login => 'ਲੌਗਿਨ';

  @override
  String get congratulations => 'ਵਧਾਈਆਂ!';

  @override
  String get loggedInSuccessfully => 'ਤੁਸੀਂ ਸਫਲਤਾਪੂਰਵਕ ਲੌਗਿਨ ਕਰ ਲਿਆ ਹੈ';

  @override
  String get allCustomers => 'ਸਾਰੇ ਗਾਹਕ';

  @override
  String get searchCustomers => 'ਗਾਹਕ ਲੱਭੋ...';

  @override
  String get noCustomersYet => 'ਅਜੇ ਤੱਕ ਕੋਈ ਗਾਹਕ ਨਹੀਂ';

  @override
  String get startBuildingCustomerDatabase =>
      'ਆਪਣਾ ਪਹਿਲਾ ਗਾਹਕ ਸ਼ਾਮਲ ਕਰਕੇ ਗਾਹਕ ਡਾਟਾਬੇਸ ਬਣਾਉਣਾ ਸ਼ੁਰੂ ਕਰੋ।';

  @override
  String get addYourFirstCustomer => 'ਆਪਣਾ ਪਹਿਲਾ ਗਾਹਕ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get noResultsFound => 'ਕੋਈ ਨਤੀਜਾ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String get tryAdjustingSearchTerms =>
      'ਆਪਣੇ ਖੋਜ ਸ਼ਬਦਾਂ ਨੂੰ ਵਿਵਸਥਿਤ ਕਰੋ ਜਾਂ ਸਪੈਲਿੰਗ ਚੈਕ ਕਰੋ।';

  @override
  String get deleteCustomer => 'ਗਾਹਕ ਹਟਾਓ';

  @override
  String areYouSureDeleteCustomer(Object name) {
    return 'ਕੀ ਤੁਸੀਂ ਪੱਕਾ $name ਨੂੰ ਹਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ? ਇਸ ਕਾਰਵਾਈ ਨੂੰ ਵਾਪਸ ਨਹੀਂ ਲਿਆ ਜਾ ਸਕਦਾ।';
  }

  @override
  String customerDeletedSuccessfully(Object name) {
    return '$name ਸਫਲਤਾਪੂਰਵਕ ਹਟਾ ਦਿੱਤਾ ਗਿਆ';
  }

  @override
  String get delete => 'ਹਟਾਓ';

  @override
  String get addCustomerTitle => 'ਗਾਹਕ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get customerDetails => 'ਗਾਹਕ ਵੇਰਵੇ';

  @override
  String get mobile => 'ਮੋਬਾਈਲ';

  @override
  String get pleaseEnterMobile => 'ਕਿਰਪਾ ਕਰਕੇ ਇੱਕ ਮੋਬਾਈਲ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get pleaseEnterEmailAddress => 'ਕਿਰਪਾ ਕਰਕੇ ਇੱਕ ਈਮੇਲ ਦਰਜ ਕਰੋ';

  @override
  String get smsConsent =>
      'ਮੈਂ EMI ਭੁਗਤਾਨਾਂ ਲਈ SMS ਸੂਚਨਾਵਾਂ ਪ੍ਰਾਪਤ ਕਰਨ ਲਈ ਸਹਿਮਤੀ ਦਿੰਦਾ ਹਾਂ';

  @override
  String get customerAdded => 'ਗਾਹਕ ਸ਼ਾਮਲ ਕਰ ਦਿੱਤਾ!';

  @override
  String get customerAddedSuccessfully =>
      'ਗਾਹਕ ਸਫਲਤਾਪੂਰਵਕ ਸ਼ਾਮਲ ਕਰ ਦਿੱਤਾ\nਲੋਨ ਬਣਾਉਣ ਲਈ ਤਿਆਰ!';

  @override
  String get continueText => 'ਜਾਰੀ ਰੱਖੋ';

  @override
  String get pleaseFillAllRequiredFields => 'ਕਿਰਪਾ ਕਰਕੇ ਸਾਰੇ ਲੋੜੀਂਦੇ ਖੇਤਰ ਭਰੋ';

  @override
  String get overviewLoans => 'ਲੋਨਾਂ ਦੀ ਸੰਖੇਪ ਜਾਣਕਾਰੀ';

  @override
  String get active => 'ਸਰਗਰਮ';

  @override
  String get completed => 'ਪੂਰਾ ਹੋਇਆ';

  @override
  String get pending => 'ਬਾਕੀ';

  @override
  String get searchByCustomerMobile => 'ਗਾਹਕ ਦੇ ਮੋਬਾਈਲ ਨੰਬਰ ਦੁਆਰਾ ਖੋਜੋ';

  @override
  String get noActiveLoans => 'ਕੋਈ ਸਰਗਰਮ ਲੋਨ ਨਹੀਂ';

  @override
  String get noCompletedLoans => 'ਕੋਈ ਪੂਰਾ ਲੋਨ ਨਹੀਂ';

  @override
  String get noPendingLoans => 'ਕੋਈ ਬਾਕੀ ਲੋਨ ਨਹੀਂ';

  @override
  String get allEMIsPaidSuccessfully =>
      'ਸਾਰੀਆਂ EMI ਸਫਲਤਾਪੂਰਵਕ ਅਦਾ ਕਰ ਦਿੱਤੀਆਂ ਗਈਆਂ';

  @override
  String get moveToPDFDocuments =>
      'ਕੀ ਤੁਸੀਂ ਇਸਦਾ PDF ਵੇਖਣ ਲਈ PDF ਦਸਤਾਵੇਜ਼ਾਂ ਵੱਲ ਜਾਣਾ ਚਾਹੁੰਦੇ ਹੋ?';

  @override
  String get later => 'ਬਾਅਦ ਵਿੱਚ';

  @override
  String get viewPDF => 'PDF ਵੇਖੋ';

  @override
  String get loanEMIDetails => 'ਲੋਨ EMI ਵੇਰਵੇ';

  @override
  String loanID(Object id) {
    return 'ਲੋਨ ID: $id...';
  }

  @override
  String get principal => 'ਮੂਲ ਧਨ';

  @override
  String get emiLabel => 'EMI';

  @override
  String get rate => 'ਦਰ';

  @override
  String get tenure => 'ਮਿਆਦ';

  @override
  String get months => 'ਮਹੀਨੇ';

  @override
  String get markAsPaid => 'ਅਦਾ ਦਾ ਨਿਸ਼ਾਨ ਲਗਾਓ';

  @override
  String get paid => 'ਅਦਾ ਕੀਤਾ';

  @override
  String get markAllEMIsPaid => 'ਸਾਰੀਆਂ EMI ਅਦਾ ਦਾ ਨਿਸ਼ਾਨ ਲਗਾਓ';

  @override
  String markAllPendingEMIsAsPaid(Object count) {
    return 'ਸਾਰੀਆਂ $count ਬਾਕੀ EMI ਅਦਾ ਦਾ ਨਿਸ਼ਾਨ ਲਗਾਓ';
  }

  @override
  String markAllEMIsPaidConfirm(Object count) {
    return 'ਕੀ ਤੁਹਾਨੂੰ ਪੱਕਾ ਹੈ? ਇਹ ਸਾਰੀਆਂ $count ਬਾਕੀ EMI ਨੂੰ ਅਦਾ ਦਾ ਨਿਸ਼ਾਨ ਲਗਾ ਦੇਵੇਗਾ ਅਤੇ ਪੂਰਤੀ PDF ਮੁੜ ਤਿਆਰ ਕਰੇਗਾ।';
  }

  @override
  String get confirm => 'ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String allEMIsMarkedAsPaid(Object count) {
    return 'ਸਾਰੀਆਂ $count EMI ਅਦਾ ਦਾ ਨਿਸ਼ਾਨ ਲੱਗ ਗਿਆ! PDF ਮੁੜ ਤਿਆਰ ਕੀਤਾ ਗਿਆ।';
  }

  @override
  String get loanCompletedSuccessfully =>
      'ਲੋਨ ਸਫਲਤਾਪੂਰਵਕ ਪੂਰਾ ਹੋ ਗਿਆ! PDF ਆਪਣੇ ਆਪ ਤਿਆਰ ਹੋ ਗਿਆ ਹੈ ਅਤੇ PDF ਦਸਤਾਵੇਜ਼ਾਂ ਵਿੱਚ ਉਪਲਬਧ ਹੈ।';

  @override
  String get emiMarkedAsPaid => 'EMI ਸਫਲਤਾਪੂਰਵਕ ਅਦਾ ਦਾ ਨਿਸ਼ਾਨ ਲੱਗ ਗਿਆ!';

  @override
  String get unknownCustomer => 'ਅਣਪਛਾਤਾ ਗਾਹਕ';

  @override
  String due(Object date) {
    return 'ਬਾਕੀ: $date';
  }

  @override
  String get emiSchedule => 'EMI ਅਨੁਸੂਚੀ';

  @override
  String get searchCustomer => 'ਗਾਹਕ ਲੱਭੋ';

  @override
  String get searchByNameOrMobile => 'ਨਾਮ ਜਾਂ ਮੋਬਾਈਲ ਨੰਬਰ ਦੁਆਰਾ ਖੋਜੋ';

  @override
  String get filterByCustomer => 'ਗਾਹਕ ਅਨੁਸਾਰ ਫਿਲਟਰ ਕਰੋ (ਵਿਕਲਪਿਕ)';

  @override
  String get allCustomersLabel => 'ਸਾਰੇ ਗਾਹਕ';

  @override
  String get noEMISchedulesFound => 'ਕੋਈ EMI ਅਨੁਸੂਚੀ ਨਹੀਂ ਮਿਲੀ';

  @override
  String get tryAdjustingSearchFilter =>
      'ਆਪਣੇ ਖੋਜ ਜਾਂ ਫਿਲਟਰ ਮਾਪਦੰਡਾਂ ਨੂੰ ਵਿਵਸਥਿਤ ਕਰੋ';

  @override
  String get allLoanPDFs => 'ਸਾਰੇ ਲੋਨਾਂ ਦੀਆਂ PDF';

  @override
  String get noLoanCompletionPDFs =>
      'ਕੋਈ ਲੋਨ ਪੂਰਤੀ PDF ਨਹੀਂ ਮਿਲੀ\nਲੋਨ ਸੰਖੇਪ ਤੋਂ PDF ਤਿਆਰ ਕਰੋ';

  @override
  String customer(Object name) {
    return 'ਗਾਹਕ: $name';
  }

  @override
  String idLabel(Object value) {
    return 'ID: $value';
  }

  @override
  String get save => 'ਸੰਭਾਲੋ';

  @override
  String get share => 'ਸਾਂਝਾ ਕਰੋ';

  @override
  String get editPDF => 'PDF ਸੰਪਾਦਿਤ ਕਰੋ';

  @override
  String get failedToSavePDF =>
      'PDF ਸੰਭਾਲਣ ਵਿੱਚ ਅਸਫਲ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String shareFailed(Object error) {
    return 'ਸਾਂਝਾ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get storagePermissionRequired => 'ਸਟੋਰੇਜ ਇਜਾਜ਼ਤ ਲੋੜੀਂਦੀ ਹੈ';

  @override
  String get storagePermissionMessage =>
      'ਇਸ ਐਪ ਨੂੰ PDF ਡਾਊਨਲੋਡ ਫੋਲਡਰ ਵਿੱਚ ਸੰਭਾਲਣ ਲਈ ਸਟੋਰੇਜ ਇਜਾਜ਼ਤ ਦੀ ਲੋੜ ਹੈ। ਕਿਰਪਾ ਕਰਕੇ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਇਸਨੂੰ ਸਮਰੱਥ ਕਰੋ।';

  @override
  String get openSettings => 'ਸੈਟਿੰਗਾਂ ਖੋਲ੍ਹੋ';

  @override
  String cannotEditInvalidFormat(Object filename) {
    return '\"$filename\" ਸੰਪਾਦਿਤ ਨਹੀਂ ਕਰ ਸਕਦੇ: ਅਵੈਧ PDF ਫਾਈਲਨਾਮ ਫਾਰਮੈਟ';
  }

  @override
  String loanNotFoundCannotEdit(Object loanId) {
    return 'ਲੋਨ $loanId ਨਹੀਂ ਮਿਲਿਆ। PDF ਸੰਪਾਦਿਤ ਨਹੀਂ ਕਰ ਸਕਦੇ।';
  }

  @override
  String navigationError(Object error) {
    return 'ਨੈਵੀਗੇਸ਼ਨ ਗਲਤੀ: $error';
  }

  @override
  String get pdfDeletedSuccessfully => 'PDF ਸਫਲਤਾਪੂਰਵਕ ਹਟਾ ਦਿੱਤਾ ਗਿਆ';

  @override
  String get fileRemovedFromStorage => 'ਫਾਈਲ ਸਟੋਰੇਜ ਤੋਂ ਹਟਾ ਦਿੱਤੀ ਗਈ';

  @override
  String get dismiss => 'ਰੱਦ ਕਰੋ';

  @override
  String get deletePDF => 'PDF ਹਟਾਉਣਾ ਹੈ?';

  @override
  String sureDeleteFilename(Object filename) {
    return 'ਕੀ ਤੁਸੀਂ ਪੱਕਾ \"$filename\" ਨੂੰ ਹਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?';
  }

  @override
  String failedToDelete(Object error) {
    return 'ਹਟਾਉਣ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get editCustomer => 'ਗਾਹਕ ਸੰਪਾਦਿਤ ਕਰੋ';

  @override
  String get personalInfo => 'ਨਿੱਜੀ ਜਾਣਕਾਰੀ';

  @override
  String get contactInfo => 'ਸੰਪਰਕ ਜਾਣਕਾਰੀ';

  @override
  String get preferences => 'ਤਰਜੀਹਾਂ';

  @override
  String get fullName => 'ਪੂਰਾ ਨਾਮ';

  @override
  String get nameRequired => 'ਨਾਮ ਲੋੜੀਂਦਾ ਹੈ';

  @override
  String get mobileNumberOptional => 'ਮੋਬਾਈਲ ਨੰਬਰ';

  @override
  String get mobileRequired => 'ਮੋਬਾਈਲ ਲੋੜੀਂਦਾ ਹੈ';

  @override
  String get emailOptional => 'ਈਮੇਲ (ਵਿਕਲਪਿਕ)';

  @override
  String get locationOptional => 'ਸਥਾਨ (ਵਿਕਲਪਿਕ)';

  @override
  String get receiveSMSNotifications =>
      'EMI ਭੁਗਤਾਨਾਂ ਲਈ SMS ਸੂਚਨਾਵਾਂ ਪ੍ਰਾਪਤ ਕਰੋ';

  @override
  String get stayUpdatedOnPayments =>
      'ਲੋਨ ਭੁਗਤਾਨਾਂ ਅਤੇ ਰੀਮਾਈਂਡਰਾਂ ਬਾਰੇ ਅਪਡੇਟ ਰਹੋ';

  @override
  String get updateCustomer => 'ਗਾਹਕ ਅਪਡੇਟ ਕਰੋ';

  @override
  String get updating => 'ਅਪਡੇਟ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get customerUpdatedSuccessfully => 'ਗਾਹਕ ਸਫਲਤਾਪੂਰਵਕ ਅਪਡੇਟ ਹੋ ਗਿਆ!';

  @override
  String get loanAmount => 'ਲੋਨ ਰਕਮ';

  @override
  String get interestRate => 'ਵਿਆਜ ਦਰ';

  @override
  String get interestType => 'ਵਿਆਜ ਕਿਸਮ';

  @override
  String get createLoanTitle => 'ਲੋਨ ਬਣਾਓ';

  @override
  String get searchCustomerByNameOrMobile => 'ਨਾਮ ਜਾਂ ਮੋਬਾਈਲ ਨੰਬਰ ਦੁਆਰਾ ਖੋਜੋ';

  @override
  String get addFirstCustomer => 'ਪਹਿਲਾ ਗਾਹਕ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get selectCustomer => 'ਗਾਹਕ ਚੁਣੋ';

  @override
  String get continueToOverview => 'ਸੰਖੇਪ ਜਾਣਕਾਰੀ ਵੱਲ ਜਾਰੀ ਰੱਖੋ';

  @override
  String loanCreatedFor(Object name) {
    return '$name ਲਈ ਲੋਨ ਬਣਾਇਆ ਗਿਆ';
  }

  @override
  String amountDate(Object amount, Object date) {
    return 'ਰਕਮ: ₹$amount • $date';
  }

  @override
  String get perMonth => '/ਮਹੀਨਾ';

  @override
  String get welcomeToFinTech => 'ਫਿਨਟੈਕ ਵਿੱਚ ਜੀ ਆਇਆਂ ਨੂੰ';

  @override
  String get yourTrustedPartner => 'ਲੋਨ ਪ੍ਰਬੰਧਨ ਲਈ ਤੁਹਾਡਾ ਭਰੋਸੇਮੰਦ ਭਾਈਵਾਲ';

  @override
  String get trackLoansEMI => 'ਅਸਾਨੀ ਨਾਲ ਲੋਨ ਅਤੇ EMI ਟਰੈਕ ਕਰੋ';

  @override
  String get monitorLoanProgress =>
      'ਆਪਣੀ ਲੋਨ ਦੀ ਤਰੱਕੀ ਅਤੇ EMI ਅਨੁਸੂਚੀ ਨੂੰ ਅਸਲ-ਸਮੇਂ ਵਿੱਚ ਨਿਗਰਾਨੀ ਕਰੋ';

  @override
  String get secureReliable => 'ਸੁਰੱਖਿਅਤ ਅਤੇ ਭਰੋਸੇਮੰਦ';

  @override
  String get dataProtected => 'ਤੁਹਾਡਾ ਡਾਟਾ ਉਦਯੋਗ-ਮਿਆਰੀ ਸੁਰੱਖਿਆ ਨਾਲ ਸੁਰੱਖਿਅਤ ਹੈ';

  @override
  String get secureReliableEfficient => 'ਸੁਰੱਖਿਅਤ • ਭਰੋਸੇਮੰਦ • ਕੁਸ਼ਲ';

  @override
  String get dashboard => 'ਡੈਸ਼ਬੋਰਡ';

  @override
  String get customers => 'ਗਾਹਕ';

  @override
  String get overview => 'ਸੰਖੇਪ ਜਾਣਕਾਰੀ';

  @override
  String get darkMode => 'ਡਾਰਕ ਮੋਡ';

  @override
  String get toggleBetweenThemes => 'ਲਾਈਟ ਅਤੇ ਡਾਰਕ ਥੀਮ ਦੇ ਵਿਚਕਾਰ ਟੌਗਲ ਕਰੋ';

  @override
  String get enableSMSNotifications => 'SMS ਸੂਚਨਾਵਾਂ ਸਮਰੱਥ ਕਰੋ';

  @override
  String get sendSMSForEMI => 'EMI ਭੁਗਤਾਨਾਂ ਅਤੇ ਰੀਮਾਈਂਡਰਾਂ ਲਈ SMS ਭੇਜੋ';

  @override
  String get myProfile => 'ਮੇਰਾ ਪ੍ਰੋਫਾਈਲ';

  @override
  String get permissionRequired => 'ਇਜਾਜ਼ਤ ਲੋੜੀਂਦੀ ਹੈ';

  @override
  String get gallery => 'ਗੈਲਰੀ';

  @override
  String get camera => 'ਕੈਮਰਾ';

  @override
  String get customerLedger => 'ਗਾਹਕ ਖਾਤਾ';

  @override
  String get searchByCustomerNameOrMobile =>
      'ਗਾਹਕ ਦੇ ਨਾਮ ਜਾਂ ਮੋਬਾਈਲ ਦੁਆਰਾ ਖੋਜੋ...';

  @override
  String get createYourFirstLoan => 'ਆਪਣਾ ਪਹਿਲਾ ਲੋਨ ਬਣਾਓ';

  @override
  String get loanDataNotFound => 'ਲੋਨ ਡਾਟਾ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String get pdfUpdatedSuccessfully => 'PDF ਸਫਲਤਾਪੂਰਵਕ ਅਪਡੇਟ ਹੋ ਗਿਆ!';

  @override
  String errorUpdatingPDF(Object error) {
    return 'PDF ਅਪਡੇਟ ਕਰਨ ਵਿੱਚ ਗਲਤੀ: $error';
  }

  @override
  String get cannotSaveDataMissing =>
      'ਸੰਭਾਲ ਨਹੀਂ ਸਕਦੇ: ਲੋਨ ਜਾਂ ਗਾਹਕ ਡਾਟਾ ਗੁੰਮ ਹੈ।';

  @override
  String get unknown => 'ਅਣਪਛਾਤਾ';

  @override
  String get createLoanSubtitle => 'ਲੋਨ ਵੇਰਵੇ ਸੈਟ ਕਰੋ ਅਤੇ EMI ਦੀ ਗਣਨਾ ਕਰੋ';

  @override
  String get enterAmount => 'ਰਕਮ ਦਰਜ ਕਰੋ';

  @override
  String get requiredField => 'ਲੋੜੀਂਦਾ';

  @override
  String get invalidAmount => 'ਅਵੈਧ ਰਕਮ';

  @override
  String get monthlyInterestRate => 'ਮਾਸਿਕ ਵਿਆਜ ਦਰ (%)';

  @override
  String get exampleInterestRate => 'ਜਿਵੇਂ, 1.0';

  @override
  String get invalidRate => 'ਅਵੈਧ ਦਰ';

  @override
  String get tenureMonths => 'ਮਿਆਦ (ਮਹੀਨੇ)';

  @override
  String get exampleTenure => 'ਜਿਵੇਂ, 12';

  @override
  String get invalidTenure => 'ਅਵੈਧ ਮਿਆਦ';

  @override
  String get calculatedEmi => 'ਗਣਨਾ ਕੀਤੀ EMI';

  @override
  String emiPerMonth(Object amount) {
    return 'ਪ੍ਰਤੀ ਮਹੀਨਾ ₹$amount';
  }

  @override
  String get noCustomersFound => 'ਕੋਈ ਗਾਹਕ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String get pleaseSelectCustomer => 'ਕਿਰਪਾ ਕਰਕੇ ਇੱਕ ਗਾਹਕ ਚੁਣੋ';

  @override
  String get loanCreatedSuccessfullyTitle =>
      'ਲੋਨ ਸਫਲਤਾਪੂਰਵਕ ਬਣਾਇਆ ਗਿਆ! ਆਪਣੇ ਲੋਨਾਂ ਦੀ ਸੰਖੇਪ ਜਾਣਕਾਰੀ ਵੇਖੋ।';

  @override
  String get loanCreatedSuccessfullyMessage =>
      'ਤੁਹਾਡਾ ਲੋਨ ਬਣਾ ਦਿੱਤਾ ਗਿਆ ਹੈ। EMI ਟਰੈਕ ਕਰਨ ਲਈ ਸੰਖੇਪ ਜਾਣਕਾਰੀ ਵੱਲ ਜਾਰੀ ਰੱਖੋ।';

  @override
  String get simpleInterest => 'ਸਧਾਰਨ';

  @override
  String get compoundInterest => 'ਚੱਕਰਵ੍ਰਿਧੀ';

  @override
  String get loanCompletionCertificate => 'ਲੋਨ ਪੂਰਤੀ ਸਰਟੀਫਿਕੇਟ';

  @override
  String get lenderDetails => 'ਲੋਨ ਦੇਣ ਵਾਲੇ ਦੇ ਵੇਰਵੇ:';

  @override
  String get loanDetails => 'ਲੋਨ ਦੇ ਵੇਰਵੇ:';

  @override
  String get emiPaymentSummary => 'EMI ਭੁਗਤਾਨ ਸੰਖੇਪ:';

  @override
  String get payAllPendingEMI => 'ਸਾਰੀਆਂ ਬਾਕੀ EMI ਅਦਾ ਕਰੋ';

  @override
  String get allEmisPaid =>
      'ਵਧਾਈਆਂ! ਸਾਰੀਆਂ EMI ਸਫਲਤਾਪੂਰਵਕ ਅਦਾ ਕਰ ਦਿੱਤੀਆਂ ਗਈਆਂ।';

  @override
  String get certificateConfirmsCompletion =>
      'ਇਹ ਸਰਟੀਫਿਕੇਟ ਤੁਹਾਡੇ ਲੋਨ ਦੀ ਪੂਰਤੀ ਦੀ ਪੁਸ਼ਟੀ ਕਰਦਾ ਹੈ।';

  @override
  String generatedOn(Object date) {
    return '$date ਨੂੰ ਤਿਆਰ ਕੀਤਾ ਗਿਆ';
  }

  @override
  String get dueDate => 'ਅੰਤਿਮ ਮਿਤੀ';

  @override
  String get amount => 'ਰਕਮ';

  @override
  String get status => 'ਸਥਿਤੀ';

  @override
  String get simple => 'ਸਧਾਰਨ';

  @override
  String get compound => 'ਚੱਕਰਵ੍ਰਿਧੀ';

  @override
  String get refreshData => 'ਡਾਟਾ ਰਿਫਰੈਸ਼ ਕਰੋ';

  @override
  String get loadingLoanData => 'ਲੋਨ ਡਾਟਾ ਲੋਡ ਹੋ ਰਿਹਾ ਹੈ...';

  @override
  String get enterPrincipalAmount => 'ਮੂਲ ਧਨ ਰਕਮ ਦਰਜ ਕਰੋ';

  @override
  String get annualInterestRate => 'ਸਾਲਾਨਾ ਵਿਆਜ ਦਰ';

  @override
  String get loanDurationMonths => 'ਮਹੀਨਿਆਂ ਵਿੱਚ ਲੋਨ ਦੀ ਮਿਆਦ';

  @override
  String get selectInterestTypeHint => 'ਵਿਆਜ ਗਣਨਾ ਕਿਸਮ ਚੁਣੋ';

  @override
  String get customerFullName => 'ਗਾਹਕ ਦਾ ਪੂਰਾ ਨਾਮ';

  @override
  String get tenDigitPhoneNumber => '10 ਅੰਕਾਂ ਵਾਲਾ ਫੋਨ ਨੰਬਰ';

  @override
  String get forNotifications => 'ਸੂਚਨਾਵਾਂ ਲਈ';

  @override
  String get cityOrAddress => 'ਸ਼ਹਿਰ ਜਾਂ ਪਤਾ';

  @override
  String get saveAndRegeneratePDF => 'ਸੰਭਾਲੋ ਅਤੇ PDF ਮੁੜ ਤਿਆਰ ਕਰੋ';

  @override
  String get regeneratingPDF => 'PDF ਮੁੜ ਤਿਆਰ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get customerDataNotFound => 'ਗਾਹਕ ਡਾਟਾ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String get editPDFDetails => 'PDF ਵੇਰਵੇ ਸੰਪਾਦਿਤ ਕਰੋ';

  @override
  String get ledgerOutstanding => 'ਬਕਾਇਆ';

  @override
  String get ledgerCollected => 'ਇਕੱਠਾ ਕੀਤਾ';

  @override
  String get ledgerStatusReceive => 'ਤੁਹਾਨੂੰ ਮਿਲਣਗੇ';

  @override
  String get ledgerStatusPay => 'ਤੁਸੀਂ ਦਿਓਗੇ';

  @override
  String get ledgerStatusSettled => 'ਸੈਟਲ ਹੋ ਗਿਆ';

  @override
  String get recentTransactions => 'ਹਾਲੀਆ ਲੈਣ-ਦੇਣ';

  @override
  String moreTransactions(Object count) {
    return '+$count ਹੋਰ ਲੈਣ-ਦੇਣ';
  }

  @override
  String get givenAmount => 'ਦਿੱਤਾ';

  @override
  String get receivedAmount => 'ਪ੍ਰਾਪਤ ਕੀਤਾ';

  @override
  String get today => 'ਅੱਜ';

  @override
  String get yesterday => 'ਕੱਲ੍ਹ';

  @override
  String get tomorrow => 'ਭਲਕੇ';

  @override
  String get noCustomersLedger => 'ਅਜੇ ਤੱਕ ਕੋਈ ਗਾਹਕ ਨਹੀਂ';

  @override
  String get ledgerEmptyMessage =>
      'ਆਪਣਾ ਗਾਹਕ ਖਾਤਾ ਵੇਖਣ ਲਈ ਲੋਨ ਬਣਾ ਕੇ ਸ਼ੁਰੂ ਕਰੋ। ਲੈਣ-ਦੇਣ ਟਰੈਕ ਕਰੋ ਅਤੇ ਆਪਣੇ ਕਾਰੋਬਾਰ ਨੂੰ ਕੁਸ਼ਲਤਾ ਨਾਲ ਪ੍ਰਬੰਧਿਤ ਕਰੋ।';

  @override
  String get createFirstLoanLedger => 'ਆਪਣਾ ਪਹਿਲਾ ਲੋਨ ਬਣਾਓ';

  @override
  String get loanDisbursed => 'ਲੋਨ ਵੰਡ ਦਿੱਤਾ ਗਿਆ';

  @override
  String get emiPayment => 'EMI ਭੁਗਤਾਨ';

  @override
  String get updateProfile => 'ਪ੍ਰੋਫਾਈਲ ਅੱਪਡੇਟ ਕਰੋ';

  @override
  String get saving => 'ਸੰਭਾਲਿਆ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get logout => 'ਲੌਗ ਆਉਟ';

  @override
  String get appearance => 'ਦਿੱਖ';

  @override
  String get smsNotifications => 'ਐਸਐਮਐਸ ਸੂਚਨਾਵਾਂ';

  @override
  String get enableSmsNotifications => 'ਐਸਐਮਐਸ ਸੂਚਨਾਵਾਂ ਯੋਗ ਕਰੋ';

  @override
  String get darkModeToggleSubtitle => 'ਹਲਕੇ ਅਤੇ ਗੂੜ੍ਹੇ ਥੀਮ ਵਿਚਕਾਰ ਟੌਗਲ ਕਰੋ';

  @override
  String get smsToggleSubtitle =>
      'ਈਐਮਆਈ ਭੁਗਤਾਨਾਂ ਅਤੇ ਯਾਦ ਦਿਵਾਉਣ ਲਈ ਐਸਐਮਐਸ ਭੇਜੋ';

  @override
  String get loadingPDFs => 'PDF ਲੋਡ ਹੋ ਰਹੇ ਹਨ...';

  @override
  String get completeLoansWillGeneratePDFsHere =>
      'ਪੂਰੇ ਕਰਜ਼ੇ ਇੱਥੇ PDF ਤਿਆਰ ਕਰਨਗੇ';

  @override
  String pdfCount(int count) {
    return '$count PDF';
  }

  @override
  String get tapPDFToShareViaWhatsApp =>
      'ਵਟਸਐਪ \'ਤੇ ਸਾਂਝਾ ਕਰਨ ਲਈ ਕਿਸੇ ਵੀ PDF \'ਤੇ ਟੈਪ ਕਰੋ';

  @override
  String get saveToDownloads => 'ਡਾਊਨਲੋਡ ਵਿੱਚ ਸੁਰੱਖਿਅਤ ਕਰੋ';

  @override
  String get shareViaWhatsApp => 'ਵਟਸਐਪ ਰਾਹੀਂ ਸਾਂਝਾ ਕਰੋ';

  @override
  String get gotIt => 'ਸਮਝ ਗਿਆ';

  @override
  String get permanentlyDeleteWarning => 'ਇਹ ਸਥਾਈ ਤੌਰ \'ਤੇ ਮਿਟਾ ਦੇਵੇਗਾ:';

  @override
  String get actionCannotBeUndone => 'ਇਸ ਕਾਰਵਾਈ ਨੂੰ ਵਾਪਸ ਨਹੀਂ ਲਿਆ ਜਾ ਸਕਦਾ।';

  @override
  String get retry => 'ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get noLanguageMatch => 'ਤੁਹਾਡੀ ਖੋਜ ਨਾਲ ਮੇਲ ਖਾਂਦੀ ਕੋਈ ਭਾਸ਼ਾ ਨਹੀਂ';

  @override
  String get selected => 'ਚੁਣਿਆ ਗਿਆ';

  @override
  String get allow => 'ਇਜਾਜ਼ਤ ਦਿਓ';

  @override
  String get logoutConfirmation => 'ਕੀ ਤੁਸੀਂ ਪੱਕਾ ਲੌਗਆਉਟ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ?';

  @override
  String get loanManagementProfessional => 'ਕਰਜ਼ਾ ਪ੍ਰਬੰਧਨ ਪੇਸ਼ੇਵਰ';

  @override
  String get accountDetails => 'ਖਾਤੇ ਦੇ ਵੇਰਵੇ';
}
