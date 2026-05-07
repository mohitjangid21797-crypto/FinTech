// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Nepali (`ne`).
class AppLocalizationsNe extends AppLocalizations {
  AppLocalizationsNe([String locale = 'ne']) : super(locale);

  @override
  String get appTitle => 'ऋण प्रबन्धक';

  @override
  String get dashboardTitle => 'ड्यासबोर्ड';

  @override
  String get keyMetrics => 'मुख्य मेट्रिक्स';

  @override
  String get totalLoans => 'कुल ऋण';

  @override
  String get activeLoans => 'सक्रिय ऋण';

  @override
  String get totalCustomers => 'कुल ग्राहक';

  @override
  String get pendingEMIs => 'बाँकी EMI';

  @override
  String get totalLoanAmount => 'कुल ऋण रकम';

  @override
  String get totalProfit => 'कुल नाफा';

  @override
  String get quickActions => 'द्रुत कार्यहरू';

  @override
  String get addCustomer => 'ग्राहक थप्नुहोस्';

  @override
  String get createLoan => 'ऋण सिर्जना गर्नुहोस्';

  @override
  String get emiLedger => 'EMI खाता';

  @override
  String get pdfDocuments => 'PDF कागजातहरू';

  @override
  String get recentActivity => 'हालको गतिविधि';

  @override
  String get noRecentActivity => 'कुनै हालको गतिविधि छैन';

  @override
  String get selectLanguage => 'भाषा चयन गर्नुहोस्';

  @override
  String get userProfile => 'प्रयोगकर्ता प्रोफाइल';

  @override
  String get settings => 'सेटिङ्गहरू';

  @override
  String get languages => 'भाषाहरू';

  @override
  String helloUser(Object user) {
    return 'नमस्ते, $user!';
  }

  @override
  String get welcomeBack => 'तपाईंको ड्यासबोर्डमा पुन: स्वागत छ 👋';

  @override
  String get exitAppTitle => 'एप बन्द गर्नुहोस्';

  @override
  String get exitAppMessage =>
      'के तपाईं निश्चित रूपमा एप बन्द गर्न चाहनुहुन्छ?';

  @override
  String get cancel => 'रद्द गर्नुहोस्';

  @override
  String get exit => 'बाहिर निस्कनुहोस्';

  @override
  String languageSelected(Object language) {
    return '$language भाषा चयन गरियो';
  }

  @override
  String get finTech => 'फिनटेक';

  @override
  String get secureLogin => 'सुरक्षित लगइन';

  @override
  String get mobileNumber => 'मोबाइल नम्बर';

  @override
  String get enterMobileNumber => 'आफ्नो मोबाइल नम्बर प्रविष्ट गर्नुहोस्';

  @override
  String get pleaseEnterMobileNumber =>
      'कृपया आफ्नो मोबाइल नम्बर प्रविष्ट गर्नुहोस्';

  @override
  String get enterValidMobileNumber =>
      'मान्य १०-अङ्कको मोबाइल नम्बर प्रविष्ट गर्नुहोस्';

  @override
  String get name => 'नाम';

  @override
  String get enterName => 'आफ्नो नाम प्रविष्ट गर्नुहोस्';

  @override
  String get pleaseEnterName => 'कृपया आफ्नो नाम प्रविष्ट गर्नुहोस्';

  @override
  String get email => 'इमेल';

  @override
  String get enterEmail => 'आफ्नो इमेल प्रविष्ट गर्नुहोस्';

  @override
  String get pleaseEnterEmail => 'कृपया आफ्नो इमेल प्रविष्ट गर्नुहोस्';

  @override
  String get enterValidEmail => 'मान्य इमेल ठेगाना प्रविष्ट गर्नुहोस्';

  @override
  String get location => 'स्थान';

  @override
  String get enterLocation => 'आफ्नो स्थान प्रविष्ट गर्नुहोस्';

  @override
  String get pleaseEnterLocation => 'कृपया आफ्नो स्थान प्रविष्ट गर्नुहोस्';

  @override
  String get mPin => 'एम-पिन';

  @override
  String get enterMPin => 'आफ्नो एम-पिन प्रविष्ट गर्नुहोस्';

  @override
  String get pleaseEnterMPin => 'कृपया आफ्नो एम-पिन प्रविष्ट गर्नुहोस्';

  @override
  String get mPinMustBe4To6Digits => 'एम-पिन ४-६ अङ्कको हुनुपर्छ';

  @override
  String get login => 'लगइन';

