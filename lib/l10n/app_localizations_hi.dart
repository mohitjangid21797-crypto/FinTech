// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'लोन मैनेजर';

  @override
  String get dashboardTitle => 'डैशबोर्ड';

  @override
  String get keyMetrics => 'मुख्य मेट्रिक्स';

  @override
  String get totalLoans => 'कुल लोन';

  @override
  String get activeLoans => 'सक्रिय लोन';

  @override
  String get totalCustomers => 'कुल ग्राहक';

  @override
  String get pendingEMIs => 'बकाया ईएमआई';

  @override
  String get totalLoanAmount => 'कुल लोन राशि';

  @override
  String get totalProfit => 'कुल लाभ';

  @override
  String get quickActions => 'त्वरित कार्य';

  @override
  String get addCustomer => 'ग्राहक जोड़ें';

  @override
  String get createLoan => 'लोन बनाएं';

  @override
  String get emiLedger => 'ईएमआई लेजर';

  @override
  String get pdfDocuments => 'पीडीएफ दस्तावेज़';

  @override
  String get recentActivity => 'हाल की गतिविधि';

  @override
  String get noRecentActivity => 'कोई हाल की गतिविधि नहीं';

  @override
  String get selectLanguage => 'भाषा चुनें';

  @override
  String get userProfile => 'उपयोगकर्ता प्रोफ़ाइल';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get languages => 'भाषाएँ';

  @override
  String helloUser(Object user) {
    return 'नमस्ते, $user!';
  }

  @override
  String get welcomeBack => 'आपके डैशबोर्ड में वापस स्वागत है 👋';

  @override
  String get exitAppTitle => 'ऐप से बाहर निकलें';

  @override
  String get exitAppMessage => 'क्या आप वाकई ऐप से बाहर निकलना चाहते हैं?';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get exit => 'निकास';

  @override
  String languageSelected(Object language) {
    return '$language भाषा चयनित';
  }

  @override
  String get finTech => 'फिनटेक';

  @override
  String get secureLogin => 'सुरक्षित लॉगिन';

  @override
  String get mobileNumber => 'मोबाइल नंबर';

  @override
  String get enterMobileNumber => 'अपना मोबाइल नंबर दर्ज करें';

  @override
  String get pleaseEnterMobileNumber => 'कृपया अपना मोबाइल नंबर दर्ज करें';

  @override
  String get enterValidMobileNumber => 'वैध 10 अंकों का मोबाइल नंबर दर्ज करें';

  @override
  String get name => 'नाम';

  @override
  String get enterName => 'अपना नाम दर्ज करें';

  @override
  String get pleaseEnterName => 'कृपया अपना नाम दर्ज करें';

  @override
  String get email => 'ईमेल';

  @override
  String get enterEmail => 'अपना ईमेल दर्ज करें';

  @override
  String get pleaseEnterEmail => 'कृपया अपना ईमेल दर्ज करें';

  @override
  String get enterValidEmail => 'वैध ईमेल पता दर्ज करें';

  @override
  String get location => 'स्थान';

  @override
  String get enterLocation => 'अपना स्थान दर्ज करें';

  @override
  String get pleaseEnterLocation => 'कृपया स्थान दर्ज करें';

  @override
  String get mPin => 'एम-पिन';

  @override
  String get enterMPin => 'अपना एम-पिन दर्ज करें';

  @override
  String get pleaseEnterMPin => 'कृपया अपना एम-पिन दर्ज करें';

  @override
  String get mPinMustBe4To6Digits => 'एम-पिन 4-6 अंकों का होना चाहिए';

  @override
  String get login => 'लॉगिन';

  @override
  String get congratulations => 'बधाई हो!';

  @override
  String get loggedInSuccessfully => 'आपने सफलतापूर्वक लॉगिन किया';

  @override
  String get allCustomers => 'सभी ग्राहक';

  @override
  String get searchCustomers => 'ग्राहक खोजें...';

  @override
  String get noCustomersYet => 'अभी तक कोई ग्राहक नहीं';

  @override
  String get startBuildingCustomerDatabase =>
      'अपना पहला ग्राहक जोड़कर अपना ग्राहक डेटाबेस बनाना शुरू करें।';

  @override
  String get addYourFirstCustomer => 'अपना पहला ग्राहक जोड़ें';

  @override
  String get noResultsFound => 'कोई परिणाम नहीं मिला';

  @override
  String get tryAdjustingSearchTerms =>
      'अपनी खोज शब्दों को समायोजित करने या वर्तनी जांचने का प्रयास करें।';

  @override
  String get deleteCustomer => 'ग्राहक हटाएं';

  @override
  String areYouSureDeleteCustomer(Object name) {
    return 'क्या आप वाकई $name को हटाना चाहते हैं? यह क्रिया पूर्ववत नहीं की जा सकती।';
  }

  @override
  String customerDeletedSuccessfully(Object name) {
    return '$name सफलतापूर्वक हटा दिया गया';
  }

  @override
  String get delete => 'हटाएं';

  @override
  String get addCustomerTitle => 'ग्राहक जोड़ें';

  @override
  String get customerDetails => 'ग्राहक विवरण';

  @override
  String get mobile => 'मोबाइल';

  @override
  String get pleaseEnterMobile => 'कृपया मोबाइल नंबर दर्ज करें';

  @override
  String get pleaseEnterEmailAddress => 'कृपया ईमेल दर्ज करें';

  @override
  String get smsConsent =>
      'मैं ईएमआई भुगतान के लिए एसएमएस सूचनाएं प्राप्त करने के लिए सहमत हूं';

  @override
  String get customerAdded => 'ग्राहक जोड़ा गया!';

  @override
  String get customerAddedSuccessfully =>
      'ग्राहक सफलतापूर्वक जोड़ा गया\nलोन बनाने के लिए तैयार!';

  @override
  String get continueText => 'जारी रखें';

  @override
  String get pleaseFillAllRequiredFields => 'कृपया सभी आवश्यक फ़ील्ड भरें';

  @override
  String get overviewLoans => 'लोन अवलोकन';

  @override
  String get active => 'सक्रिय';

  @override
  String get completed => 'पूर्ण';

  @override
  String get pending => 'लंबित';

  @override
  String get searchByCustomerMobile => 'ग्राहक मोबाइल नंबर से खोजें';

  @override
  String get noActiveLoans => 'कोई सक्रिय लोन नहीं';

  @override
  String get noCompletedLoans => 'कोई पूर्ण लोन नहीं';

  @override
  String get noPendingLoans => 'कोई लंबित लोन नहीं';

  @override
  String get allEMIsPaidSuccessfully => 'सभी ईएमआई सफलतापूर्वक भुगतान किए गए';

  @override
  String get moveToPDFDocuments =>
      'क्या आप इसका पीडीएफ देखने के लिए पीडीएफ दस्तावेज़ों पर जाना चाहते हैं?';

  @override
  String get later => 'बाद में';

  @override
  String get viewPDF => 'पीडीएफ देखें';

  @override
  String get loanEMIDetails => 'लोन ईएमआई विवरण';

  @override
  String loanID(Object id) {
    return 'लोन आईडी: $id...';
  }

  @override
  String get principal => 'मूलधन';

  @override
  String get emiLabel => 'ईएमआई';

  @override
  String get rate => 'दर';

  @override
  String get tenure => 'अवधि';

  @override
  String get months => 'महीने';

  @override
  String get markAsPaid => 'भुगतान के रूप में चिह्नित करें';

  @override
  String get paid => 'भुगतान किया';

  @override
  String get markAllEMIsPaid => 'सभी ईएमआई भुगतान करें';

  @override
  String markAllPendingEMIsAsPaid(Object count) {
    return 'सभी $count लंबित ईएमआई भुगतान के रूप में चिह्नित करें';
  }

  @override
  String markAllEMIsPaidConfirm(Object count) {
    return 'क्या आप निश्चित हैं? यह सभी $count लंबित ईएमआई को भुगतान के रूप में चिह्नित करेगा और पूर्णता पीडीएफ पुनर्जन्मित करेगा।';
  }

  @override
  String get confirm => 'पुष्टि करें';

  @override
  String allEMIsMarkedAsPaid(Object count) {
    return 'सभी $count ईएमआई भुगतान के रूप में चिह्नित! पीडीएफ पुनर्जन्मित।';
  }

  @override
  String get loanCompletedSuccessfully =>
      'लोन सफलतापूर्वक पूर्ण! पीडीएफ स्वचालित रूप से जेनरेट किया गया है और पीडीएफ दस्तावेज़ों में उपलब्ध है।';

  @override
  String get emiMarkedAsPaid => 'ईएमआई सफलतापूर्वक भुगतान के रूप में चिह्नित!';

  @override
  String get unknownCustomer => 'अज्ञात ग्राहक';

  @override
  String due(Object date) {
    return 'देय: $date';
  }

  @override
  String get emiSchedule => 'ईएमआई अनुसूची';

  @override
  String get searchCustomer => 'ग्राहक खोजें';

  @override
  String get searchByNameOrMobile => 'नाम या मोबाइल नंबर से खोजें';

  @override
  String get filterByCustomer => 'ग्राहक द्वारा फ़िल्टर करें (वैकल्पिक)';

  @override
  String get allCustomersLabel => 'सभी ग्राहक';

  @override
  String get noEMISchedulesFound => 'कोई ईएमआई अनुसूची नहीं मिली';

  @override
  String get tryAdjustingSearchFilter =>
      'अपनी खोज या फ़िल्टर मानदंड समायोजित करने का प्रयास करें';

  @override
  String get allLoanPDFs => 'सभी लोन पीडीएफ';

  @override
  String get noLoanCompletionPDFs =>
      'कोई लोन पूर्णता पीडीएफ नहीं मिला\nलोन सारांश से पीडीएफ जेनरेट करें';

  @override
  String customer(Object name) {
    return 'ग्राहक: $name';
  }

  @override
  String idLabel(Object value) {
    return 'आईडी: $value';
  }

  @override
  String get save => 'सहेजें';

  @override
  String get share => 'शेयर करें';

  @override
  String get editPDF => 'पीडीएफ संपादित करें';

  @override
  String get failedToSavePDF =>
      'पीडीएफ सहेजने में विफल। कृपया पुनः प्रयास करें।';

  @override
  String shareFailed(Object error) {
    return 'शेयर विफल: $error';
  }

  @override
  String get storagePermissionRequired => 'स्टोरेज अनुमति आवश्यक';

  @override
  String get storagePermissionMessage =>
      'इस ऐप को पीडीएफ को डाउनलोड में सहेजने के लिए स्टोरेज अनुमति की आवश्यकता है। कृपया इसे सेटिंग्स में सक्षम करें।';

  @override
  String get openSettings => 'सेटिंग्स खोलें';

  @override
  String cannotEditInvalidFormat(Object filename) {
    return 'संपादित नहीं कर सकते \"$filename\": अमान्य पीडीएफ फ़ाइल नाम प्रारूप';
  }

  @override
  String loanNotFoundCannotEdit(Object loanId) {
    return 'लोन $loanId नहीं मिला। पीडीएफ संपादित नहीं कर सकते।';
  }

  @override
  String navigationError(Object error) {
    return 'नेविगेशन त्रुटि: $error';
  }

  @override
  String get pdfDeletedSuccessfully => 'पीडीएफ सफलतापूर्वक हटाया गया';

  @override
  String get fileRemovedFromStorage => 'फ़ाइल स्टोरेज से हटा दी गई';

  @override
  String get dismiss => 'खारिज करें';

  @override
  String get deletePDF => 'पीडीएफ हटाएं?';

  @override
  String sureDeleteFilename(Object filename) {
    return 'क्या आप वाकई \"$filename\" हटाना चाहते हैं?';
  }

  @override
  String failedToDelete(Object error) {
    return 'हटाने में विफल: $error';
  }

  @override
  String get editCustomer => 'ग्राहक संपादित करें';

  @override
  String get personalInfo => 'व्यक्तिगत जानकारी';

  @override
  String get contactInfo => 'संपर्क जानकारी';

  @override
  String get preferences => 'प्राथमिकताएं';

  @override
  String get fullName => 'पूरा नाम';

  @override
  String get nameRequired => 'नाम आवश्यक है';

  @override
  String get mobileNumberOptional => 'मोबाइल नंबर';

  @override
  String get mobileRequired => 'मोबाइल आवश्यक है';

  @override
  String get emailOptional => 'ईमेल (वैकल्पिक)';

  @override
  String get locationOptional => 'स्थान (वैकल्पिक)';

  @override
  String get receiveSMSNotifications =>
      'ईएमआई भुगतान के लिए एसएमएस सूचनाएं प्राप्त करें';

  @override
  String get stayUpdatedOnPayments => 'लोन भुगतान और अनुस्मारक पर अपडेट रहें';

  @override
  String get updateCustomer => 'ग्राहक अपडेट करें';

  @override
  String get updating => 'अपडेट हो रहा है...';

  @override
  String get customerUpdatedSuccessfully => 'ग्राहक सफलतापूर्वक अपडेट!';

  @override
  String get loanAmount => 'लोन राशि';

  @override
  String get interestRate => 'ब्याज दर';

  @override
  String get interestType => 'ब्याज प्रकार';

  @override
  String get createLoanTitle => 'लोन बनाएं';

  @override
  String get searchCustomerByNameOrMobile => 'नाम या मोबाइल नंबर से खोजें';

  @override
  String get addFirstCustomer => 'पहला ग्राहक जोड़ें';

  @override
  String get selectCustomer => 'ग्राहक चुनें';

  @override
  String get continueToOverview => 'अवलोकन पर जारी रखें';

  @override
  String loanCreatedFor(Object name) {
    return '$name के लिए लोन बनाया गया';
  }

  @override
  String amountDate(Object amount, Object date) {
    return 'राशि: ₹$amount • $date';
  }

  @override
  String get perMonth => '/महीना';

  @override
  String get welcomeToFinTech => 'फिनटेक में आपका स्वागत है';

  @override
  String get yourTrustedPartner => 'लोन प्रबंधन के लिए आपका विश्वसनीय भागीदार';

  @override
  String get trackLoansEMI => 'आसानी से लोन और ईएमआई ट्रैक करें';

  @override
  String get monitorLoanProgress =>
      'रीयल-टाइम में अपनी लोन प्रगति और ईएमआई अनुसूचियों की निगरानी करें';

  @override
  String get secureReliable => 'सुरक्षित और विश्वसनीय';

  @override
  String get dataProtected => 'आपका डेटा उद्योग-मानक सुरक्षा से सुरक्षित है';

  @override
  String get secureReliableEfficient => 'सुरक्षित • विश्वसनीय • कुशल';

  @override
  String get dashboard => 'डैशबोर्ड';

  @override
  String get customers => 'ग्राहक';

  @override
  String get overview => 'अवलोकन';

  @override
  String get darkMode => 'डार्क मोड';

  @override
  String get toggleBetweenThemes => 'लाइट और डार्क थीम के बीच टॉगल करें';

  @override
  String get enableSMSNotifications => 'एसएमएस सूचनाएं सक्षम करें';

  @override
  String get sendSMSForEMI => 'ईएमआई भुगतान और अनुस्मारक के लिए एसएमएस भेजें';

  @override
  String get myProfile => 'मेरी प्रोफ़ाइल';

  @override
  String get permissionRequired => 'अनुमति आवश्यक';

  @override
  String get gallery => 'गैलरी';

  @override
  String get camera => 'कैमरा';

  @override
  String get customerLedger => 'ग्राहक लेजर';

  @override
  String get searchByCustomerNameOrMobile => 'ग्राहक नाम या मोबाइल से खोजें...';

  @override
  String get createYourFirstLoan => 'अपना पहला लोन बनाएं';

  @override
  String get loanDataNotFound => 'लोन डेटा नहीं मिला';

  @override
  String get pdfUpdatedSuccessfully => 'पीडीएफ सफलतापूर्वक अपडेट!';

  @override
  String errorUpdatingPDF(Object error) {
    return 'पीडीएफ अपडेट करने में त्रुटि: $error';
  }

  @override
  String get cannotSaveDataMissing =>
      'सहेज नहीं सकते: लोन या ग्राहक डेटा गायब।';

  @override
  String get unknown => 'अज्ञात';

  @override
  String get createLoanSubtitle => 'लोन विवरण सेट करें और ईएमआई की गणना करें';

  @override
  String get enterAmount => 'राशि दर्ज करें';

  @override
  String get requiredField => 'आवश्यक';

  @override
  String get invalidAmount => 'अमान्य राशि';

  @override
  String get monthlyInterestRate => 'मासिक ब्याज दर (%)';

  @override
  String get exampleInterestRate => 'जैसे, 1.0';

  @override
  String get invalidRate => 'अमान्य दर';

  @override
  String get tenureMonths => 'अवधि (महीने)';

  @override
  String get exampleTenure => 'जैसे, 12';

  @override
  String get invalidTenure => 'अमान्य अवधि';

  @override
  String get calculatedEmi => 'गणना की गई ईएमआई';

  @override
  String emiPerMonth(Object amount) {
    return '₹$amount प्रति माह';
  }

  @override
  String get noCustomersFound => 'कोई ग्राहक नहीं मिला';

  @override
  String get pleaseSelectCustomer => 'कृपया एक ग्राहक चुनें';

  @override
  String get loanCreatedSuccessfullyTitle =>
      'लोन सफलतापूर्वक बना दिया गया! अपने लोन अवलोकन को देखें।';

  @override
  String get loanCreatedSuccessfullyMessage =>
      'आपका लोन बना दिया गया है। ईएमआई ट्रैक करने के लिए अवलोकन पर जारी रखें।';

  @override
  String get simpleInterest => 'साधारण';

  @override
  String get compoundInterest => 'चक्रवृद्धि';

  @override
  String get loanCompletionCertificate => 'ऋण पूर्णता प्रमाणपत्र';

  @override
  String get lenderDetails => 'ऋणदाता विवरण:';

  @override
  String get loanDetails => 'ऋण विवरण:';

  @override
  String get emiPaymentSummary => 'ईएमआई भुगतान सारांश:';

  @override
  String get payAllPendingEMI => 'सभी लंबित ईएमआई का भुगतान करें';

  @override
  String get allEmisPaid =>
      'बधाई हो! सभी ईएमआई का सफलतापूर्वक भुगतान हो चुका है।';

  @override
  String get certificateConfirmsCompletion =>
      'यह प्रमाणपत्र आपके ऋण की पूर्णता की पुष्टि करता है।';

  @override
  String generatedOn(Object date) {
    return '$date को जनरेट किया गया';
  }

  @override
  String get dueDate => 'देय तिथि';

  @override
  String get amount => 'राशि';

  @override
  String get status => 'स्थिति';

  @override
  String get simple => 'साधारण';

  @override
  String get compound => 'चक्रवृद्धि';

  @override
  String get refreshData => 'डेटा ताज़ा करें';

  @override
  String get loadingLoanData => 'लोन डेटा लोड हो रहा है...';

  @override
  String get enterPrincipalAmount => 'मूल राशि दर्ज करें';

  @override
  String get annualInterestRate => 'वार्षिक ब्याज दर';

  @override
  String get loanDurationMonths => 'महीनों में ऋण अवधि';

  @override
  String get selectInterestTypeHint => 'ब्याज गणना प्रकार चुनें';

  @override
  String get customerFullName => 'ग्राहक का पूरा नाम';

  @override
  String get tenDigitPhoneNumber => '10 अंकों का फोन नंबर';

  @override
  String get forNotifications => 'सूचनाओं के लिए';

  @override
  String get cityOrAddress => 'शहर या पता';

  @override
  String get saveAndRegeneratePDF => 'सेव करें और पीडीएफ फिर से बनाएँ';

  @override
  String get regeneratingPDF => 'पीडीएफ फिर से बनाया जा रहा है...';

  @override
  String get customerDataNotFound => 'ग्राहक डेटा नहीं मिला';

  @override
  String get editPDFDetails => 'पीडीएफ विवरण संपादित करें';

  @override
  String get ledgerOutstanding => 'बकाया';

  @override
  String get ledgerCollected => 'एकत्रित';

  @override
  String get ledgerStatusReceive => 'आपको मिलेगा';

  @override
  String get ledgerStatusPay => 'आपको देना है';

  @override
  String get ledgerStatusSettled => 'निपटाया गया';

  @override
  String get recentTransactions => 'हाल के लेनदेन';

  @override
  String moreTransactions(Object count) {
    return '+$count और लेनदेन';
  }

  @override
  String get givenAmount => 'दिया गया';

  @override
  String get receivedAmount => 'प्राप्त';

  @override
  String get today => 'आज';

  @override
  String get yesterday => 'कल';

  @override
  String get tomorrow => 'कल';

  @override
  String get noCustomersLedger => 'अभी तक कोई ग्राहक नहीं';

  @override
  String get ledgerEmptyMessage =>
      'ग्राहक लेजर देखने के लिए लोन बनाना शुरू करें। लेनदेन ट्रैक करें और अपने व्यवसाय को कुशलता से प्रबंधित करें।';

  @override
  String get createFirstLoanLedger => 'अपना पहला लोन बनाएं';

  @override
  String get loanDisbursed => 'लोन वितरित';

  @override
  String get emiPayment => 'ईएमआई भुगतान';

  @override
  String get updateProfile => 'प्रोफ़ाइल अपडेट करें';

  @override
  String get saving => 'सहेजा जा रहा है...';

  @override
  String get logout => 'लॉगआउट';

  @override
  String get appearance => 'रूप';

  @override
  String get smsNotifications => 'एसएमएस सूचनाएँ';

  @override
  String get enableSmsNotifications => 'एसएमएस सूचनाएँ सक्षम करें';

  @override
  String get darkModeToggleSubtitle => 'लाइट और डार्क थीम के बीच टॉगल करें';

  @override
  String get smsToggleSubtitle =>
      'ईएमआई भुगतान और अनुस्मारक के लिए एसएमएस भेजें';

  @override
  String get loadingPDFs => 'पीडीएफ लोड हो रहे हैं...';

  @override
  String get completeLoansWillGeneratePDFsHere =>
      'पूर्ण ऋण यहां पीडीएफ उत्पन्न करेंगे';

  @override
  String pdfCount(int count) {
    return '$count पीडीएफ';
  }

  @override
  String get tapPDFToShareViaWhatsApp =>
      'व्हाट्सएप पर साझा करने के लिए किसी भी पीडीएफ पर टैप करें';

  @override
  String get saveToDownloads => 'डाउनलोड में सहेजें';

  @override
  String get shareViaWhatsApp => 'व्हाट्सएप के माध्यम से साझा करें';

  @override
  String get gotIt => 'समझ गया';

  @override
  String get permanentlyDeleteWarning => 'यह स्थायी रूप से हटा देगा:';

  @override
  String get actionCannotBeUndone => 'यह क्रिया पूर्ववत नहीं की जा सकती।';

  @override
  String get retry => 'पुनः प्रयास करें';

  @override
  String get noLanguageMatch => 'आपकी खोज से मेल खाने वाली कोई भाषा नहीं';

  @override
  String get selected => 'चयनित';

  @override
  String get allow => 'अनुमति दें';

  @override
  String get logoutConfirmation => 'क्या आप वाकई लॉगआउट करना चाहते हैं?';

  @override
  String get loanManagementProfessional => 'ऋण प्रबंधन पेशेवर';

  @override
  String get accountDetails => 'खाता विवरण';
}
