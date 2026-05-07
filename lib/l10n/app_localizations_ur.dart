// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'قرض مینیجر';

  @override
  String get dashboardTitle => 'ڈیش بورڈ';

  @override
  String get keyMetrics => 'اہم میٹرکس';

  @override
  String get totalLoans => 'کل قرضے';

  @override
  String get activeLoans => 'فعال قرضے';

  @override
  String get totalCustomers => 'کل گاہک';

  @override
  String get pendingEMIs => 'زیر التوا EMI';

  @override
  String get totalLoanAmount => 'کل قرض رقم';

  @override
  String get totalProfit => 'کل منافع';

  @override
  String get quickActions => 'فوری کارروائیاں';

  @override
  String get addCustomer => 'گاہک شامل کریں';

  @override
  String get createLoan => 'قرض بنائیں';

  @override
  String get emiLedger => 'EMI کھاتہ';

  @override
  String get pdfDocuments => 'PDF دستاویزات';

  @override
  String get recentActivity => 'حالیہ سرگرمی';

  @override
  String get noRecentActivity => 'کوئی حالیہ سرگرمی نہیں';

  @override
  String get selectLanguage => 'زبان منتخب کریں';

  @override
  String get userProfile => 'صارف پروفائل';

  @override
  String get settings => 'ترتیبات';

  @override
  String get languages => 'زبانیں';

  @override
  String helloUser(Object user) {
    return 'ہیلو، $user!';
  }

  @override
  String get welcomeBack => 'آپ کے ڈیش بورڈ پر واپس خوش آمدید 👋';

  @override
  String get exitAppTitle => 'ایپ سے خارج ہوں';

  @override
  String get exitAppMessage => 'کیا آپ یقیناً ایپ سے خارج ہونا چاہتے ہیں؟';

  @override
  String get cancel => 'منسوخ کریں';

  @override
  String get exit => 'خارج ہوں';

  @override
  String languageSelected(Object language) {
    return '$language زبان منتخب کر لی گئی';
  }

  @override
  String get finTech => 'فن ٹیک';

  @override
  String get secureLogin => 'محفوظ لاگ ان';

  @override
  String get mobileNumber => 'موبائل نمبر';

  @override
  String get enterMobileNumber => 'اپنا موبائل نمبر درج کریں';

  @override
  String get pleaseEnterMobileNumber => 'براہ کرم اپنا موبائل نمبر درج کریں';

  @override
  String get enterValidMobileNumber =>
      'ایک درست 10-ہندسوں کا موبائل نمبر درج کریں';

  @override
  String get name => 'نام';

  @override
  String get enterName => 'اپنا نام درج کریں';

  @override
  String get pleaseEnterName => 'براہ کرم اپنا نام درج کریں';

  @override
  String get email => 'ای میل';

  @override
  String get enterEmail => 'اپنا ای میل درج کریں';

  @override
  String get pleaseEnterEmail => 'براہ کرم اپنا ای میل درج کریں';

  @override
  String get enterValidEmail => 'ایک درست ای میل پتہ درج کریں';

  @override
  String get location => 'مقام';

  @override
  String get enterLocation => 'اپنا مقام درج کریں';

  @override
  String get pleaseEnterLocation => 'براہ کرم اپنا مقام درج کریں';

  @override
  String get mPin => 'ایم-پن';

  @override
  String get enterMPin => 'اپنا ایم-پن درج کریں';

  @override
  String get pleaseEnterMPin => 'براہ کرم اپنا ایم-پن درج کریں';

  @override
  String get mPinMustBe4To6Digits => 'ایم-پن 4-6 ہندسوں کا ہونا چاہیے';

  @override
  String get login => 'لاگ ان';

  @override
  String get congratulations => 'مبارک ہو!';

  @override
  String get loggedInSuccessfully => 'آپ نے کامیابی سے لاگ ان کر لیا ہے';

  @override
  String get allCustomers => 'تمام گاہک';

  @override
  String get searchCustomers => 'گاہک تلاش کریں...';

  @override
  String get noCustomersYet => 'ابھی تک کوئی گاہک نہیں';

  @override
  String get startBuildingCustomerDatabase =>
      'اپنا پہلا گاہک شامل کرکے اپنا گاہک ڈیٹا بیس بنانا شروع کریں۔';

  @override
  String get addYourFirstCustomer => 'اپنا پہلا گاہک شامل کریں';

  @override
  String get noResultsFound => 'کوئی نتیجہ نہیں ملا';

  @override
  String get tryAdjustingSearchTerms =>
      'اپنے تلاش کے الفاظ کو ایڈجسٹ کریں یا ہجے چیک کریں۔';

  @override
  String get deleteCustomer => 'گاہک حذف کریں';

  @override
  String areYouSureDeleteCustomer(Object name) {
    return 'کیا آپ یقیناً $name کو حذف کرنا چاہتے ہیں؟ یہ عمل واپس نہیں لیا جا سکتا۔';
  }

  @override
  String customerDeletedSuccessfully(Object name) {
    return '$name کامیابی سے حذف کر دیا گیا';
  }

  @override
  String get delete => 'حذف کریں';

  @override
  String get addCustomerTitle => 'گاہک شامل کریں';

  @override
  String get customerDetails => 'گاہک کی تفصیلات';

  @override
  String get mobile => 'موبائل';

  @override
  String get pleaseEnterMobile => 'براہ کرم موبائل نمبر درج کریں';

  @override
  String get pleaseEnterEmailAddress => 'براہ کرم ای میل درج کریں';

  @override
  String get smsConsent =>
      'میں EMI ادائیگیوں کے لیے SMS اطلاعات حاصل کرنے پر رضامند ہوں';

  @override
  String get customerAdded => 'گاہک شامل کر دیا گیا!';

  @override
  String get customerAddedSuccessfully =>
      'گاہک کامیابی سے شامل کر دیا گیا\nقرض بنانے کے لیے تیار!';

  @override
  String get continueText => 'جاری رکھیں';

  @override
  String get pleaseFillAllRequiredFields =>
      'براہ کرم تمام ضروری فیلڈز پُر کریں';

  @override
  String get overviewLoans => 'قرضوں کا جائزہ';

  @override
  String get active => 'فعال';

  @override
  String get completed => 'مکمل';

  @override
  String get pending => 'زیر التوا';

  @override
  String get searchByCustomerMobile => 'گاہک کے موبائل نمبر سے تلاش کریں';

  @override
  String get noActiveLoans => 'کوئی فعال قرض نہیں';

  @override
  String get noCompletedLoans => 'کوئی مکمل قرض نہیں';

  @override
  String get noPendingLoans => 'کوئی زیر التوا قرض نہیں';

  @override
  String get allEMIsPaidSuccessfully => 'تمام EMI کامیابی سے ادا کر دی گئیں';

  @override
  String get moveToPDFDocuments =>
      'کیا آپ اس کا PDF دیکھنے کے لیے PDF دستاویزات پر جانا چاہتے ہیں؟';

  @override
  String get later => 'بعد میں';

  @override
  String get viewPDF => 'PDF دیکھیں';

  @override
  String get loanEMIDetails => 'قرض EMI تفصیلات';

  @override
  String loanID(Object id) {
    return 'قرض ID: $id...';
  }

  @override
  String get principal => 'اصل رقم';

  @override
  String get emiLabel => 'EMI';

  @override
  String get rate => 'شرح';

  @override
  String get tenure => 'مدت';

  @override
  String get months => 'مہینے';

  @override
  String get markAsPaid => 'ادا شدہ کا نشان لگائیں';

  @override
  String get paid => 'ادا شدہ';

  @override
  String get markAllEMIsPaid => 'تمام EMI کو ادا شدہ کا نشان لگائیں';

  @override
  String markAllPendingEMIsAsPaid(Object count) {
    return 'تمام $count زیر التوا EMI کو ادا شدہ کا نشان لگائیں';
  }

  @override
  String markAllEMIsPaidConfirm(Object count) {
    return 'کیا آپ کو یقین ہے؟ یہ تمام $count زیر التوا EMI کو ادا شدہ کا نشان لگائے گا اور تکمیل PDF دوبارہ تیار کرے گا۔';
  }

  @override
  String get confirm => 'تصدیق کریں';

  @override
  String allEMIsMarkedAsPaid(Object count) {
    return 'تمام $count EMI ادا شدہ کا نشان لگ گئے! PDF دوبارہ تیار کر دی گئی۔';
  }

  @override
  String get loanCompletedSuccessfully =>
      'قرض کامیابی سے مکمل ہو گیا! PDF خودکار طور پر تیار ہو گئی ہے اور PDF دستاویزات میں دستیاب ہے۔';

  @override
  String get emiMarkedAsPaid => 'EMI کامیابی سے ادا شدہ کا نشان لگ گئی!';

  @override
  String get unknownCustomer => 'نامعلوم گاہک';

  @override
  String due(Object date) {
    return 'زیر التوا: $date';
  }

  @override
  String get emiSchedule => 'EMI نظام الاوقات';

  @override
  String get searchCustomer => 'گاہک تلاش کریں';

  @override
  String get searchByNameOrMobile => 'نام یا موبائل نمبر سے تلاش کریں';

  @override
  String get filterByCustomer => 'گاہک کے لحاظ سے فلٹر کریں (اختیاری)';

  @override
  String get allCustomersLabel => 'تمام گاہک';

  @override
  String get noEMISchedulesFound => 'کوئی EMI نظام الاوقات نہیں ملا';

  @override
  String get tryAdjustingSearchFilter =>
      'اپنے تلاش یا فلٹر معیار کو ایڈجسٹ کریں';

  @override
  String get allLoanPDFs => 'تمام قرضوں کی PDF';

  @override
  String get noLoanCompletionPDFs =>
      'کوئی قرض تکمیل PDF نہیں ملی\nقرض کے خلاصے سے PDF تیار کریں';

  @override
  String customer(Object name) {
    return 'گاہک: $name';
  }

  @override
  String idLabel(Object value) {
    return 'ID: $value';
  }

  @override
  String get save => 'محفوظ کریں';

  @override
  String get share => 'شیئر کریں';

  @override
  String get editPDF => 'PDF میں ترمیم کریں';

  @override
  String get failedToSavePDF =>
      'PDF محفوظ کرنے میں ناکام۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String shareFailed(Object error) {
    return 'شیئر کرنے میں ناکام: $error';
  }

  @override
  String get storagePermissionRequired => 'اسٹوریج کی اجازت درکار ہے';

  @override
  String get storagePermissionMessage =>
      'اس ایپ کو PDF ڈاؤن لوڈ فولڈر میں محفوظ کرنے کے لیے اسٹوریج کی اجازت درکار ہے۔ براہ کرم ترتیبات میں اسے فعال کریں۔';

  @override
  String get openSettings => 'ترتیبات کھولیں';

  @override
  String cannotEditInvalidFormat(Object filename) {
    return '\"$filename\" میں ترمیم نہیں کر سکتے: غلط PDF فائل نام کی شکل';
  }

  @override
  String loanNotFoundCannotEdit(Object loanId) {
    return 'قرض $loanId نہیں ملا۔ PDF میں ترمیم نہیں کر سکتے۔';
  }

  @override
  String navigationError(Object error) {
    return 'نیویگیشن کی خرابی: $error';
  }

  @override
  String get pdfDeletedSuccessfully => 'PDF کامیابی سے حذف کر دی گئی';

  @override
  String get fileRemovedFromStorage => 'فائل اسٹوریج سے ہٹا دی گئی';

  @override
  String get dismiss => 'مسترد کریں';

  @override
  String get deletePDF => 'PDF حذف کریں؟';

  @override
  String sureDeleteFilename(Object filename) {
    return 'کیا آپ یقیناً \"$filename\" کو حذف کرنا چاہتے ہیں؟';
  }

  @override
  String failedToDelete(Object error) {
    return 'حذف کرنے میں ناکام: $error';
  }

  @override
  String get editCustomer => 'گاہک میں ترمیم کریں';

  @override
  String get personalInfo => 'ذاتی معلومات';

  @override
  String get contactInfo => 'رابطہ کی معلومات';

  @override
  String get preferences => 'ترجیحات';

  @override
  String get fullName => 'پورا نام';

  @override
  String get nameRequired => 'نام درکار ہے';

  @override
  String get mobileNumberOptional => 'موبائل نمبر';

  @override
  String get mobileRequired => 'موبائل درکار ہے';

  @override
  String get emailOptional => 'ای میل (اختیاری)';

  @override
  String get locationOptional => 'مقام (اختیاری)';

  @override
  String get receiveSMSNotifications =>
      'EMI ادائیگیوں کے لیے SMS اطلاعات حاصل کریں';

  @override
  String get stayUpdatedOnPayments =>
      'قرض کی ادائیگیوں اور یاد دہانیوں کے بارے میں اپ ڈیٹ رہیں';

  @override
  String get updateCustomer => 'گاہک کو اپ ڈیٹ کریں';

  @override
  String get updating => 'اپ ڈیٹ ہو رہا ہے...';

  @override
  String get customerUpdatedSuccessfully => 'گاہک کامیابی سے اپ ڈیٹ ہو گیا!';

  @override
  String get loanAmount => 'قرض کی رقم';

  @override
  String get interestRate => 'سود کی شرح';

  @override
  String get interestType => 'سود کی قسم';

  @override
  String get createLoanTitle => 'قرض بنائیں';

  @override
  String get searchCustomerByNameOrMobile => 'نام یا موبائل نمبر سے تلاش کریں';

  @override
  String get addFirstCustomer => 'پہلا گاہک شامل کریں';

  @override
  String get selectCustomer => 'گاہک منتخب کریں';

  @override
  String get continueToOverview => 'جائزہ پر جاری رکھیں';

  @override
  String loanCreatedFor(Object name) {
    return '$name کے لیے قرض بنایا گیا';
  }

  @override
  String amountDate(Object amount, Object date) {
    return 'رقم: ₹$amount • $date';
  }

  @override
  String get perMonth => '/مہینہ';

  @override
  String get welcomeToFinTech => 'فن ٹیک میں خوش آمدید';

  @override
  String get yourTrustedPartner =>
      'قرض کے انتظام کے لیے آپ کا قابل اعتماد پارٹنر';

  @override
  String get trackLoansEMI => 'آسانی سے قرضوں اور EMI کو ٹریک کریں';

  @override
  String get monitorLoanProgress =>
      'اپنے قرض کی پیشرفت اور EMI نظام الاوقات کو حقیقی وقت میں مانیٹر کریں';

  @override
  String get secureReliable => 'محفوظ اور قابل اعتماد';

  @override
  String get dataProtected => 'آپ کا ڈیٹا صنعتی معیار کی حفاظت سے محفوظ ہے';

  @override
  String get secureReliableEfficient => 'محفوظ • قابل اعتماد • موثر';

  @override
  String get dashboard => 'ڈیش بورڈ';

  @override
  String get customers => 'گاہک';

  @override
  String get overview => 'جائزہ';

  @override
  String get darkMode => 'ڈارک موڈ';

  @override
  String get toggleBetweenThemes => 'لائٹ اور ڈارک تھیم کے درمیان ٹوگل کریں';

  @override
  String get enableSMSNotifications => 'SMS اطلاعات کو فعال کریں';

  @override
  String get sendSMSForEMI => 'EMI ادائیگیوں اور یاد دہانیوں کے لیے SMS بھیجیں';

  @override
  String get myProfile => 'میرا پروفائل';

  @override
  String get permissionRequired => 'اجازت درکار ہے';

  @override
  String get gallery => 'گیلری';

  @override
  String get camera => 'کیمرہ';

  @override
  String get customerLedger => 'گاہک کھاتہ';

  @override
  String get searchByCustomerNameOrMobile =>
      'گاہک کے نام یا موبائل سے تلاش کریں...';

  @override
  String get createYourFirstLoan => 'اپنا پہلا قرض بنائیں';

  @override
  String get loanDataNotFound => 'قرض کا ڈیٹا نہیں ملا';

  @override
  String get pdfUpdatedSuccessfully => 'PDF کامیابی سے اپ ڈیٹ ہو گئی!';

  @override
  String errorUpdatingPDF(Object error) {
    return 'PDF اپ ڈیٹ کرنے میں خرابی: $error';
  }

  @override
  String get cannotSaveDataMissing =>
      'محفوظ نہیں کر سکتے: قرض یا گاہک کا ڈیٹا موجود نہیں۔';

  @override
  String get unknown => 'نامعلوم';

  @override
  String get createLoanSubtitle =>
      'قرض کی تفصیلات مرتب کریں اور EMI کا حساب لگائیں';

  @override
  String get enterAmount => 'رقم درج کریں';

  @override
  String get requiredField => 'درکار ہے';

  @override
  String get invalidAmount => 'غلط رقم';

  @override
  String get monthlyInterestRate => 'ماہانہ سود کی شرح (%)';

  @override
  String get exampleInterestRate => 'مثال کے طور پر، 1.0';

  @override
  String get invalidRate => 'غلط شرح';

  @override
  String get tenureMonths => 'مدت (مہینے)';

  @override
  String get exampleTenure => 'مثال کے طور پر، 12';

  @override
  String get invalidTenure => 'غلط مدت';

  @override
  String get calculatedEmi => 'حساب شدہ EMI';

  @override
  String emiPerMonth(Object amount) {
    return 'فی مہینہ ₹$amount';
  }

  @override
  String get noCustomersFound => 'کوئی گاہک نہیں ملا';

  @override
  String get pleaseSelectCustomer => 'براہ کرم ایک گاہک منتخب کریں';

  @override
  String get loanCreatedSuccessfullyTitle =>
      'قرض کامیابی سے بن گیا! اپنے قرضوں کا جائزہ دیکھیں۔';

  @override
  String get loanCreatedSuccessfullyMessage =>
      'آپ کا قرض بنا دیا گیا ہے۔ EMI کو ٹریک کرنے کے لیے جائزہ پر جاری رکھیں۔';

  @override
  String get simpleInterest => 'سادہ';

  @override
  String get compoundInterest => 'مرکب';

  @override
  String get loanCompletionCertificate => 'قرض تکمیل سند';

  @override
  String get lenderDetails => 'قرض دینے والے کی تفصیلات:';

  @override
  String get loanDetails => 'قرض کی تفصیلات:';

  @override
  String get emiPaymentSummary => 'EMI ادائیگی کا خلاصہ:';

  @override
  String get payAllPendingEMI => 'تمام زیر التوا EMI ادا کریں';

  @override
  String get allEmisPaid => 'مبارک ہو! تمام EMI کامیابی سے ادا کر دی گئیں۔';

  @override
  String get certificateConfirmsCompletion =>
      'یہ سند آپ کے قرض کی تکمیل کی تصدیق کرتی ہے۔';

  @override
  String generatedOn(Object date) {
    return '$date کو تیار کی گئی';
  }

  @override
  String get dueDate => 'آخری تاریخ';

  @override
  String get amount => 'رقم';

  @override
  String get status => 'حالت';

  @override
  String get simple => 'سادہ';

  @override
  String get compound => 'مرکب';

  @override
  String get refreshData => 'ڈیٹا ریفریش کریں';

  @override
  String get loadingLoanData => 'قرض کا ڈیٹا لوڈ ہو رہا ہے...';

  @override
  String get enterPrincipalAmount => 'اصل رقم درج کریں';

  @override
  String get annualInterestRate => 'سالانہ سود کی شرح';

  @override
  String get loanDurationMonths => 'مہینوں میں قرض کی مدت';

  @override
  String get selectInterestTypeHint => 'سود کے حساب کی قسم منتخب کریں';

  @override
  String get customerFullName => 'گاہک کا پورا نام';

  @override
  String get tenDigitPhoneNumber => '10 ہندسوں والا فون نمبر';

  @override
  String get forNotifications => 'اطلاعات کے لیے';

  @override
  String get cityOrAddress => 'شہر یا پتہ';

  @override
  String get saveAndRegeneratePDF => 'محفوظ کریں اور PDF دوبارہ تیار کریں';

  @override
  String get regeneratingPDF => 'PDF دوبارہ تیار کی جا رہی ہے...';

  @override
  String get customerDataNotFound => 'گاہک کا ڈیٹا نہیں ملا';

  @override
  String get editPDFDetails => 'PDF کی تفصیلات میں ترمیم کریں';

  @override
  String get ledgerOutstanding => 'بقایا';

  @override
  String get ledgerCollected => 'اکٹھا کیا گیا';

  @override
  String get ledgerStatusReceive => 'آپ کو ملیں گے';

  @override
  String get ledgerStatusPay => 'آپ دیں گے';

  @override
  String get ledgerStatusSettled => 'تصفیہ ہو گیا';

  @override
  String get recentTransactions => 'حالیہ لین دین';

  @override
  String moreTransactions(Object count) {
    return '+$count مزید لین دین';
  }

  @override
  String get givenAmount => 'دی گئی';

  @override
  String get receivedAmount => 'وصول شدہ';

  @override
  String get today => 'آج';

  @override
  String get yesterday => 'کل';

  @override
  String get tomorrow => 'آنے والا کل';

  @override
  String get noCustomersLedger => 'ابھی تک کوئی گاہک نہیں';

  @override
  String get ledgerEmptyMessage =>
      'اپنا گاہک کھاتہ دیکھنے کے لیے قرض بنا کر شروع کریں۔ لین دین کو ٹریک کریں اور اپنے کاروبار کو مؤثر طریقے سے منظم کریں۔';

  @override
  String get createFirstLoanLedger => 'اپنا پہلا قرض بنائیں';

  @override
  String get loanDisbursed => 'قرض تقسیم کر دیا گیا';

  @override
  String get emiPayment => 'EMI ادائیگی';

  @override
  String get updateProfile => 'پروفائل اپ ڈیٹ کریں';

  @override
  String get saving => 'محفوظ کیا جا رہا ہے...';

  @override
  String get logout => 'لاگ آؤٹ';

  @override
  String get appearance => 'ظاہری شکل';

  @override
  String get smsNotifications => 'ایس ایم ایس اطلاعات';

  @override
  String get enableSmsNotifications => 'ایس ایم ایس اطلاعات کو فعال کریں';

  @override
  String get darkModeToggleSubtitle =>
      'روشن اور تاریک تھیم کے درمیان ٹوگل کریں';

  @override
  String get smsToggleSubtitle =>
      'EMI ادائیگیوں اور یاد دہانیوں کے لیے ایس ایم ایس بھیجیں';

  @override
  String get loadingPDFs => 'پی ڈی ایف لوڈ ہو رہے ہیں...';

  @override
  String get completeLoansWillGeneratePDFsHere =>
      'مکمل قرضے یہاں پی ڈی ایف تیار کریں گے';

  @override
  String pdfCount(int count) {
    return '$count پی ڈی ایف';
  }

  @override
  String get tapPDFToShareViaWhatsApp =>
      'واٹس ایپ پر شیئر کرنے کے لیے کسی بھی پی ڈی ایف پر ٹیپ کریں';

  @override
  String get saveToDownloads => 'ڈاؤن لوڈ میں محفوظ کریں';

  @override
  String get shareViaWhatsApp => 'واٹس ایپ کے ذریعے شیئر کریں';

  @override
  String get gotIt => 'سمجھ آ گیا';

  @override
  String get permanentlyDeleteWarning => 'یہ مستقل طور پر حذف کر دے گا:';

  @override
  String get actionCannotBeUndone => 'اس عمل کو واپس نہیں لیا جا سکتا۔';

  @override
  String get retry => 'دوبارہ کوشش کریں';

  @override
  String get noLanguageMatch => 'آپ کی تلاش سے مماثل کوئی زبان نہیں';

  @override
  String get selected => 'منتخب کردہ';

  @override
  String get allow => 'اجازت دیں';

  @override
  String get logoutConfirmation => 'کیا آپ واقعی لاگ آؤٹ کرنا چاہتے ہیں؟';

  @override
  String get loanManagementProfessional => 'قرضہ مینجمنٹ پروفیشنل';

  @override
  String get accountDetails => 'اکاؤنٹ کی تفصیلات';
}