  @override
  String get congratulations => 'बधाई छ!';

  @override
  String get loggedInSuccessfully => 'तपाईं सफलतापूर्वक लगइन हुनुभयो';

  @override
  String get allCustomers => 'सबै ग्राहकहरू';

  @override
  String get searchCustomers => 'ग्राहक खोज्नुहोस्...';

  @override
  String get noCustomersYet => 'अहिलेसम्म कुनै ग्राहक छैन';

  @override
  String get startBuildingCustomerDatabase =>
      'आफ्नो पहिलो ग्राहक थपेर ग्राहक डाटाबेस निर्माण सुरु गर्नुहोस्।';

  @override
  String get addYourFirstCustomer => 'आफ्नो पहिलो ग्राहक थप्नुहोस्';

  @override
  String get noResultsFound => 'कुनै परिणाम फेला परेन';

  @override
  String get tryAdjustingSearchTerms =>
      'आफ्नो खोज शब्दहरू समायोजन गर्नुहोस् वा हिज्जे जाँच गर्नुहोस्।';

  @override
  String get deleteCustomer => 'ग्राहक मेटाउनुहोस्';

  @override
  String areYouSureDeleteCustomer(Object name) {
    return 'के तपाईं निश्चित रूपमा $name मेटाउन चाहनुहुन्छ? यो कार्य पूर्ववत गर्न सकिँदैन।';
  }

  @override
  String customerDeletedSuccessfully(Object name) {
    return '$name सफलतापूर्वक मेटियो';
  }

  @override
  String get delete => 'मेटाउनुहोस्';

  @override
  String get addCustomerTitle => 'ग्राहक थप्नुहोस्';

  @override
  String get customerDetails => 'ग्राहक विवरण';

  @override
  String get mobile => 'मोबाइल';

  @override
  String get pleaseEnterMobile => 'कृपया मोबाइल नम्बर प्रविष्ट गर्नुहोस्';

  @override
  String get pleaseEnterEmailAddress => 'कृपया इमेल प्रविष्ट गर्नुहोस्';

  @override
  String get smsConsent =>
      'म EMI भुक्तानीको लागि SMS सूचनाहरू प्राप्त गर्न सहमत छु';

  @override
  String get customerAdded => 'ग्राहक थपियो!';

  @override
  String get customerAddedSuccessfully =>
      'ग्राहक सफलतापूर्वक थपियो\nऋण सिर्जना गर्न तयार!';

  @override
  String get continueText => 'जारी राख्नुहोस्';

  @override
  String get pleaseFillAllRequiredFields =>
      'कृपया सबै आवश्यक फिल्डहरू भर्नुहोस्';

  @override
  String get overviewLoans => 'ऋणको अवलोकन';

  @override
  String get active => 'सक्रिय';

  @override
  String get completed => 'पूरा भयो';

  @override
  String get pending => 'बाँकी';

  @override
  String get searchByCustomerMobile => 'ग्राहकको मोबाइल नम्बरद्वारा खोज्नुहोस्';

  @override
  String get noActiveLoans => 'कुनै सक्रिय ऋण छैन';

  @override
  String get noCompletedLoans => 'कुनै पूरा भएको ऋण छैन';

  @override
  String get noPendingLoans => 'कुनै बाँकी ऋण छैन';

  @override
  String get allEMIsPaidSuccessfully => 'सबै EMI सफलतापूर्वक भुक्तान भयो';

  @override
  String get moveToPDFDocuments =>
      'के तपाईं यसको PDF हेर्न PDF कागजातहरूमा जान चाहनुहुन्छ?';

  @override
  String get later => 'पछि';

  @override
  String get viewPDF => 'PDF हेर्नुहोस्';

  @override
  String get loanEMIDetails => 'ऋण EMI विवरण';

  @override
  String loanID(Object id) {
    return 'ऋण ID: $id...';
  }

  @override
  String get principal => 'मूलधन';

  @override
  String get emiLabel => 'EMI';

  @override
  String get rate => 'दर';

  @override
  String get tenure => 'अवधि';

  @override
  String get months => 'महिना';

  @override
  String get markAsPaid => 'भुक्तान भयो भनी चिन्ह लगाउनुहोस्';

  @override
  String get paid => 'भुक्तान भयो';

  @override
  String get markAllEMIsPaid => 'सबै EMI भुक्तान भयो भनी चिन्ह लगाउनुहोस्';

