// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'கடன் மேலாளர்';

  @override
  String get dashboardTitle => 'டாஷ்போர்டு';

  @override
  String get keyMetrics => 'முக்கிய அளவீடுகள்';

  @override
  String get totalLoans => 'மொத்த கடன்கள்';

  @override
  String get activeLoans => 'செயலில் உள்ள கடன்கள்';

  @override
  String get totalCustomers => 'மொத்த வாடிக்கையாளர்கள்';

  @override
  String get pendingEMIs => 'நிலுவையில் உள்ள EMIகள்';

  @override
  String get totalLoanAmount => 'மொத்த கடன் தொகை';

  @override
  String get totalProfit => 'மொத்த இலாபம்';

  @override
  String get quickActions => 'விரைவான செயல்கள்';

  @override
  String get addCustomer => 'வாடிக்கையாளரைச் சேர்க்கவும்';

  @override
  String get createLoan => 'கடனை உருவாக்கவும்';

  @override
  String get emiLedger => 'EMI லெட்ஜர்';

  @override
  String get pdfDocuments => 'PDF ஆவணங்கள்';

  @override
  String get recentActivity => 'சமீபத்திய செயல்பாடு';

  @override
  String get noRecentActivity => 'சமீபத்திய செயல்பாடு எதுவும் இல்லை';

  @override
  String get selectLanguage => 'மொழியைத் தேர்ந்தெடுக்கவும்';

  @override
  String get userProfile => 'பயனர் சுயவிவரம்';

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get languages => 'மொழிகள்';

  @override
  String helloUser(Object user) {
    return 'வணக்கம், $user!';
  }

  @override
  String get welcomeBack => 'உங்கள் டாஷ்போர்டுக்கு மீண்டும் வரவேற்கிறோம் 👋';

  @override
  String get exitAppTitle => 'பயன்பாட்டிலிருந்து வெளியேறு';

  @override
  String get exitAppMessage =>
      'நீங்கள் நிச்சயமாக பயன்பாட்டிலிருந்து வெளியேற விரும்புகிறீர்களா?';

  @override
  String get cancel => 'ரத்துசெய்';

  @override
  String get exit => 'வெளியேறு';

  @override
  String languageSelected(Object language) {
    return '$language மொழி தேர்ந்தெடுக்கப்பட்டது';
  }

  @override
  String get finTech => 'பின்டெக்';

  @override
  String get secureLogin => 'பாதுகாப்பான உள்நுழைவு';

  @override
  String get mobileNumber => 'மொபைல் எண்';

  @override
  String get enterMobileNumber => 'உங்கள் மொபைல் எண்ணை உள்ளிடவும்';

  @override
  String get pleaseEnterMobileNumber =>
      'தயவுசெய்து உங்கள் மொபைல் எண்ணை உள்ளிடவும்';

  @override
  String get enterValidMobileNumber =>
      'சரியான 10-இலக்க மொபைல் எண்ணை உள்ளிடவும்';

  @override
  String get name => 'பெயர்';

  @override
  String get enterName => 'உங்கள் பெயரை உள்ளிடவும்';

  @override
  String get pleaseEnterName => 'தயவுசெய்து உங்கள் பெயரை உள்ளிடவும்';

  @override
  String get email => 'மின்னஞ்சல்';

  @override
  String get enterEmail => 'உங்கள் மின்னஞ்சலை உள்ளிடவும்';

  @override
  String get pleaseEnterEmail => 'தயவுசெய்து உங்கள் மின்னஞ்சலை உள்ளிடவும்';

  @override
  String get enterValidEmail => 'சரியான மின்னஞ்சல் முகவரியை உள்ளிடவும்';

  @override
  String get location => 'இருப்பிடம்';

  @override
  String get enterLocation => 'உங்கள் இருப்பிடத்தை உள்ளிடவும்';

  @override
  String get pleaseEnterLocation => 'தயவுசெய்து உங்கள் இருப்பிடத்தை உள்ளிடவும்';

  @override
  String get mPin => 'எம்-பின்';

  @override
  String get enterMPin => 'உங்கள் எம்-பினை உள்ளிடவும்';

  @override
  String get pleaseEnterMPin => 'தயவுசெய்து உங்கள் எம்-பினை உள்ளிடவும்';

  @override
  String get mPinMustBe4To6Digits => 'எம்-பின் 4-6 இலக்கங்களாக இருக்க வேண்டும்';

  @override
  String get login => 'உள்நுழைக';

  @override
  String get congratulations => 'வாழ்த்துக்கள்!';

  @override
  String get loggedInSuccessfully => 'நீங்கள் வெற்றிகரமாக உள்நுழைந்துள்ளீர்கள்';

  @override
  String get allCustomers => 'அனைத்து வாடிக்கையாளர்கள்';

  @override
  String get searchCustomers => 'வாடிக்கையாளர்களைத் தேடு...';

  @override
  String get noCustomersYet => 'இதுவரை வாடிக்கையாளர்கள் இல்லை';

  @override
  String get startBuildingCustomerDatabase =>
      'உங்கள் முதல் வாடிக்கையாளரைச் சேர்ப்பதன் மூலம் உங்கள் வாடிக்கையாளர் தரவுத்தளத்தை உருவாக்கத் தொடங்குங்கள்.';

  @override
  String get addYourFirstCustomer => 'உங்கள் முதல் வாடிக்கையாளரைச் சேர்க்கவும்';

  @override
  String get noResultsFound => 'முடிவுகள் எதுவும் கிடைக்கவில்லை';

  @override
  String get tryAdjustingSearchTerms =>
      'உங்கள் தேடல் வார்த்தைகளை சரிசெய்யவும் அல்லது எழுத்துப்பிழையை சரிபார்க்கவும்.';

  @override
  String get deleteCustomer => 'வாடிக்கையாளரை நீக்கு';

  @override
  String areYouSureDeleteCustomer(Object name) {
    return '$name நீக்க வேண்டும் என்பது உறுதியா? இந்த செயலை மீளமுடியாது.';
  }

  @override
  String customerDeletedSuccessfully(Object name) {
    return '$name வெற்றிகரமாக நீக்கப்பட்டது';
  }

  @override
  String get delete => 'நீக்கு';

  @override
  String get addCustomerTitle => 'வாடிக்கையாளரைச் சேர்க்கவும்';

  @override
  String get customerDetails => 'வாடிக்கையாளர் விவரங்கள்';

  @override
  String get mobile => 'மொபைல்';

  @override
  String get pleaseEnterMobile => 'தயவுசெய்து மொபைல் எண்ணை உள்ளிடவும்';

  @override
  String get pleaseEnterEmailAddress => 'தயவுசெய்து மின்னஞ்சலை உள்ளிடவும்';

  @override
  String get smsConsent =>
      'EMI பணம் செலுத்துதல்களுக்கான SMS அறிவிப்புகளைப் பெற நான் ஒப்புக்கொள்கிறேன்';

  @override
  String get customerAdded => 'வாடிக்கையாளர் சேர்க்கப்பட்டார்!';

  @override
  String get customerAddedSuccessfully =>
      'வாடிக்கையாளர் வெற்றிகரமாக சேர்க்கப்பட்டார்\nகடன் உருவாக்கத் தயார்!';

  @override
  String get continueText => 'தொடரவும்';

  @override
  String get pleaseFillAllRequiredFields =>
      'தயவுசெய்து அனைத்து தேவையான புலங்களையும் நிரப்பவும்';

  @override
  String get overviewLoans => 'கடன்களின் கண்ணோட்டம்';

  @override
  String get active => 'செயலில்';

  @override
  String get completed => 'முடிந்தது';

  @override
  String get pending => 'நிலுவையில்';

  @override
  String get searchByCustomerMobile => 'வாடிக்கையாளரின் மொபைல் எண் மூலம் தேடுக';

  @override
  String get noActiveLoans => 'செயலில் உள்ள கடன்கள் இல்லை';

  @override
  String get noCompletedLoans => 'முடிந்த கடன்கள் இல்லை';

  @override
  String get noPendingLoans => 'நிலுவையில் உள்ள கடன்கள் இல்லை';

  @override
  String get allEMIsPaidSuccessfully =>
      'அனைத்து EMIகளும் வெற்றிகரமாக செலுத்தப்பட்டுள்ளன';

  @override
  String get moveToPDFDocuments =>
      'அதன் PDFஐப் பார்க்க PDF ஆவணங்களுக்குச் செல்ல விரும்புகிறீர்களா?';

  @override
  String get later => 'பின்னர்';

  @override
  String get viewPDF => 'PDF ஐப் பார்க்கவும்';

  @override
  String get loanEMIDetails => 'கடன் EMI விவரங்கள்';

  @override
  String loanID(Object id) {
    return 'கடன் ID: $id...';
  }

  @override
  String get principal => 'அசல்';

  @override
  String get emiLabel => 'EMI';

  @override
  String get rate => 'விகிதம்';

  @override
  String get tenure => 'கால அளவு';

  @override
  String get months => 'மாதங்கள்';

  @override
  String get markAsPaid => 'செலுத்தப்பட்டதாகக் குறிக்கவும்';

  @override
  String get paid => 'செலுத்தப்பட்டது';

  @override
  String get markAllEMIsPaid =>
      'அனைத்து EMIகளையும் செலுத்தப்பட்டதாகக் குறிக்கவும்';

  @override
  String markAllPendingEMIsAsPaid(Object count) {
    return 'அனைத்து $count நிலுவை EMIகளையும் செலுத்தப்பட்டதாகக் குறிக்கவும்';
  }

  @override
  String markAllEMIsPaidConfirm(Object count) {
    return 'நீங்கள் உறுதியாக இருக்கிறீர்களா? இது அனைத்து $count நிலுவை EMIகளையும் செலுத்தப்பட்டதாகக் குறிக்கும் மற்றும் நிறைவு PDF ஐ மீண்டும் உருவாக்கும்.';
  }

  @override
  String get confirm => 'உறுதிப்படுத்து';

  @override
  String allEMIsMarkedAsPaid(Object count) {
    return 'அனைத்து $count EMIகளும் செலுத்தப்பட்டதாகக் குறிக்கப்பட்டன! PDF மீண்டும் உருவாக்கப்பட்டது.';
  }

  @override
  String get loanCompletedSuccessfully =>
      'கடன் வெற்றிகரமாக முடிக்கப்பட்டது! PDF தானாக உருவாக்கப்பட்டது மற்றும் PDF ஆவணங்களில் கிடைக்கிறது.';

  @override
  String get emiMarkedAsPaid =>
      'EMI வெற்றிகரமாக செலுத்தப்பட்டதாகக் குறிக்கப்பட்டது!';

  @override
  String get unknownCustomer => 'அறியப்படாத வாடிக்கையாளர்';

  @override
  String due(Object date) {
    return 'நிலுவை: $date';
  }

  @override
  String get emiSchedule => 'EMI அட்டவணை';

  @override
  String get searchCustomer => 'வாடிக்கையாளரைத் தேடு';

  @override
  String get searchByNameOrMobile => 'பெயர் அல்லது மொபைல் எண் மூலம் தேடுக';

  @override
  String get filterByCustomer =>
      'வாடிக்கையாளர் மூலம் வடிகட்டு (விருப்பத்தேர்வு)';

  @override
  String get allCustomersLabel => 'அனைத்து வாடிக்கையாளர்கள்';

  @override
  String get noEMISchedulesFound => 'EMI அட்டவணைகள் எதுவும் கிடைக்கவில்லை';

  @override
  String get tryAdjustingSearchFilter =>
      'உங்கள் தேடல் அல்லது வடிகட்டி அளவுகோல்களை சரிசெய்யவும்';

  @override
  String get allLoanPDFs => 'அனைத்து கடன் PDFகள்';

  @override
  String get noLoanCompletionPDFs =>
      'கடன் நிறைவு PDFகள் எதுவும் கிடைக்கவில்லை\nகடன் சுருக்கங்களிலிருந்து PDF ஐ உருவாக்கவும்';

  @override
  String customer(Object name) {
    return 'வாடிக்கையாளர்: $name';
  }

  @override
  String idLabel(Object value) {
    return 'ID: $value';
  }

  @override
  String get save => 'சேமி';

  @override
  String get share => 'பகிர்';

  @override
  String get editPDF => 'PDF ஐத் திருத்து';

  @override
  String get failedToSavePDF =>
      'PDF ஐ சேமிக்க முடியவில்லை. தயவுசெய்து மீண்டும் முயற்சிக்கவும்.';

  @override
  String shareFailed(Object error) {
    return 'பகிர்தல் தோல்வி: $error';
  }

  @override
  String get storagePermissionRequired => 'சேமிப்பக அனுமதி தேவை';

  @override
  String get storagePermissionMessage =>
      'இந்த பயன்பாடு PDF களை பதிவிறக்க கோப்புறையில் சேமிக்க சேமிப்பக அனுமதி தேவைப்படுகிறது. அமைப்புகளில் இதை இயக்கவும்.';

  @override
  String get openSettings => 'அமைப்புகளைத் திற';

  @override
  String cannotEditInvalidFormat(Object filename) {
    return '\"$filename\" ஐத் திருத்த முடியாது: தவறான PDF கோப்புப்பெயர் வடிவம்';
  }

  @override
  String loanNotFoundCannotEdit(Object loanId) {
    return 'கடன் $loanId கிடைக்கவில்லை. PDF ஐத் திருத்த முடியாது.';
  }

  @override
  String navigationError(Object error) {
    return 'வழிசெலுத்தல் பிழை: $error';
  }

  @override
  String get pdfDeletedSuccessfully => 'PDF வெற்றிகரமாக நீக்கப்பட்டது';

  @override
  String get fileRemovedFromStorage =>
      'கோப்பு சேமிப்பகத்திலிருந்து அகற்றப்பட்டது';

  @override
  String get dismiss => 'நிராகரி';

  @override
  String get deletePDF => 'PDF ஐ நீக்கவா?';

  @override
  String sureDeleteFilename(Object filename) {
    return '\"$filename\" ஐ நிச்சயமாக நீக்க விரும்புகிறீர்களா?';
  }

  @override
  String failedToDelete(Object error) {
    return 'நீக்க முடியவில்லை: $error';
  }

  @override
  String get editCustomer => 'வாடிக்கையாளரைத் திருத்து';

  @override
  String get personalInfo => 'தனிப்பட்ட தகவல்';

  @override
  String get contactInfo => 'தொடர்புத் தகவல்';

  @override
  String get preferences => 'விருப்பத்தேர்வுகள்';

  @override
  String get fullName => 'முழு பெயர்';

  @override
  String get nameRequired => 'பெயர் தேவை';

  @override
  String get mobileNumberOptional => 'மொபைல் எண்';

  @override
  String get mobileRequired => 'மொபைல் தேவை';

  @override
  String get emailOptional => 'மின்னஞ்சல் (விருப்பத்தேர்வு)';

  @override
  String get locationOptional => 'இருப்பிடம் (விருப்பத்தேர்வு)';

  @override
  String get receiveSMSNotifications =>
      'EMI பணம் செலுத்துதல்களுக்கான SMS அறிவிப்புகளைப் பெறுக';

  @override
  String get stayUpdatedOnPayments =>
      'கடன் பணம் செலுத்துதல்கள் மற்றும் நினைவூட்டல்கள் பற்றி புதுப்பித்த நிலையில் இருங்கள்';

  @override
  String get updateCustomer => 'வாடிக்கையாளரைப் புதுப்பி';

  @override
  String get updating => 'புதுப்பிக்கப்படுகிறது...';

  @override
  String get customerUpdatedSuccessfully =>
      'வாடிக்கையாளர் வெற்றிகரமாக புதுப்பிக்கப்பட்டார்!';

  @override
  String get loanAmount => 'கடன் தொகை';

  @override
  String get interestRate => 'வட்டி விகிதம்';

  @override
  String get interestType => 'வட்டி வகை';

  @override
  String get createLoanTitle => 'கடனை உருவாக்கு';

  @override
  String get searchCustomerByNameOrMobile =>
      'பெயர் அல்லது மொபைல் எண் மூலம் தேடுக';

  @override
  String get addFirstCustomer => 'முதல் வாடிக்கையாளரைச் சேர்';

  @override
  String get selectCustomer => 'வாடிக்கையாளரைத் தேர்ந்தெடு';

  @override
  String get continueToOverview => 'கண்ணோட்டத்திற்குத் தொடரவும்';

  @override
  String loanCreatedFor(Object name) {
    return '$name க்கான கடன் உருவாக்கப்பட்டது';
  }

  @override
  String amountDate(Object amount, Object date) {
    return 'தொகை: ₹$amount • $date';
  }

  @override
  String get perMonth => '/மாதம்';

  @override
  String get welcomeToFinTech => 'பின்டெக்கிற்கு வரவேற்கிறோம்';

  @override
  String get yourTrustedPartner =>
      'கடன் மேலாண்மைக்கான உங்கள் நம்பகமான கூட்டாளி';

  @override
  String get trackLoansEMI => 'கடன்கள் மற்றும் EMIகளை எளிதாகக் கண்காணிக்கவும்';

  @override
  String get monitorLoanProgress =>
      'உங்கள் கடன் முன்னேற்றம் மற்றும் EMI அட்டவணையை நிகழ்நேரத்தில் கண்காணிக்கவும்';

  @override
  String get secureReliable => 'பாதுகாப்பான மற்றும் நம்பகமான';

  @override
  String get dataProtected =>
      'உங்கள் தரவு தொழில்-தர பாதுகாப்புடன் பாதுகாக்கப்படுகிறது';

  @override
  String get secureReliableEfficient => 'பாதுகாப்பான • நம்பகமான • திறமையான';

  @override
  String get dashboard => 'டாஷ்போர்டு';

  @override
  String get customers => 'வாடிக்கையாளர்கள்';

  @override
  String get overview => 'கண்ணோட்டம்';

  @override
  String get darkMode => 'இருண்ட முறை';

  @override
  String get toggleBetweenThemes => 'வெளிச்ச மற்றும் இருண்ட தீம் இடையே மாறவும்';

  @override
  String get enableSMSNotifications => 'SMS அறிவிப்புகளை இயக்கு';

  @override
  String get sendSMSForEMI =>
      'EMI பணம் செலுத்துதல்கள் மற்றும் நினைவூட்டல்களுக்கு SMS அனுப்பு';

  @override
  String get myProfile => 'என் சுயவிவரம்';

  @override
  String get permissionRequired => 'அனுமதி தேவை';

  @override
  String get gallery => 'கேலரி';

  @override
  String get camera => 'கேமரா';

  @override
  String get customerLedger => 'வாடிக்கையாளர் லெட்ஜர்';

  @override
  String get searchByCustomerNameOrMobile =>
      'வாடிக்கையாளர் பெயர் அல்லது மொபைல் மூலம் தேடுக...';

  @override
  String get createYourFirstLoan => 'உங்கள் முதல் கடனை உருவாக்கவும்';

  @override
  String get loanDataNotFound => 'கடன் தரவு கிடைக்கவில்லை';

  @override
  String get pdfUpdatedSuccessfully => 'PDF வெற்றிகரமாக புதுப்பிக்கப்பட்டது!';

  @override
  String errorUpdatingPDF(Object error) {
    return 'PDF புதுப்பிப்பதில் பிழை: $error';
  }

  @override
  String get cannotSaveDataMissing =>
      'சேமிக்க முடியாது: கடன் அல்லது வாடிக்கையாளர் தரவு காணவில்லை.';

  @override
  String get unknown => 'அறியப்படாதது';

  @override
  String get createLoanSubtitle => 'கடன் விவரங்களை அமைத்து EMI ஐ கணக்கிடுங்கள்';

  @override
  String get enterAmount => 'தொகையை உள்ளிடவும்';

  @override
  String get requiredField => 'தேவை';

  @override
  String get invalidAmount => 'தவறான தொகை';

  @override
  String get monthlyInterestRate => 'மாத வட்டி விகிதம் (%)';

  @override
  String get exampleInterestRate => 'எ.கா., 1.0';

  @override
  String get invalidRate => 'தவறான விகிதம்';

  @override
  String get tenureMonths => 'கால அளவு (மாதங்கள்)';

  @override
  String get exampleTenure => 'எ.கா., 12';

  @override
  String get invalidTenure => 'தவறான கால அளவு';

  @override
  String get calculatedEmi => 'கணக்கிடப்பட்ட EMI';

  @override
  String emiPerMonth(Object amount) {
    return 'மாதத்திற்கு ₹$amount';
  }

  @override
  String get noCustomersFound => 'வாடிக்கையாளர்கள் எதுவும் கிடைக்கவில்லை';

  @override
  String get pleaseSelectCustomer =>
      'தயவுசெய்து ஒரு வாடிக்கையாளரைத் தேர்ந்தெடுக்கவும்';

  @override
  String get loanCreatedSuccessfullyTitle =>
      'கடன் வெற்றிகரமாக உருவாக்கப்பட்டது! உங்கள் கடன்களின் கண்ணோட்டத்தைப் பார்க்கவும்.';

  @override
  String get loanCreatedSuccessfullyMessage =>
      'உங்கள் கடன் உருவாக்கப்பட்டது. EMI களைக் கண்காணிக்க கண்ணோட்டத்திற்குத் தொடரவும்.';

  @override
  String get simpleInterest => 'எளிய';

  @override
  String get compoundInterest => 'கூட்டு';

  @override
  String get loanCompletionCertificate => 'கடன் நிறைவு சான்றிதழ்';

  @override
  String get lenderDetails => 'கடன் வழங்குபவரின் விவரங்கள்:';

  @override
  String get loanDetails => 'கடன் விவரங்கள்:';

  @override
  String get emiPaymentSummary => 'EMI பணம் செலுத்துதல் சுருக்கம்:';

  @override
  String get payAllPendingEMI => 'அனைத்து நிலுவை EMIகளையும் செலுத்து';

  @override
  String get allEmisPaid =>
      'வாழ்த்துக்கள்! அனைத்து EMIகளும் வெற்றிகரமாக செலுத்தப்பட்டுள்ளன.';

  @override
  String get certificateConfirmsCompletion =>
      'இந்த சான்றிதழ் உங்கள் கடனின் நிறைவை உறுதிப்படுத்துகிறது.';

  @override
  String generatedOn(Object date) {
    return '$date அன்று உருவாக்கப்பட்டது';
  }

  @override
  String get dueDate => 'கெடு தேதி';

  @override
  String get amount => 'தொகை';

  @override
  String get status => 'நிலை';

  @override
  String get simple => 'எளிய';

  @override
  String get compound => 'கூட்டு';

  @override
  String get refreshData => 'தரவைப் புதுப்பி';

  @override
  String get loadingLoanData => 'கடன் தரவு ஏற்றப்படுகிறது...';

  @override
  String get enterPrincipalAmount => 'அசல் தொகையை உள்ளிடவும்';

  @override
  String get annualInterestRate => 'ஆண்டு வட்டி விகிதம்';

  @override
  String get loanDurationMonths => 'மாதங்களில் கடன் கால அளவு';

  @override
  String get selectInterestTypeHint =>
      'வட்டி கணக்கீட்டு வகையைத் தேர்ந்தெடுக்கவும்';

  @override
  String get customerFullName => 'வாடிக்கையாளரின் முழு பெயர்';

  @override
  String get tenDigitPhoneNumber => '10 இலக்க தொலைபேசி எண்';

  @override
  String get forNotifications => 'அறிவிப்புகளுக்காக';

  @override
  String get cityOrAddress => 'நகரம் அல்லது முகவரி';

  @override
  String get saveAndRegeneratePDF => 'சேமித்து PDF ஐ மீண்டும் உருவாக்கு';

  @override
  String get regeneratingPDF => 'PDF மீண்டும் உருவாக்கப்படுகிறது...';

  @override
  String get customerDataNotFound => 'வாடிக்கையாளர் தரவு கிடைக்கவில்லை';

  @override
  String get editPDFDetails => 'PDF விவரங்களைத் திருத்து';

  @override
  String get ledgerOutstanding => 'நிலுவை';

  @override
  String get ledgerCollected => 'சேகரிக்கப்பட்டது';

  @override
  String get ledgerStatusReceive => 'உங்களுக்கு கிடைக்கும்';

  @override
  String get ledgerStatusPay => 'நீங்கள் கொடுப்பீர்கள்';

  @override
  String get ledgerStatusSettled => 'தீர்க்கப்பட்டது';

  @override
  String get recentTransactions => 'சமீபத்திய பரிவர்த்தனைகள்';

  @override
  String moreTransactions(Object count) {
    return '+$count மேலும் பரிவர்த்தனைகள்';
  }

  @override
  String get givenAmount => 'கொடுக்கப்பட்டது';

  @override
  String get receivedAmount => 'பெறப்பட்டது';

  @override
  String get today => 'இன்று';

  @override
  String get yesterday => 'நேற்று';

  @override
  String get tomorrow => 'நாளை';

  @override
  String get noCustomersLedger => 'இதுவரை வாடிக்கையாளர்கள் இல்லை';

  @override
  String get ledgerEmptyMessage =>
      'உங்கள் வாடிக்கையாளர் லெட்ஜரைப் பார்க்க கடன்களை உருவாக்கி தொடங்குங்கள். பரிவர்த்தனைகளைக் கண்காணித்து உங்கள் வணிகத்தை திறமையாக நிர்வகிக்கவும்.';

  @override
  String get createFirstLoanLedger => 'உங்கள் முதல் கடனை உருவாக்கவும்';

  @override
  String get loanDisbursed => 'கடன் வழங்கப்பட்டது';

  @override
  String get emiPayment => 'EMI பணம் செலுத்துதல்';

  @override
  String get updateProfile => 'சுயவிவரத்தைப் புதுப்பிக்கவும்';

  @override
  String get saving => 'சேமிக்கப்படுகிறது...';

  @override
  String get logout => 'வெளியேறு';

  @override
  String get appearance => 'தோற்றம்';

  @override
  String get smsNotifications => 'எஸ்எம்எஸ் அறிவிப்புகள்';

  @override
  String get enableSmsNotifications => 'எஸ்எம்எஸ் அறிவிப்புகளை இயக்கு';

  @override
  String get darkModeToggleSubtitle =>
      'லைட் மற்றும் டார்க் தீம்க்கு இடையே மாற்று';

  @override
  String get smsToggleSubtitle =>
      'ஈஎம்ஐ கட்டணங்கள் மற்றும் நினைவூட்டல்களுக்கு எஸ்எம்எஸ் அனுப்பு';

  @override
  String get loadingPDFs => 'PDF கள் ஏற்றப்படுகின்றன...';

  @override
  String get completeLoansWillGeneratePDFsHere =>
      'முடிவுற்ற கடன்கள் இங்கே PDF உருவாக்கும்';

  @override
  String pdfCount(int count) {
    return '$count PDF கள்';
  }

  @override
  String get tapPDFToShareViaWhatsApp =>
      'வாட்ஸ்அப்பில் பகிர எந்த PDF ஐத் தட்டவும்';

  @override
  String get saveToDownloads => 'பதிவிறக்கங்களில் சேமிக்கவும்';

  @override
  String get shareViaWhatsApp => 'வாட்ஸ்அப் மூலம் பகிரவும்';

  @override
  String get gotIt => 'புரிந்துகொண்டேன்';

  @override
  String get permanentlyDeleteWarning => 'இது நிரந்தரமாக நீக்கும்:';

  @override
  String get actionCannotBeUndone => 'இந்த செயலை மீளமுடியாது.';

  @override
  String get retry => 'மீண்டும் முயல்க';

  @override
  String get noLanguageMatch =>
      'உங்கள் தேடலுடன் பொருந்தக்கூடிய மொழி எதுவும் இல்லை';

  @override
  String get selected => 'தேர்ந்தெடுக்கப்பட்டது';

  @override
  String get allow => 'அனுமதி';

  @override
  String get logoutConfirmation =>
      'நீங்கள் நிச்சயமாக வெளியேற விரும்புகிறீர்களா?';

  @override
  String get loanManagementProfessional => 'கடன் மேலாண்மை நிபுணர்';

  @override
  String get accountDetails => 'கணக்கு விவரங்கள்';
}
