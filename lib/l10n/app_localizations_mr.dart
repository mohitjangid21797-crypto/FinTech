// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'लोन मॅनेजर';

  @override
  String get dashboardTitle => 'डॅशबोर्ड';

  @override
  String get keyMetrics => 'मुख्य मेट्रिक्स';

  @override
  String get totalLoans => 'एकूण कर्जे';

  @override
  String get activeLoans => 'सक्रिय कर्जे';

  @override
  String get totalCustomers => 'एकूण ग्राहक';

  @override
  String get pendingEMIs => 'बाकी EMI';

  @override
  String get totalLoanAmount => 'एकूण कर्ज रक्कम';

  @override
  String get totalProfit => 'एकूण नफा';

  @override
  String get quickActions => 'त्वरित क्रिया';

  @override
  String get addCustomer => 'ग्राहक जोडा';

  @override
  String get createLoan => 'कर्ज तयार करा';

  @override
  String get emiLedger => 'EMI खातेवही';

  @override
  String get pdfDocuments => 'PDF दस्तऐवज';

  @override
  String get recentActivity => 'अलीकडील क्रियाकलाप';

  @override
  String get noRecentActivity => 'अलीकडील कोणताही क्रियाकलाप नाही';

  @override
  String get selectLanguage => 'भाषा निवडा';

  @override
  String get userProfile => 'वापरकर्ता प्रोफाइल';

  @override
  String get settings => 'सेटिंग्ज';

  @override
  String get languages => 'भाषा';

  @override
  String helloUser(Object user) {
    return 'नमस्कार, $user!';
  }

  @override
  String get welcomeBack => 'आपल्या डॅशबोर्डवर परत स्वागत आहे 👋';

  @override
  String get exitAppTitle => 'अॅपमधून बाहेर पडा';

  @override
  String get exitAppMessage => 'तुम्हाला खात्रीने अॅपमधून बाहेर पडायचे आहे का?';

  @override
  String get cancel => 'रद्द करा';

  @override
  String get exit => 'बाहेर पडा';

  @override
  String languageSelected(Object language) {
    return '$language भाषा निवडली';
  }

  @override
  String get finTech => 'फिनटेक';

  @override
  String get secureLogin => 'सुरक्षित लॉगिन';

  @override
  String get mobileNumber => 'मोबाइल नंबर';

  @override
  String get enterMobileNumber => 'आपला मोबाइल नंबर प्रविष्ट करा';

  @override
  String get pleaseEnterMobileNumber => 'कृपया आपला मोबाइल नंबर प्रविष्ट करा';

  @override
  String get enterValidMobileNumber => 'वैध 10-अंकी मोबाइल नंबर प्रविष्ट करा';

  @override
  String get name => 'नाव';

  @override
  String get enterName => 'आपले नाव प्रविष्ट करा';

  @override
  String get pleaseEnterName => 'कृपया आपले नाव प्रविष्ट करा';

  @override
  String get email => 'ईमेल';

  @override
  String get enterEmail => 'आपला ईमेल प्रविष्ट करा';

  @override
  String get pleaseEnterEmail => 'कृपया आपला ईमेल प्रविष्ट करा';

  @override
  String get enterValidEmail => 'वैध ईमेल पत्ता प्रविष्ट करा';

  @override
  String get location => 'स्थान';

  @override
  String get enterLocation => 'आपले स्थान प्रविष्ट करा';

  @override
  String get pleaseEnterLocation => 'कृपया आपले स्थान प्रविष्ट करा';

  @override
  String get mPin => 'एम-पिन';

  @override
  String get enterMPin => 'आपला एम-पिन प्रविष्ट करा';

  @override
  String get pleaseEnterMPin => 'कृपया आपला एम-पिन प्रविष्ट करा';

  @override
  String get mPinMustBe4To6Digits => 'एम-पिन 4-6 अंकांचा असणे आवश्यक आहे';

  @override
  String get login => 'लॉगिन';

  @override
  String get congratulations => 'अभिनंदन!';

  @override
  String get loggedInSuccessfully => 'आपण यशस्वीरित्या लॉगिन केले आहे';

  @override
  String get allCustomers => 'सर्व ग्राहक';

  @override
  String get searchCustomers => 'ग्राहक शोधा...';

  @override
  String get noCustomersYet => 'अद्याप कोणतेही ग्राहक नाहीत';

  @override
  String get startBuildingCustomerDatabase =>
      'आपला पहिला ग्राहक जोडून आपला ग्राहक डेटाबेस तयार करण्यास प्रारंभ करा.';

  @override
  String get addYourFirstCustomer => 'आपला पहिला ग्राहक जोडा';

  @override
  String get noResultsFound => 'कोणतेही परिणाम सापडले नाहीत';

  @override
  String get tryAdjustingSearchTerms =>
      'आपले शोध शब्द समायोजित करा किंवा शब्दलेखन तपासा.';

  @override
  String get deleteCustomer => 'ग्राहक हटवा';

  @override
  String areYouSureDeleteCustomer(Object name) {
    return 'तुम्हाला खात्रीने $name हटवायचे आहे का? ही क्रिया पूर्ववत करता येणार नाही.';
  }

  @override
  String customerDeletedSuccessfully(Object name) {
    return '$name यशस्वीरित्या हटविले';
  }

  @override
  String get delete => 'हटवा';

  @override
  String get addCustomerTitle => 'ग्राहक जोडा';

  @override
  String get customerDetails => 'ग्राहक तपशील';

  @override
  String get mobile => 'मोबाइल';

  @override
  String get pleaseEnterMobile => 'कृपया मोबाइल नंबर प्रविष्ट करा';

  @override
  String get pleaseEnterEmailAddress => 'कृपया ईमेल प्रविष्ट करा';

  @override
  String get smsConsent =>
      'मी EMI पेमेंटसाठी SMS सूचना प्राप्त करण्यास संमती देतो';

  @override
  String get customerAdded => 'ग्राहक जोडला!';

  @override
  String get customerAddedSuccessfully =>
      'ग्राहक यशस्वीरित्या जोडला\nकर्ज तयार करण्यासाठी सज्ज!';

  @override
  String get continueText => 'पुढे जा';

  @override
  String get pleaseFillAllRequiredFields => 'कृपया सर्व आवश्यक फील्ड भरा';

  @override
  String get overviewLoans => 'कर्जांचे विहंगावलोकन';

  @override
  String get active => 'सक्रिय';

  @override
  String get completed => 'पूर्ण';

  @override
  String get pending => 'बाकी';

  @override
  String get searchByCustomerMobile => 'ग्राहकाच्या मोबाइल नंबरद्वारे शोधा';

  @override
  String get noActiveLoans => 'सक्रिय कर्जे नाहीत';

  @override
  String get noCompletedLoans => 'पूर्ण कर्जे नाहीत';

  @override
  String get noPendingLoans => 'बाकी कर्जे नाहीत';

  @override
  String get allEMIsPaidSuccessfully => 'सर्व EMI यशस्वीरित्या भरले गेले';

  @override
  String get moveToPDFDocuments =>
      'तुम्हाला त्याचे PDF पाहण्यासाठी PDF दस्तऐवजांकडे जायचे आहे का?';

  @override
  String get later => 'नंतर';

  @override
  String get viewPDF => 'PDF पहा';

  @override
  String get loanEMIDetails => 'कर्ज EMI तपशील';

  @override
  String loanID(Object id) {
    return 'कर्ज ID: $id...';
  }

  @override
  String get principal => 'मुद्दल';

  @override
  String get emiLabel => 'EMI';

  @override
  String get rate => 'दर';

  @override
  String get tenure => 'मुदत';

  @override
  String get months => 'महिने';

  @override
  String get markAsPaid => 'भरले म्हणून चिन्हांकित करा';

  @override
  String get paid => 'भरले';

  @override
  String get markAllEMIsPaid => 'सर्व EMI भरले म्हणून चिन्हांकित करा';

  @override
  String markAllPendingEMIsAsPaid(Object count) {
    return 'सर्व $count बाकी EMI भरले म्हणून चिन्हांकित करा';
  }

  @override
  String markAllEMIsPaidConfirm(Object count) {
    return 'तुम्हाला खात्री आहे का? यामुळे सर्व $count बाकी EMI भरले म्हणून चिन्हांकित होतील आणि पूर्णता PDF पुन्हा निर्माण होईल.';
  }

  @override
  String get confirm => 'पुष्टी करा';

  @override
  String allEMIsMarkedAsPaid(Object count) {
    return 'सर्व $count EMI भरले म्हणून चिन्हांकित केले! PDF पुन्हा निर्माण केले.';
  }

  @override
  String get loanCompletedSuccessfully =>
      'कर्ज यशस्वीरित्या पूर्ण झाले! PDF स्वयंचलितपणे तयार केले गेले आहे आणि PDF दस्तऐवजांमध्ये उपलब्ध आहे.';

  @override
  String get emiMarkedAsPaid => 'EMI यशस्वीरित्या भरले म्हणून चिन्हांकित केले!';

  @override
  String get unknownCustomer => 'अज्ञात ग्राहक';

  @override
  String due(Object date) {
    return 'बाकी: $date';
  }

  @override
  String get emiSchedule => 'EMI वेळापत्रक';

  @override
  String get searchCustomer => 'ग्राहक शोधा';

  @override
  String get searchByNameOrMobile => 'नाव किंवा मोबाइल नंबरद्वारे शोधा';

  @override
  String get filterByCustomer => 'ग्राहकानुसार फिल्टर करा (ऐच्छिक)';

  @override
  String get allCustomersLabel => 'सर्व ग्राहक';

  @override
  String get noEMISchedulesFound => 'EMI वेळापत्रके सापडली नाहीत';

  @override
  String get tryAdjustingSearchFilter =>
      'आपले शोध किंवा फिल्टर निकष समायोजित करा';

  @override
  String get allLoanPDFs => 'सर्व कर्जांची PDF';

  @override
  String get noLoanCompletionPDFs =>
      'कर्ज पूर्णतेची PDF सापडली नाहीत\nकर्ज सारांशांमधून PDF तयार करा';

  @override
  String customer(Object name) {
    return 'ग्राहक: $name';
  }

  @override
  String idLabel(Object value) {
    return 'ID: $value';
  }

  @override
  String get save => 'जतन करा';

  @override
  String get share => 'शेअर करा';

  @override
  String get editPDF => 'PDF संपादित करा';

  @override
  String get failedToSavePDF =>
      'PDF जतन करण्यात अयशस्वी. कृपया पुन्हा प्रयत्न करा.';

  @override
  String shareFailed(Object error) {
    return 'शेअर करण्यात अयशस्वी: $error';
  }

  @override
  String get storagePermissionRequired => 'स्टोरेज परवानगी आवश्यक';

  @override
  String get storagePermissionMessage =>
      'या अॅपला PDF डाउनलोड फोल्डरमध्ये जतन करण्यासाठी स्टोरेज परवानगी आवश्यक आहे. कृपया सेटिंग्जमध्ये ती सक्रिय करा.';

  @override
  String get openSettings => 'सेटिंग्ज उघडा';

  @override
  String cannotEditInvalidFormat(Object filename) {
    return '\"$filename\" संपादित करू शकत नाही: अवैध PDF फाइलनाव स्वरूप';
  }

  @override
  String loanNotFoundCannotEdit(Object loanId) {
    return 'कर्ज $loanId सापडले नाही. PDF संपादित करू शकत नाही.';
  }

  @override
  String navigationError(Object error) {
    return 'नेव्हिगेशन त्रुटी: $error';
  }

  @override
  String get pdfDeletedSuccessfully => 'PDF यशस्वीरित्या हटविले';

  @override
  String get fileRemovedFromStorage => 'फाइल स्टोरेजमधून काढून टाकली';

  @override
  String get dismiss => 'रद्द करा';

  @override
  String get deletePDF => 'PDF हटवायचे?';

  @override
  String sureDeleteFilename(Object filename) {
    return 'तुम्हाला खात्रीने \"$filename\" हटवायचे आहे का?';
  }

  @override
  String failedToDelete(Object error) {
    return 'हटविण्यात अयशस्वी: $error';
  }

  @override
  String get editCustomer => 'ग्राहक संपादित करा';

  @override
  String get personalInfo => 'वैयक्तिक माहिती';

  @override
  String get contactInfo => 'संपर्क माहिती';

  @override
  String get preferences => 'प्राधान्ये';

  @override
  String get fullName => 'पूर्ण नाव';

  @override
  String get nameRequired => 'नाव आवश्यक आहे';

  @override
  String get mobileNumberOptional => 'मोबाइल नंबर';

  @override
  String get mobileRequired => 'मोबाइल आवश्यक आहे';

  @override
  String get emailOptional => 'ईमेल (ऐच्छिक)';

  @override
  String get locationOptional => 'स्थान (ऐच्छिक)';

  @override
  String get receiveSMSNotifications => 'EMI पेमेंटसाठी SMS सूचना प्राप्त करा';

  @override
  String get stayUpdatedOnPayments =>
      'कर्ज पेमेंट आणि रिमाइंडरबद्दल अद्ययावत रहा';

  @override
  String get updateCustomer => 'ग्राहक अद्यतनित करा';

  @override
  String get updating => 'अद्यतनित करत आहे...';

  @override
  String get customerUpdatedSuccessfully =>
      'ग्राहक यशस्वीरित्या अद्यतनित झाला!';

  @override
  String get loanAmount => 'कर्ज रक्कम';

  @override
  String get interestRate => 'व्याज दर';

  @override
  String get interestType => 'व्याज प्रकार';

  @override
  String get createLoanTitle => 'कर्ज तयार करा';

  @override
  String get searchCustomerByNameOrMobile => 'नाव किंवा मोबाइल नंबरद्वारे शोधा';

  @override
  String get addFirstCustomer => 'पहिला ग्राहक जोडा';

  @override
  String get selectCustomer => 'ग्राहक निवडा';

  @override
  String get continueToOverview => 'विहंगावलोकनाकडे जा';

  @override
  String loanCreatedFor(Object name) {
    return '$name साठी कर्ज तयार केले';
  }

  @override
  String amountDate(Object amount, Object date) {
    return 'रक्कम: ₹$amount • $date';
  }

  @override
  String get perMonth => '/महिना';

  @override
  String get welcomeToFinTech => 'फिनटेकमध्ये स्वागत आहे';

  @override
  String get yourTrustedPartner => 'कर्ज व्यवस्थापनासाठी आपला विश्वासू भागीदार';

  @override
  String get trackLoansEMI => 'सहजपणे कर्जे आणि EMI ट्रॅक करा';

  @override
  String get monitorLoanProgress =>
      'आपल्या कर्जाची प्रगती आणि EMI वेळापत्रक रिअल-टाइममध्ये निरीक्षण करा';

  @override
  String get secureReliable => 'सुरक्षित आणि विश्वासू';

  @override
  String get dataProtected => 'आपला डेटा उद्योग-मानक सुरक्षेसह संरक्षित आहे';

  @override
  String get secureReliableEfficient => 'सुरक्षित • विश्वासू • कार्यक्षम';

  @override
  String get dashboard => 'डॅशबोर्ड';

  @override
  String get customers => 'ग्राहक';

  @override
  String get overview => 'विहंगावलोकन';

  @override
  String get darkMode => 'डार्क मोड';

  @override
  String get toggleBetweenThemes => 'लाइट आणि डार्क थीम दरम्यान टॉगल करा';

  @override
  String get enableSMSNotifications => 'SMS सूचना सक्रिय करा';

  @override
  String get sendSMSForEMI => 'EMI पेमेंट आणि रिमाइंडरसाठी SMS पाठवा';

  @override
  String get myProfile => 'माझे प्रोफाइल';

  @override
  String get permissionRequired => 'परवानगी आवश्यक';

  @override
  String get gallery => 'गॅलरी';

  @override
  String get camera => 'कॅमेरा';

  @override
  String get customerLedger => 'ग्राहक खातेवही';

  @override
  String get searchByCustomerNameOrMobile =>
      'ग्राहकाच्या नावाने किंवा मोबाइलद्वारे शोधा...';

  @override
  String get createYourFirstLoan => 'आपले पहिले कर्ज तयार करा';

  @override
  String get loanDataNotFound => 'कर्ज डेटा सापडला नाही';

  @override
  String get pdfUpdatedSuccessfully => 'PDF यशस्वीरित्या अद्यतनित झाले!';

  @override
  String errorUpdatingPDF(Object error) {
    return 'PDF अद्यतनित करताना त्रुटी: $error';
  }

  @override
  String get cannotSaveDataMissing =>
      'जतन करू शकत नाही: कर्ज किंवा ग्राहक डेटा गहाळ आहे.';

  @override
  String get unknown => 'अज्ञात';

  @override
  String get createLoanSubtitle => 'कर्ज तपशील सेट करा आणि EMI ची गणना करा';

  @override
  String get enterAmount => 'रक्कम प्रविष्ट करा';

  @override
  String get requiredField => 'आवश्यक';

  @override
  String get invalidAmount => 'अवैध रक्कम';

  @override
  String get monthlyInterestRate => 'मासिक व्याज दर (%)';

  @override
  String get exampleInterestRate => 'उदा., 1.0';

  @override
  String get invalidRate => 'अवैध दर';

  @override
  String get tenureMonths => 'मुदत (महिने)';

  @override
  String get exampleTenure => 'उदा., 12';

  @override
  String get invalidTenure => 'अवैध मुदत';

  @override
  String get calculatedEmi => 'गणना केलेली EMI';

  @override
  String emiPerMonth(Object amount) {
    return 'दरमहा ₹$amount';
  }

  @override
  String get noCustomersFound => 'कोणतेही ग्राहक सापडले नाहीत';

  @override
  String get pleaseSelectCustomer => 'कृपया एक ग्राहक निवडा';

  @override
  String get loanCreatedSuccessfullyTitle =>
      'कर्ज यशस्वीरित्या तयार झाले! आपल्या कर्जांचे विहंगावलोकन पहा.';

  @override
  String get loanCreatedSuccessfullyMessage =>
      'आपले कर्ज तयार झाले आहे. EMI ट्रॅक करण्यासाठी विहंगावलोकनाकडे जा.';

  @override
  String get simpleInterest => 'सरळ';

  @override
  String get compoundInterest => 'चक्रवाढ';

  @override
  String get loanCompletionCertificate => 'कर्ज पूर्णता प्रमाणपत्र';

  @override
  String get lenderDetails => 'कर्जदाराचे तपशील:';

  @override
  String get loanDetails => 'कर्जाचे तपशील:';

  @override
  String get emiPaymentSummary => 'EMI पेमेंट सारांश:';

  @override
  String get payAllPendingEMI => 'सर्व बाकी EMI भरा';

  @override
  String get allEmisPaid => 'अभिनंदन! सर्व EMI यशस्वीरित्या भरले गेले.';

  @override
  String get certificateConfirmsCompletion =>
      'हे प्रमाणपत्र आपल्या कर्जाची पूर्णता पुष्टी करते.';

  @override
  String generatedOn(Object date) {
    return '$date रोजी निर्माण केले';
  }

  @override
  String get dueDate => 'अंतिम तारीख';

  @override
  String get amount => 'रक्कम';

  @override
  String get status => 'स्थिती';

  @override
  String get simple => 'सरळ';

  @override
  String get compound => 'चक्रवाढ';

  @override
  String get refreshData => 'डेटा रीफ्रेश करा';

  @override
  String get loadingLoanData => 'कर्ज डेटा लोड करत आहे...';

  @override
  String get enterPrincipalAmount => 'मुद्दल रक्कम प्रविष्ट करा';

  @override
  String get annualInterestRate => 'वार्षिक व्याज दर';

  @override
  String get loanDurationMonths => 'महिन्यांमध्ये कर्जाची मुदत';

  @override
  String get selectInterestTypeHint => 'व्याज गणनेचा प्रकार निवडा';

  @override
  String get customerFullName => 'ग्राहकाचे पूर्ण नाव';

  @override
  String get tenDigitPhoneNumber => '10 अंकी फोन नंबर';

  @override
  String get forNotifications => 'सूचनांसाठी';

  @override
  String get cityOrAddress => 'शहर किंवा पत्ता';

  @override
  String get saveAndRegeneratePDF => 'जतन करा आणि PDF पुन्हा निर्माण करा';

  @override
  String get regeneratingPDF => 'PDF पुन्हा निर्माण करत आहे...';

  @override
  String get customerDataNotFound => 'ग्राहक डेटा सापडला नाही';

  @override
  String get editPDFDetails => 'PDF तपशील संपादित करा';

  @override
  String get ledgerOutstanding => 'बाकी';

  @override
  String get ledgerCollected => 'संकलित';

  @override
  String get ledgerStatusReceive => 'तुम्हाला मिळेल';

  @override
  String get ledgerStatusPay => 'तुम्ही द्याल';

  @override
  String get ledgerStatusSettled => 'सेटल झाले';

  @override
  String get recentTransactions => 'अलीकडील व्यवहार';

  @override
  String moreTransactions(Object count) {
    return '+$count अधिक व्यवहार';
  }

  @override
  String get givenAmount => 'दिले';

  @override
  String get receivedAmount => 'प्राप्त';

  @override
  String get today => 'आज';

  @override
  String get yesterday => 'काल';

  @override
  String get tomorrow => 'उद्या';

  @override
  String get noCustomersLedger => 'अद्याप कोणतेही ग्राहक नाहीत';

  @override
  String get ledgerEmptyMessage =>
      'आपली ग्राहक खातेवही पाहण्यासाठी कर्जे तयार करून प्रारंभ करा. व्यवहार ट्रॅक करा आणि आपला व्यवसाय कार्यक्षमतेने व्यवस्थापित करा.';

  @override
  String get createFirstLoanLedger => 'आपले पहिले कर्ज तयार करा';

  @override
  String get loanDisbursed => 'कर्ज वितरित केले';

  @override
  String get emiPayment => 'EMI पेमेंट';

  @override
  String get updateProfile => 'प्रोफाइल अद्यतनित करा';

  @override
  String get saving => 'जतन करत आहे...';

  @override
  String get logout => 'लॉग आउट';

  @override
  String get appearance => 'देखावा';

  @override
  String get smsNotifications => 'एसएमएस सूचना';

  @override
  String get enableSmsNotifications => 'एसएमएस सूचना सक्षम करा';

  @override
  String get darkModeToggleSubtitle => 'हलकी आणि गडद थीम दरम्यान टॉगल करा';

  @override
  String get smsToggleSubtitle => 'ईएमआय पेमेंट आणि रिमाइंडरसाठी एसएमएस पाठवा';

  @override
  String get loadingPDFs => 'PDF लोड होत आहेत...';

  @override
  String get completeLoansWillGeneratePDFsHere =>
      'पूर्ण झालेली कर्जे येथे PDF तयार करतील';

  @override
  String pdfCount(int count) {
    return '$count PDF';
  }

  @override
  String get tapPDFToShareViaWhatsApp =>
      'व्हॉट्सअऍपवर शेअर करण्यासाठी कोणत्याही PDF वर टॅप करा';

  @override
  String get saveToDownloads => 'डाउनलोडमध्ये जतन करा';

  @override
  String get shareViaWhatsApp => 'व्हॉट्सअऍपद्वारे शेअर करा';

  @override
  String get gotIt => 'समजले';

  @override
  String get permanentlyDeleteWarning => 'हे कायमचे हटवेल:';

  @override
  String get actionCannotBeUndone => 'ही क्रिया पूर्ववत करता येणार नाही.';

  @override
  String get retry => 'पुन्हा प्रयत्न करा';

  @override
  String get noLanguageMatch => 'तुमच्या शोधाशी जुळणारी कोणतीही भाषा नाही';

  @override
  String get selected => 'निवडलेले';

  @override
  String get allow => 'परवानगी द्या';

  @override
  String get logoutConfirmation => 'तुम्हाला खात्रीने लॉगआउट करायचे आहे का?';

  @override
  String get loanManagementProfessional => 'कर्ज व्यवस्थापन व्यावसायिक';

  @override
  String get accountDetails => 'खाते तपशील';
}