  @override
  String markAllPendingEMIsAsPaid(Object count) {
    return 'सबै $count बाँकी EMI भुक्तान भयो भनी चिन्ह लगाउनुहोस्';
  }

  @override
  String markAllEMIsPaidConfirm(Object count) {
    return 'के तपाईं निश्चित हुनुहुन्छ? यसले सबै $count बाँकी EMI भुक्तान भयो भनी चिन्ह लगाउनेछ र पूर्णता PDF पुन: उत्पन्न गर्नेछ।';
  }

  @override
  String get confirm => 'पुष्टि गर्नुहोस्';

  @override
  String allEMIsMarkedAsPaid(Object count) {
    return 'सबै $count EMI भुक्तान भयो भनी चिन्ह लगाइयो! PDF पुन: उत्पन्न गरियो।';
  }

  @override
  String get loanCompletedSuccessfully =>
      'ऋण सफलतापूर्वक पूरा भयो! PDF स्वतः उत्पन्न गरियो र PDF कागजातहरूमा उपलब्ध छ।';

  @override
  String get emiMarkedAsPaid => 'EMI सफलतापूर्वक भुक्तान भयो भनी चिन्ह लगाइयो!';

  @override
  String get unknownCustomer => 'अज्ञात ग्राहक';

  @override
  String due(Object date) {
    return 'बाँकी: $date';
  }

  @override
  String get emiSchedule => 'EMI तालिका';

  @override
  String get searchCustomer => 'ग्राहक खोज्नुहोस्';

  @override
  String get searchByNameOrMobile => 'नाम वा मोबाइल नम्बरद्वारा खोज्नुहोस्';

  @override
  String get filterByCustomer => 'ग्राहकद्वारा फिल्टर गर्नुहोस् (वैकल्पिक)';

  @override
  String get allCustomersLabel => 'सबै ग्राहकहरू';

  @override
  String get noEMISchedulesFound => 'कुनै EMI तालिका फेला परेन';

  @override
  String get tryAdjustingSearchFilter =>
      'आफ्नो खोज वा फिल्टर मापदण्ड समायोजन गर्नुहोस्';

  @override
  String get allLoanPDFs => 'सबै ऋणका PDFहरू';

  @override
  String get noLoanCompletionPDFs =>
      'कुनै ऋण पूर्णता PDF फेला परेन\nऋण सारांशबाट PDF उत्पन्न गर्नुहोस्';

  @override
  String customer(Object name) {
    return 'ग्राहक: $name';
  }

  @override
  String idLabel(Object value) {
    return 'ID: $value';
  }

  @override
  String get save => 'सुरक्षित गर्नुहोस्';

  @override
  String get share => 'सेयर गर्नुहोस्';

  @override
  String get editPDF => 'PDF सम्पादन गर्नुहोस्';

  @override
  String get failedToSavePDF =>
      'PDF सुरक्षित गर्न असफल। कृपया पुन: प्रयास गर्नुहोस्।';

  @override
  String shareFailed(Object error) {
    return 'सेयर गर्न असफल: $error';
  }

  @override
  String get storagePermissionRequired => 'भण्डारण अनुमति आवश्यक';

  @override
  String get storagePermissionMessage =>
      'यस एपलाई PDF डाउनलोड फोल्डरमा सुरक्षित गर्न भण्डारण अनुमति चाहिन्छ। कृपया सेटिङ्गहरूमा यसलाई सक्रिय गर्नुहोस्।';

  @override
  String get openSettings => 'सेटिङ्गहरू खोल्नुहोस्';

  @override
  String cannotEditInvalidFormat(Object filename) {
    return '\"$filename\" सम्पादन गर्न सकिँदैन: अमान्य PDF फाइलनाम ढाँचा';
  }

  @override
  String loanNotFoundCannotEdit(Object loanId) {
    return 'ऋण $loanId फेला परेन। PDF सम्पादन गर्न सकिँदैन।';
  }

  @override
  String navigationError(Object error) {
    return 'नेभिगेसन त्रुटि: $error';
  }

  @override
  String get pdfDeletedSuccessfully => 'PDF सफलतापूर्वक मेटियो';

  @override
  String get fileRemovedFromStorage => 'फाइल भण्डारणबाट हटाइयो';

  @override
  String get dismiss => 'रद्द गर्नुहोस्';

  @override
  String get deletePDF => 'PDF मेटाउने?';

  @override
  String sureDeleteFilename(Object filename) {
    return 'के तपाईं निश्चित रूपमा \"$filename\" मेटाउन चाहनुहुन्छ?';
  }

