// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'লোন ম্যানেজার';

  @override
  String get dashboardTitle => 'ড্যাশবোর্ড';

  @override
  String get keyMetrics => 'মূল মেট্রিক্স';

  @override
  String get totalLoans => 'মোট লোন';

  @override
  String get activeLoans => 'সক্রিয় লোন';

  @override
  String get totalCustomers => 'মোট গ্রাহক';

  @override
  String get pendingEMIs => 'বাকি EMI';

  @override
  String get totalLoanAmount => 'মোট লোনের পরিমাণ';

  @override
  String get totalProfit => 'মোট মুনাফা';

  @override
  String get quickActions => 'দ্রুত কর্ম';

  @override
  String get addCustomer => 'গ্রাহক যোগ করুন';

  @override
  String get createLoan => 'লোন তৈরি করুন';

  @override
  String get emiLedger => 'EMI খতিয়ান';

  @override
  String get pdfDocuments => 'PDF নথি';

  @override
  String get recentActivity => 'সাম্প্রতিক কার্যকলাপ';

  @override
  String get noRecentActivity => 'কোনো সাম্প্রতিক কার্যকলাপ নেই';

  @override
  String get selectLanguage => 'ভাষা নির্বাচন করুন';

  @override
  String get userProfile => 'ব্যবহারকারী প্রোফাইল';

  @override
  String get settings => 'সেটিংস';

  @override
  String get languages => 'ভাষাসমূহ';

  @override
  String helloUser(Object user) {
    return 'হ্যালো, $user!';
  }

  @override
  String get welcomeBack => 'আপনার ড্যাশবোর্ডে ফিরে স্বাগতম 👋';

  @override
  String get exitAppTitle => 'অ্যাপ থেকে প্রস্থান';

  @override
  String get exitAppMessage =>
      'আপনি কি নিশ্চিত যে অ্যাপ থেকে প্রস্থান করতে চান?';

  @override
  String get cancel => 'বাতিল';

  @override
  String get exit => 'প্রস্থান';

  @override
  String languageSelected(Object language) {
    return '$language ভাষা নির্বাচিত হয়েছে';
  }

  @override
  String get finTech => 'ফিনটেক';

  @override
  String get secureLogin => 'নিরাপদ লগইন';

  @override
  String get mobileNumber => 'মোবাইল নম্বর';

  @override
  String get enterMobileNumber => 'আপনার মোবাইল নম্বর লিখুন';

  @override
  String get pleaseEnterMobileNumber => 'অনুগ্রহ করে আপনার মোবাইল নম্বর লিখুন';

  @override
  String get enterValidMobileNumber => 'একটি বৈধ ১০-অঙ্কের মোবাইল নম্বর লিখুন';

  @override
  String get name => 'নাম';

  @override
  String get enterName => 'আপনার নাম লিখুন';

  @override
  String get pleaseEnterName => 'অনুগ্রহ করে আপনার নাম লিখুন';

  @override
  String get email => 'ইমেইল';

  @override
  String get enterEmail => 'আপনার ইমেইল লিখুন';

  @override
  String get pleaseEnterEmail => 'অনুগ্রহ করে আপনার ইমেইল লিখুন';

  @override
  String get enterValidEmail => 'একটি বৈধ ইমেইল ঠিকানা লিখুন';

  @override
  String get location => 'অবস্থান';

  @override
  String get enterLocation => 'আপনার অবস্থান লিখুন';

  @override
  String get pleaseEnterLocation => 'অনুগ্রহ করে আপনার অবস্থান লিখুন';

  @override
  String get mPin => 'এম-পিন';

  @override
  String get enterMPin => 'আপনার এম-পিন লিখুন';

  @override
  String get pleaseEnterMPin => 'অনুগ্রহ করে আপনার এম-পিন লিখুন';

  @override
  String get mPinMustBe4To6Digits => 'এম-পিন ৪-৬ অঙ্কের হতে হবে';

  @override
  String get login => 'লগইন';

  @override
  String get congratulations => 'অভিনন্দন!';

  @override
  String get loggedInSuccessfully => 'আপনি সফলভাবে লগইন করেছেন';

  @override
  String get allCustomers => 'সমস্ত গ্রাহক';

  @override
  String get searchCustomers => 'গ্রাহক অনুসন্ধান করুন...';

  @override
  String get noCustomersYet => 'এখনও কোন গ্রাহক নেই';

  @override
  String get startBuildingCustomerDatabase =>
      'আপনার প্রথম গ্রাহক যোগ করে আপনার গ্রাহক ডাটাবেস তৈরি শুরু করুন।';

  @override
  String get addYourFirstCustomer => 'আপনার প্রথম গ্রাহক যোগ করুন';

  @override
  String get noResultsFound => 'কোন ফলাফল পাওয়া যায়নি';

  @override
  String get tryAdjustingSearchTerms =>
      'আপনার অনুসন্ধানের শব্দ সামঞ্জস্য করুন বা বানান পরীক্ষা করুন।';

  @override
  String get deleteCustomer => 'গ্রাহক মুছুন';

  @override
  String areYouSureDeleteCustomer(Object name) {
    return 'আপনি কি নিশ্চিত $name মুছতে চান? এই কাজটি পূর্বাবস্থায় ফেরানো যাবে না।';
  }

  @override
  String customerDeletedSuccessfully(Object name) {
    return '$name সফলভাবে মুছে ফেলা হয়েছে';
  }

  @override
  String get delete => 'মুছুন';

  @override
  String get addCustomerTitle => 'গ্রাহক যোগ করুন';

  @override
  String get customerDetails => 'গ্রাহকের বিবরণ';

  @override
  String get mobile => 'মোবাইল';

  @override
  String get pleaseEnterMobile => 'অনুগ্রহ করে একটি মোবাইল নম্বর লিখুন';

  @override
  String get pleaseEnterEmailAddress => 'অনুগ্রহ করে একটি ইমেইল লিখুন';

  @override
  String get smsConsent =>
      'আমি EMI পেমেন্টের জন্য SMS বিজ্ঞপ্তি পেতে সম্মতি দিচ্ছি';

  @override
  String get customerAdded => 'গ্রাহক যোগ করা হয়েছে!';

  @override
  String get customerAddedSuccessfully =>
      'গ্রাহক সফলভাবে যোগ করা হয়েছে\nলোন তৈরির জন্য প্রস্তুত!';

  @override
  String get continueText => 'চালিয়ে যান';

  @override
  String get pleaseFillAllRequiredFields =>
      'অনুগ্রহ করে সমস্ত প্রয়োজনীয় ক্ষেত্র পূরণ করুন';

  @override
  String get overviewLoans => 'লোনের ওভারভিউ';

  @override
  String get active => 'সক্রিয়';

  @override
  String get completed => 'সমাপ্ত';

  @override
  String get pending => 'বাকি';

  @override
  String get searchByCustomerMobile =>
      'গ্রাহকের মোবাইল নম্বর দ্বারা অনুসন্ধান করুন';

  @override
  String get noActiveLoans => 'কোন সক্রিয় লোন নেই';

  @override
  String get noCompletedLoans => 'কোন সমাপ্ত লোন নেই';

  @override
  String get noPendingLoans => 'কোন বাকি লোন নেই';

  @override
  String get allEMIsPaidSuccessfully => 'সমস্ত EMI সফলভাবে পরিশোধ করা হয়েছে';

  @override
  String get moveToPDFDocuments => 'আপনি কি PDF দেখতে PDF নথিতে যেতে চান?';

  @override
  String get later => 'পরে';

  @override
  String get viewPDF => 'PDF দেখুন';

  @override
  String get loanEMIDetails => 'লোনের EMI বিবরণ';

  @override
  String loanID(Object id) {
    return 'লোন আইডি: $id...';
  }

  @override
  String get principal => 'মূলধন';

  @override
  String get emiLabel => 'EMI';

  @override
  String get rate => 'হার';

  @override
  String get tenure => 'মেয়াদ';

  @override
  String get months => 'মাস';

  @override
  String get markAsPaid => 'পরিশোধিত হিসাবে চিহ্নিত করুন';

  @override
  String get paid => 'পরিশোধিত';

  @override
  String get markAllEMIsPaid => 'সমস্ত EMI পরিশোধিত হিসাবে চিহ্নিত করুন';

  @override
  String markAllPendingEMIsAsPaid(Object count) {
    return 'সমস্ত $count বাকি EMI পরিশোধিত হিসাবে চিহ্নিত করুন';
  }

  @override
  String markAllEMIsPaidConfirm(Object count) {
    return 'আপনি কি নিশ্চিত? এটি সমস্ত $count বাকি EMI পরিশোধিত হিসাবে চিহ্নিত করবে এবং সমাপ্তির PDF পুনরায় তৈরি করবে।';
  }

  @override
  String get confirm => 'নিশ্চিত করুন';

  @override
  String allEMIsMarkedAsPaid(Object count) {
    return 'সমস্ত $count EMI পরিশোধিত হিসাবে চিহ্নিত করা হয়েছে! PDF পুনরায় তৈরি করা হয়েছে।';
  }

  @override
  String get loanCompletedSuccessfully =>
      'লোন সফলভাবে সম্পন্ন হয়েছে! PDF স্বয়ংক্রিয়ভাবে তৈরি করা হয়েছে এবং PDF নথিতে উপলব্ধ।';

  @override
  String get emiMarkedAsPaid =>
      'EMI সফলভাবে পরিশোধিত হিসাবে চিহ্নিত করা হয়েছে!';

  @override
  String get unknownCustomer => 'অজানা গ্রাহক';

  @override
  String due(Object date) {
    return 'বাকি: $date';
  }

  @override
  String get emiSchedule => 'EMI সময়সূচী';

  @override
  String get searchCustomer => 'গ্রাহক অনুসন্ধান করুন';

  @override
  String get searchByNameOrMobile =>
      'নাম বা মোবাইল নম্বর দ্বারা অনুসন্ধান করুন';

  @override
  String get filterByCustomer => 'গ্রাহক অনুযায়ী ফিল্টার করুন (ঐচ্ছিক)';

  @override
  String get allCustomersLabel => 'সমস্ত গ্রাহক';

  @override
  String get noEMISchedulesFound => 'কোন EMI সময়সূচী পাওয়া যায়নি';

  @override
  String get tryAdjustingSearchFilter =>
      'আপনার অনুসন্ধান বা ফিল্টারের মানদণ্ড সামঞ্জস্য করুন';

  @override
  String get allLoanPDFs => 'সমস্ত লোনের PDF';

  @override
  String get noLoanCompletionPDFs =>
      'কোন লোন সমাপ্তির PDF পাওয়া যায়নি\nলোনের সারাংশ থেকে PDF তৈরি করুন';

  @override
  String customer(Object name) {
    return 'গ্রাহক: $name';
  }

  @override
  String idLabel(Object value) {
    return 'আইডি: $value';
  }

  @override
  String get save => 'সংরক্ষণ করুন';

  @override
  String get share => 'শেয়ার করুন';

  @override
  String get editPDF => 'PDF সম্পাদনা করুন';

  @override
  String get failedToSavePDF =>
      'PDF সংরক্ষণ করতে ব্যর্থ। অনুগ্রহ করে আবার চেষ্টা করুন।';

  @override
  String shareFailed(Object error) {
    return 'শেয়ার করতে ব্যর্থ: $error';
  }

  @override
  String get storagePermissionRequired => 'স্টোরেজ অনুমতি প্রয়োজন';

  @override
  String get storagePermissionMessage =>
      'এই অ্যাপটির PDF ডাউনলোড ফোল্ডারে সংরক্ষণ করতে স্টোরেজ অনুমতি প্রয়োজন। অনুগ্রহ করে সেটিংসে এটি সক্রিয় করুন।';

  @override
  String get openSettings => 'সেটিংস খুলুন';

  @override
  String cannotEditInvalidFormat(Object filename) {
    return '\"$filename\" সম্পাদনা করতে পারবেন না: অবৈধ PDF ফাইলের নাম ফরম্যাট';
  }

  @override
  String loanNotFoundCannotEdit(Object loanId) {
    return 'লোন $loanId পাওয়া যায়নি। PDF সম্পাদনা করতে পারবেন না।';
  }

  @override
  String navigationError(Object error) {
    return 'নেভিগেশন ত্রুটি: $error';
  }

  @override
  String get pdfDeletedSuccessfully => 'PDF সফলভাবে মুছে ফেলা হয়েছে';

  @override
  String get fileRemovedFromStorage => 'ফাইল স্টোরেজ থেকে সরানো হয়েছে';

  @override
  String get dismiss => 'বাতিল করুন';

  @override
  String get deletePDF => 'PDF মুছবেন?';

  @override
  String sureDeleteFilename(Object filename) {
    return 'আপনি কি নিশ্চিত \"$filename\" মুছতে চান?';
  }

  @override
  String failedToDelete(Object error) {
    return 'মুছতে ব্যর্থ: $error';
  }

  @override
  String get editCustomer => 'গ্রাহক সম্পাদনা করুন';

  @override
  String get personalInfo => 'ব্যক্তিগত তথ্য';

  @override
  String get contactInfo => 'যোগাযোগের তথ্য';

  @override
  String get preferences => 'পছন্দ';

  @override
  String get fullName => 'পুরো নাম';

  @override
  String get nameRequired => 'নাম প্রয়োজন';

  @override
  String get mobileNumberOptional => 'মোবাইল নম্বর';

  @override
  String get mobileRequired => 'মোবাইল প্রয়োজন';

  @override
  String get emailOptional => 'ইমেইল (ঐচ্ছিক)';

  @override
  String get locationOptional => 'অবস্থান (ঐচ্ছিক)';

  @override
  String get receiveSMSNotifications => 'EMI পেমেন্টের জন্য SMS বিজ্ঞপ্তি পান';

  @override
  String get stayUpdatedOnPayments =>
      'লোন পেমেন্ট এবং রিমাইন্ডার সম্পর্কে অবগত থাকুন';

  @override
  String get updateCustomer => 'গ্রাহক আপডেট করুন';

  @override
  String get updating => 'আপডেট করা হচ্ছে...';

  @override
  String get customerUpdatedSuccessfully => 'গ্রাহক সফলভাবে আপডেট করা হয়েছে!';

  @override
  String get loanAmount => 'লোনের পরিমাণ';

  @override
  String get interestRate => 'সুদের হার';

  @override
  String get interestType => 'সুদের ধরন';

  @override
  String get createLoanTitle => 'লোন তৈরি করুন';

  @override
  String get searchCustomerByNameOrMobile =>
      'নাম বা মোবাইল নম্বর দ্বারা অনুসন্ধান করুন';

  @override
  String get addFirstCustomer => 'প্রথম গ্রাহক যোগ করুন';

  @override
  String get selectCustomer => 'গ্রাহক নির্বাচন করুন';

  @override
  String get continueToOverview => 'ওভারভিউতে চালিয়ে যান';

  @override
  String loanCreatedFor(Object name) {
    return '$name এর জন্য লোন তৈরি করা হয়েছে';
  }

  @override
  String amountDate(Object amount, Object date) {
    return 'পরিমাণ: ₹$amount • $date';
  }

  @override
  String get perMonth => '/মাস';

  @override
  String get welcomeToFinTech => 'ফিনটেক এ স্বাগতম';

  @override
  String get yourTrustedPartner =>
      'লোন ম্যানেজমেন্টের জন্য আপনার বিশ্বস্ত সঙ্গী';

  @override
  String get trackLoansEMI => 'সহজে লোন ও EMI ট্র্যাক করুন';

  @override
  String get monitorLoanProgress =>
      'আপনার লোনের অগ্রগতি এবং EMI সময়সূচী রিয়েল-টাইমে পর্যবেক্ষণ করুন';

  @override
  String get secureReliable => 'নিরাপদ ও নির্ভরযোগ্য';

  @override
  String get dataProtected =>
      'আপনার ডেটা ইন্ডাস্ট্রি-স্ট্যান্ডার্ড নিরাপত্তার সাথে সুরক্ষিত';

  @override
  String get secureReliableEfficient => 'নিরাপদ • নির্ভরযোগ্য • কার্যকর';

  @override
  String get dashboard => 'ড্যাশবোর্ড';

  @override
  String get customers => 'গ্রাহক';

  @override
  String get overview => 'ওভারভিউ';

  @override
  String get darkMode => 'ডার্ক মোড';

  @override
  String get toggleBetweenThemes => 'লাইট এবং ডার্ক থিমের মধ্যে টগল করুন';

  @override
  String get enableSMSNotifications => 'SMS বিজ্ঞপ্তি সক্রিয় করুন';

  @override
  String get sendSMSForEMI => 'EMI পেমেন্ট এবং রিমাইন্ডারের জন্য SMS পাঠান';

  @override
  String get myProfile => 'আমার প্রোফাইল';

  @override
  String get permissionRequired => 'অনুমতি প্রয়োজন';

  @override
  String get gallery => 'গ্যালারি';

  @override
  String get camera => 'ক্যামেরা';

  @override
  String get customerLedger => 'গ্রাহক খতিয়ান';

  @override
  String get searchByCustomerNameOrMobile =>
      'গ্রাহকের নাম বা মোবাইল দ্বারা অনুসন্ধান করুন...';

  @override
  String get createYourFirstLoan => 'আপনার প্রথম লোন তৈরি করুন';

  @override
  String get loanDataNotFound => 'লোনের তথ্য পাওয়া যায়নি';

  @override
  String get pdfUpdatedSuccessfully => 'PDF সফলভাবে আপডেট করা হয়েছে!';

  @override
  String errorUpdatingPDF(Object error) {
    return 'PDF আপডেট করতে ত্রুটি: $error';
  }

  @override
  String get cannotSaveDataMissing =>
      'সংরক্ষণ করতে পারবেন না: লোন বা গ্রাহকের তথ্য অনুপস্থিত।';

  @override
  String get unknown => 'অজানা';

  @override
  String get createLoanSubtitle => 'লোনের বিবরণ সেটআপ করুন এবং EMI গণনা করুন';

  @override
  String get enterAmount => 'পরিমাণ লিখুন';

  @override
  String get requiredField => 'প্রয়োজনীয়';

  @override
  String get invalidAmount => 'অবৈধ পরিমাণ';

  @override
  String get monthlyInterestRate => 'মাসিক সুদের হার (%)';

  @override
  String get exampleInterestRate => 'যেমন, 1.0';

  @override
  String get invalidRate => 'অবৈধ হার';

  @override
  String get tenureMonths => 'মেয়াদ (মাস)';

  @override
  String get exampleTenure => 'যেমন, 12';

  @override
  String get invalidTenure => 'অবৈধ মেয়াদ';

  @override
  String get calculatedEmi => 'গণনা করা EMI';

  @override
  String emiPerMonth(Object amount) {
    return 'প্রতি মাসে ₹$amount';
  }

  @override
  String get noCustomersFound => 'কোন গ্রাহক পাওয়া যায়নি';

  @override
  String get pleaseSelectCustomer => 'অনুগ্রহ করে একজন গ্রাহক নির্বাচন করুন';

  @override
  String get loanCreatedSuccessfullyTitle =>
      'লোন সফলভাবে তৈরি হয়েছে! আপনার লোনের ওভারভিউ দেখুন।';

  @override
  String get loanCreatedSuccessfullyMessage =>
      'আপনার লোন তৈরি করা হয়েছে। EMI ট্র্যাক করতে ওভারভিউতে চালিয়ে যান।';

  @override
  String get simpleInterest => 'সরল';

  @override
  String get compoundInterest => 'চক্রবৃদ্ধি';

  @override
  String get loanCompletionCertificate => 'লোন সমাপ্তির সনদ';

  @override
  String get lenderDetails => 'ঋণদাতার বিবরণ:';

  @override
  String get loanDetails => 'লোনের বিবরণ:';

  @override
  String get emiPaymentSummary => 'EMI পেমেন্টের সারাংশ:';

  @override
  String get payAllPendingEMI => 'সমস্ত বাকি EMI পরিশোধ করুন';

  @override
  String get allEmisPaid => 'অভিনন্দন! সমস্ত EMI সফলভাবে পরিশোধ করা হয়েছে।';

  @override
  String get certificateConfirmsCompletion =>
      'এই সনদটি আপনার লোনের সমাপ্তি নিশ্চিত করে।';

  @override
  String generatedOn(Object date) {
    return '$date তারিখে তৈরি করা হয়েছে';
  }

  @override
  String get dueDate => 'শেষ তারিখ';

  @override
  String get amount => 'পরিমাণ';

  @override
  String get status => 'স্থিতি';

  @override
  String get simple => 'সরল';

  @override
  String get compound => 'চক্রবৃদ্ধি';

  @override
  String get refreshData => 'ডেটা রিফ্রেশ করুন';

  @override
  String get loadingLoanData => 'লোনের তথ্য লোড হচ্ছে...';

  @override
  String get enterPrincipalAmount => 'মূলধনের পরিমাণ লিখুন';

  @override
  String get annualInterestRate => 'বার্ষিক সুদের হার';

  @override
  String get loanDurationMonths => 'মাসে লোনের মেয়াদ';

  @override
  String get selectInterestTypeHint => 'সুদ গণনার ধরন নির্বাচন করুন';

  @override
  String get customerFullName => 'গ্রাহকের পুরো নাম';

  @override
  String get tenDigitPhoneNumber => '১০ অঙ্কের ফোন নম্বর';

  @override
  String get forNotifications => 'বিজ্ঞপ্তির জন্য';

  @override
  String get cityOrAddress => 'শহর বা ঠিকানা';

  @override
  String get saveAndRegeneratePDF => 'সংরক্ষণ করুন ও PDF পুনরায় তৈরি করুন';

  @override
  String get regeneratingPDF => 'PDF পুনরায় তৈরি করা হচ্ছে...';

  @override
  String get customerDataNotFound => 'গ্রাহকের তথ্য পাওয়া যায়নি';

  @override
  String get editPDFDetails => 'PDF বিবরণ সম্পাদনা করুন';

  @override
  String get ledgerOutstanding => 'বাকি';

  @override
  String get ledgerCollected => 'সংগৃহীত';

  @override
  String get ledgerStatusReceive => 'আপনি পাবেন';

  @override
  String get ledgerStatusPay => 'আপনি দেবেন';

  @override
  String get ledgerStatusSettled => 'নিষ্পত্তি হয়েছে';

  @override
  String get recentTransactions => 'সাম্প্রতিক লেনদেন';

  @override
  String moreTransactions(Object count) {
    return '+$count আরও লেনদেন';
  }

  @override
  String get givenAmount => 'দেওয়া হয়েছে';

  @override
  String get receivedAmount => 'নেওয়া হয়েছে';

  @override
  String get today => 'আজ';

  @override
  String get yesterday => 'গতকাল';

  @override
  String get tomorrow => 'আগামীকাল';

  @override
  String get noCustomersLedger => 'এখনও কোন গ্রাহক নেই';

  @override
  String get ledgerEmptyMessage =>
      'আপনার গ্রাহক খতিয়ান দেখতে লোন তৈরি করে শুরু করুন। লেনদেন ট্র্যাক করুন এবং আপনার ব্যবসা কার্যকরভাবে পরিচালনা করুন।';

  @override
  String get createFirstLoanLedger => 'আপনার প্রথম লোন তৈরি করুন';

  @override
  String get loanDisbursed => 'লোন বিতরণ করা হয়েছে';

  @override
  String get emiPayment => 'EMI পেমেন্ট';

  @override
  String get updateProfile => 'প্রোফাইল আপডেট করুন';

  @override
  String get saving => 'সংরক্ষণ করা হচ্ছে...';

  @override
  String get logout => 'লগ আউট';

  @override
  String get appearance => 'চেহেরা';

  @override
  String get smsNotifications => 'এসএমএস বিজ্ঞপ্তি';

  @override
  String get enableSmsNotifications => 'এসএমএস বিজ্ঞপ্তি সক্রিয় করুন';

  @override
  String get darkModeToggleSubtitle => 'হালকা এবং গাঢ় থিমের মধ্যে টগল করুন';

  @override
  String get smsToggleSubtitle =>
      'ইএমআই পেমেন্ট ও রিমাইন্ডারের জন্য এসএমএস পাঠান';

  @override
  String get loadingPDFs => 'পিডিএফ লোড হচ্ছে...';

  @override
  String get completeLoansWillGeneratePDFsHere =>
      'সম্পূর্ণ ঋণ এখানে পিডিএফ তৈরি করবে';

  @override
  String pdfCount(int count) {
    return '$countটি পিডিএফ';
  }

  @override
  String get tapPDFToShareViaWhatsApp =>
      'হোয়াটসঅ্যাপে শেয়ার করতে যেকোনো পিডিএফ-এ ট্যাপ করুন';

  @override
  String get saveToDownloads => 'ডাউনলোডে সংরক্ষণ করুন';

  @override
  String get shareViaWhatsApp => 'হোয়াটসঅ্যাপের মাধ্যমে শেয়ার করুন';

  @override
  String get gotIt => 'বুঝতে পেরেছি';

  @override
  String get permanentlyDeleteWarning => 'এটি স্থায়ীভাবে মুছে ফেলবে:';

  @override
  String get actionCannotBeUndone => 'এই কাজটি পূর্বাবস্থায় ফেরানো যাবে না।';

  @override
  String get retry => 'পুনরায় চেষ্টা করুন';

  @override
  String get noLanguageMatch => 'আপনার অনুসন্ধানের সাথে মেলে এমন কোন ভাষা নেই';

  @override
  String get selected => 'নির্বাচিত';

  @override
  String get allow => 'অনুমতি দিন';

  @override
  String get logoutConfirmation => 'আপনি কি নিশ্চিত যে আপনি লগ আউট করতে চান?';

  @override
  String get loanManagementProfessional => 'ঋণ ব্যবস্থাপনা পেশাদার';

  @override
  String get accountDetails => 'অ্যাকাউন্টের বিবরণ';
}