  @override
  String failedToDelete(Object error) {
    return 'मेटाउन असफल: $error';
  }

  @override
  String get editCustomer => 'ग्राहक सम्पादन गर्नुहोस्';

  @override
  String get personalInfo => 'व्यक्तिगत जानकारी';

  @override
  String get contactInfo => 'सम्पर्क जानकारी';

  @override
  String get preferences => 'प्राथमिकताहरू';

  @override
  String get fullName => 'पूरा नाम';

  @override
  String get nameRequired => 'नाम आवश्यक छ';

  @override
  String get mobileNumberOptional => 'मोबाइल नम्बर';

  @override
  String get mobileRequired => 'मोबाइल आवश्यक छ';

  @override
  String get emailOptional => 'इमेल (वैकल्पिक)';

  @override
  String get locationOptional => 'स्थान (वैकल्पिक)';

  @override
  String get receiveSMSNotifications =>
      'EMI भुक्तानीको लागि SMS सूचनाहरू प्राप्त गर्नुहोस्';

  @override
  String get stayUpdatedOnPayments =>
      'ऋण भुक्तानी र रिमाइन्डरहरूको बारेमा अद्यावधिक रहनुहोस्';

  @override
  String get updateCustomer => 'ग्राहक अद्यावधिक गर्नुहोस्';

  @override
  String get updating => 'अद्यावधिक गर्दै...';

  @override
  String get customerUpdatedSuccessfully => 'ग्राहक सफलतापूर्वक अद्यावधिक भयो!';

  @override
  String get loanAmount => 'ऋण रकम';

  @override
  String get interestRate => 'ब्याजदर';

  @override
  String get interestType => 'ब्याज प्रकार';

  @override
  String get createLoanTitle => 'ऋण सिर्जना गर्नुहोस्';

  @override
  String get searchCustomerByNameOrMobile =>
      'नाम वा मोबाइल नम्बरद्वारा खोज्नुहोस्';

  @override
  String get addFirstCustomer => 'पहिलो ग्राहक थप्नुहोस्';

  @override
  String get selectCustomer => 'ग्राहक चयन गर्नुहोस्';

  @override
  String get continueToOverview => 'अवलोकनमा जारी राख्नुहोस्';

  @override
  String loanCreatedFor(Object name) {
    return '$name को लागि ऋण सिर्जना गरियो';
  }

  @override
  String amountDate(Object amount, Object date) {
    return 'रकम: ₹$amount • $date';
  }

  @override
  String get perMonth => '/महिना';

  @override
  String get welcomeToFinTech => 'फिनटेकमा स्वागत छ';

  @override
  String get yourTrustedPartner =>
      'ऋण व्यवस्थापनको लागि तपाईंको भरपर्दो साझेदार';

  @override
  String get trackLoansEMI => 'सजिलैसँग ऋण र EMI ट्र्याक गर्नुहोस्';

  @override
  String get monitorLoanProgress =>
      'तपाईंको ऋणको प्रगति र EMI तालिका वास्तविक समयमा अनुगमन गर्नुहोस्';

  @override
  String get secureReliable => 'सुरक्षित र भरपर्दो';

  @override
  String get dataProtected => 'तपाईंको डाटा उद्योग-स्तरीय सुरक्षाले सुरक्षित छ';

  @override
  String get secureReliableEfficient => 'सुरक्षित • भरपर्दो • प्रभावकारी';

  @override
  String get dashboard => 'ड्यासबोर्ड';

  @override
  String get customers => 'ग्राहकहरू';

  @override
  String get overview => 'अवलोकन';

  @override
  String get darkMode => 'डार्क मोड';

  @override
  String get toggleBetweenThemes => 'लाइट र डार्क थीम बीच टॉगल गर्नुहोस्';

  @override
  String get enableSMSNotifications => 'SMS सूचनाहरू सक्रिय गर्नुहोस्';

  @override
  String get sendSMSForEMI => 'EMI भुक्तानी र रिमाइन्डरको लागि SMS पठाउनुहोस्';

  @override
  String get myProfile => 'मेरो प्रोफाइल';

  @override
  String get permissionRequired => 'अनुमति आवश्यक';

  @override
  String get gallery => 'ग्यालरी';

  @override
  String get camera => 'क्यामेरा';

  @override
  String get customerLedger => 'ग्राहक खाता';

  @override
  String get searchByCustomerNameOrMobile =>
      'ग्राहकको नाम वा मोबाइलद्वारा खोज्नुहोस्...';

  @override
  String get createYourFirstLoan => 'आफ्नो पहिलो ऋण सिर्जना गर्नुहोस्';

  @override
  String get loanDataNotFound => 'ऋण डाटा फेला परेन';

  @override
  String get pdfUpdatedSuccessfully => 'PDF सफलतापूर्वक अद्यावधिक भयो!';

  @override
  String errorUpdatingPDF(Object error) {
    return 'PDF अद्यावधिक गर्दा त्रुटि: $error';
  }

  @override
  String get cannotSaveDataMissing =>
      'सुरक्षित गर्न सकिँदैन: ऋण वा ग्राहक डाटा हराइरहेको छ।';

  @override
  String get unknown => 'अज्ञात';

  @override
  String get createLoanSubtitle =>
      'ऋण विवरण सेट गर्नुहोस् र EMI गणना गर्नुहोस्';

  @override
  String get enterAmount => 'रकम प्रविष्ट गर्नुहोस्';

  @override
  String get requiredField => 'आवश्यक';

  @override
  String get invalidAmount => 'अमान्य रकम';

  @override
  String get monthlyInterestRate => 'मासिक ब्याजदर (%)';

  @override
  String get exampleInterestRate => 'जस्तै, 1.0';

  @override
  String get invalidRate => 'अमान्य दर';

  @override
  String get tenureMonths => 'अवधि (महिना)';

  @override
  String get exampleTenure => 'जस्तै, 12';

  @override
  String get invalidTenure => 'अमान्य अवधि';

  @override
  String get calculatedEmi => 'गणना गरिएको EMI';

  @override
  String emiPerMonth(Object amount) {
    return 'प्रति महिना ₹$amount';
  }

  @override
  String get noCustomersFound => 'कुनै ग्राहक फेला परेन';

  @override
  String get pleaseSelectCustomer => 'कृपया एक ग्राहक चयन गर्नुहोस्';

  @override
  String get loanCreatedSuccessfullyTitle =>
      'ऋण सफलतापूर्वक सिर्जना गरियो! तपाईंको ऋणको अवलोकन हेर्नुहोस्।';

  @override
  String get loanCreatedSuccessfullyMessage =>
      'तपाईंको ऋण सिर्जना गरियो। EMI ट्र्याक गर्न अवलोकनमा जारी राख्नुहोस्।';

  @override
  String get simpleInterest => 'साधारण';

  @override
  String get compoundInterest => 'चक्रवृद्धि';

  @override
  String get loanCompletionCertificate => 'ऋण पूर्णता प्रमाणपत्र';

  @override
  String get lenderDetails => 'ऋणदाताको विवरण:';

  @override
  String get loanDetails => 'ऋणको विवरण:';

  @override
  String get emiPaymentSummary => 'EMI भुक्तानी सारांश:';

  @override
  String get payAllPendingEMI => 'सबै बाँकी EMI भुक्तान गर्नुहोस्';

  @override
  String get allEmisPaid => 'बधाई छ! सबै EMI सफलतापूर्वक भुक्तान भयो।';

  @override
  String get certificateConfirmsCompletion =>
      'यो प्रमाणपत्रले तपाईंको ऋणको पूर्णता पुष्टि गर्दछ।';

  @override
  String generatedOn(Object date) {
    return '$date मा उत्पन्न गरियो';
  }

  @override
  String get dueDate => 'अन्तिम मिति';

  @override
  String get amount => 'रकम';

  @override
  String get status => 'स्थिति';

  @override
  String get simple => 'साधारण';

  @override
  String get compound => 'चक्रवृद्धि';

  @override
  String get refreshData => 'डाटा रिफ्रेस गर्नुहोस्';

  @override
  String get loadingLoanData => 'ऋण डाटा लोड गर्दै...';

  @override
  String get enterPrincipalAmount => 'मूलधन रकम प्रविष्ट गर्नुहोस्';

  @override
  String get annualInterestRate => 'वार्षिक ब्याजदर';

  @override
  String get loanDurationMonths => 'महिनामा ऋण अवधि';

  @override
  String get selectInterestTypeHint => 'ब्याज गणना प्रकार चयन गर्नुहोस्';

  @override
  String get customerFullName => 'ग्राहकको पूरा नाम';

  @override
  String get tenDigitPhoneNumber => '१० अङ्कको फोन नम्बर';

  @override
  String get forNotifications => 'सूचनाहरूको लागि';

  @override
  String get cityOrAddress => 'सहर वा ठेगाना';

  @override
  String get saveAndRegeneratePDF =>
      'सुरक्षित गर्नुहोस् र PDF पुन: उत्पन्न गर्नुहोस्';

  @override
  String get regeneratingPDF => 'PDF पुन: उत्पन्न गर्दै...';

  @override
  String get customerDataNotFound => 'ग्राहक डाटा फेला परेन';

  @override
  String get editPDFDetails => 'PDF विवरण सम्पादन गर्नुहोस्';

  @override
  String get ledgerOutstanding => 'बाँकी';

  @override
  String get ledgerCollected => 'सङ्कलन गरियो';

  @override
  String get ledgerStatusReceive => 'तपाईंले पाउनुहुनेछ';

  @override
  String get ledgerStatusPay => 'तपाईंले दिनुहुनेछ';

  @override
  String get ledgerStatusSettled => 'मिलान भयो';

  @override
  String get recentTransactions => 'हालको लेनदेनहरू';

  @override
  String moreTransactions(Object count) {
    return '+$count थप लेनदेनहरू';
  }

  @override
  String get givenAmount => 'दिइयो';

  @override
  String get receivedAmount => 'प्राप्त भयो';

  @override
  String get today => 'आज';

  @override
  String get yesterday => 'हिजो';

  @override
  String get tomorrow => 'भोलि';

  @override
  String get noCustomersLedger => 'अहिलेसम्म कुनै ग्राहक छैन';

  @override
  String get ledgerEmptyMessage =>
      'तपाईंको ग्राहक खाता हेर्न ऋण सिर्जना गरेर सुरु गर्नुहोस्। लेनदेनहरू ट्र्याक गर्नुहोस् र आफ्नो व्यवसाय प्रभावकारी रूपमा व्यवस्थापन गर्नुहोस्।';

  @override
  String get createFirstLoanLedger => 'आफ्नो पहिलो ऋण सिर्जना गर्नुहोस्';

  @override
  String get loanDisbursed => 'ऋण वितरण गरियो';

  @override
  String get emiPayment => 'EMI भुक्तानी';

  @override
  String get updateProfile => 'प्रोफाइल अपडेट गर्नुहोस्';

  @override
  String get saving => 'सुरक्षित गर्दै...';

  @override
  String get logout => 'लग आउट';

  @override
  String get appearance => 'रूप';

  @override
  String get smsNotifications => 'एसएमएस सूचनाहरू';

  @override
  String get enableSmsNotifications => 'एसएमएस सूचनाहरू सक्षम गर्नुहोस्';

  @override
  String get darkModeToggleSubtitle => 'हल्का र गाढा थिम बीच टगल गर्नुहोस्';

  @override
  String get smsToggleSubtitle =>
      'ईएमआई भुक्तानी र सम्झनाका लागि एसएमएस पठाउनुहोस्';

  @override
  String get loadingPDFs => 'PDF लोड हुँदैछ...';

  @override
  String get completeLoansWillGeneratePDFsHere =>
      'पूरा भएका ऋणहरूले यहाँ PDF उत्पन्न गर्नेछन्';

  @override
  String pdfCount(int count) {
    return '$count वटा PDF';
  }

  @override
  String get tapPDFToShareViaWhatsApp =>
      'व्हाट्सएपमा साझा गर्न कुनै पनि PDF मा ट्याप गर्नुहोस्';

  @override
  String get saveToDownloads => 'डाउनलोडमा सुरक्षित गर्नुहोस्';

  @override
  String get shareViaWhatsApp => 'व्हाट्सएप मार्फत साझा गर्नुहोस्';

  @override
  String get gotIt => 'बुझें';

  @override
  String get permanentlyDeleteWarning => 'यसले स्थायी रूपमा मेटाउनेछ:';

  @override
  String get actionCannotBeUndone => 'यो कार्य पूर्ववत गर्न सकिँदैन।';

  @override
  String get retry => 'पुनः प्रयास गर्नुहोस्';

  @override
  String get noLanguageMatch => 'तपाईंको खोजसँग मिल्ने कुनै भाषा छैन';

  @override
  String get selected => 'चयन गरिएको';

  @override
  String get allow => 'अनुमति दिनुहोस्';

  @override
  String get logoutConfirmation => 'के तपाईं पक्का लगआउट गर्न चाहनुहुन्छ?';

  @override
  String get loanManagementProfessional => 'ऋण व्यवस्थापन पेशेवर';

  @override
  String get accountDetails => 'खाता विवरण';
}
