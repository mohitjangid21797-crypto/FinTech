// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get appTitle => 'લોન મેનેજર';

  @override
  String get dashboardTitle => 'ડેશબોર્ડ';

  @override
  String get keyMetrics => 'મુખ્ય મેટ્રિક્સ';

  @override
  String get totalLoans => 'કુલ લોન';

  @override
  String get activeLoans => 'સક્રિય લોન';

  @override
  String get totalCustomers => 'કુલ ગ્રાહકો';

  @override
  String get pendingEMIs => 'બાકી EMI';

  @override
  String get totalLoanAmount => 'કુલ લોન રકમ';

  @override
  String get totalProfit => 'કુલ નફો';

  @override
  String get quickActions => 'ઝડપી ક્રિયાઓ';

  @override
  String get addCustomer => 'ગ્રાહક ઉમેરો';

  @override
  String get createLoan => 'લોન બનાવો';

  @override
  String get emiLedger => 'EMI ખાતાવહી';

  @override
  String get pdfDocuments => 'PDF દસ્તાવેજો';

  @override
  String get recentActivity => 'તાજેતરની પ્રવૃત્તિ';

  @override
  String get noRecentActivity => 'કોઈ તાજેતરની પ્રવૃત્તિ નથી';

  @override
  String get selectLanguage => 'ભાષા પસંદ કરો';

  @override
  String get userProfile => 'વપરાશકર્તા પ્રોફાઇલ';

  @override
  String get settings => 'સેટિંગ્સ';

  @override
  String get languages => 'ભાષાઓ';

  @override
  String helloUser(Object user) {
    return 'નમસ્તે, $user!';
  }

  @override
  String get welcomeBack => 'તમારા ડેશબોર્ડમાં પાછા સ્વાગત છે 👋';

  @override
  String get exitAppTitle => 'એપ્લિકેશનમાંથી બહાર નીકળો';

  @override
  String get exitAppMessage =>
      'શું તમે ખરેખર એપ્લિકેશનમાંથી બહાર નીકળવા માંગો છો?';

  @override
  String get cancel => 'રદ કરો';

  @override
  String get exit => 'બહાર નીકળો';

  @override
  String languageSelected(Object language) {
    return '$language ભાષા પસંદ કરી';
  }

  @override
  String get finTech => 'ફિનટેક';

  @override
  String get secureLogin => 'સુરક્ષિત લૉગિન';

  @override
  String get mobileNumber => 'મોબાઇલ નંબર';

  @override
  String get enterMobileNumber => 'તમારો મોબાઇલ નંબર દાખલ કરો';

  @override
  String get pleaseEnterMobileNumber => 'કૃપા કરીને તમારો મોબાઇલ નંબર દાખલ કરો';

  @override
  String get enterValidMobileNumber => 'માન્ય 10-અંકનો મોબાઇલ નંબર દાખલ કરો';

  @override
  String get name => 'નામ';

  @override
  String get enterName => 'તમારું નામ દાખલ કરો';

  @override
  String get pleaseEnterName => 'કૃપા કરીને તમારું નામ દાખલ કરો';

  @override
  String get email => 'ઇમેઇલ';

  @override
  String get enterEmail => 'તમારો ઇમેઇલ દાખલ કરો';

  @override
  String get pleaseEnterEmail => 'કૃપા કરીને તમારો ઇમેઇલ દાખલ કરો';

  @override
  String get enterValidEmail => 'માન્ય ઇમેઇલ સરનામું દાખલ કરો';

  @override
  String get location => 'સ્થાન';

  @override
  String get enterLocation => 'તમારું સ્થાન દાખલ કરો';

  @override
  String get pleaseEnterLocation => 'કૃપા કરીને તમારું સ્થાન દાખલ કરો';

  @override
  String get mPin => 'એમ-પિન';

  @override
  String get enterMPin => 'તમારો એમ-પિન દાખલ કરો';

  @override
  String get pleaseEnterMPin => 'કૃપા કરીને તમારો એમ-પિન દાખલ કરો';

  @override
  String get mPinMustBe4To6Digits => 'એમ-પિન 4-6 અંકોનો હોવો જોઈએ';

  @override
  String get login => 'લૉગિન';

  @override
  String get congratulations => 'અભિનંદન!';

  @override
  String get loggedInSuccessfully => 'તમે સફળતાપૂર્વક લૉગિન કર્યું છે';

  @override
  String get allCustomers => 'બધા ગ્રાહકો';

  @override
  String get searchCustomers => 'ગ્રાહકો શોધો...';

  @override
  String get noCustomersYet => 'હજુ સુધી કોઈ ગ્રાહક નથી';

  @override
  String get startBuildingCustomerDatabase =>
      'તમારો પ્રથમ ગ્રાહક ઉમેરીને તમારો ગ્રાહક ડેટાબેઝ બનાવવાનું શરૂ કરો.';

  @override
  String get addYourFirstCustomer => 'તમારો પ્રથમ ગ્રાહક ઉમેરો';

  @override
  String get noResultsFound => 'કોઈ પરિણામ મળ્યું નથી';

  @override
  String get tryAdjustingSearchTerms =>
      'તમારા શોધ શબ્દો સમાયોજિત કરો અથવા જોડણી તપાસો.';

  @override
  String get deleteCustomer => 'ગ્રાહક કાઢી નાખો';

  @override
  String areYouSureDeleteCustomer(Object name) {
    return 'શું તમે ખરેખર $name કાઢી નાખવા માંગો છો? આ ક્રિયા પૂર્વવત્ કરી શકાતી નથી.';
  }

  @override
  String customerDeletedSuccessfully(Object name) {
    return '$name સફળતાપૂર્વક કાઢી નાખ્યો';
  }

  @override
  String get delete => 'કાઢી નાખો';

  @override
  String get addCustomerTitle => 'ગ્રાહક ઉમેરો';

  @override
  String get customerDetails => 'ગ્રાહકની વિગતો';

  @override
  String get mobile => 'મોબાઇલ';

  @override
  String get pleaseEnterMobile => 'કૃપા કરીને મોબાઇલ નંબર દાખલ કરો';

  @override
  String get pleaseEnterEmailAddress => 'કૃપા કરીને ઇમેઇલ દાખલ કરો';

  @override
  String get smsConsent =>
      'હું EMI ચુકવણી માટે SMS સૂચનાઓ પ્રાપ્ત કરવા માટે સંમતિ આપું છું';

  @override
  String get customerAdded => 'ગ્રાહક ઉમેરાયો!';

  @override
  String get customerAddedSuccessfully =>
      'ગ્રાહક સફળતાપૂર્વક ઉમેરાયો\nલોન બનાવવા માટે તૈયાર!';

  @override
  String get continueText => 'ચાલુ રાખો';

  @override
  String get pleaseFillAllRequiredFields => 'કૃપા કરીને બધા જરૂરી ક્ષેત્રો ભરો';

  @override
  String get overviewLoans => 'લોનની ઝાંખી';

  @override
  String get active => 'સક્રિય';

  @override
  String get completed => 'પૂર્ણ';

  @override
  String get pending => 'બાકી';

  @override
  String get searchByCustomerMobile => 'ગ્રાહકના મોબાઇલ નંબર દ્વારા શોધો';

  @override
  String get noActiveLoans => 'કોઈ સક્રિય લોન નથી';

  @override
  String get noCompletedLoans => 'કોઈ પૂર્ણ લોન નથી';

  @override
  String get noPendingLoans => 'કોઈ બાકી લોન નથી';

  @override
  String get allEMIsPaidSuccessfully => 'બધી EMI સફળતાપૂર્વક ચૂકવી દેવાઈ છે';

  @override
  String get moveToPDFDocuments =>
      'શું તમે તેનું PDF જોવા માટે PDF દસ્તાવેજો પર જવા માંગો છો?';

  @override
  String get later => 'પછીથી';

  @override
  String get viewPDF => 'PDF જુઓ';

  @override
  String get loanEMIDetails => 'લોન EMI વિગતો';

  @override
  String loanID(Object id) {
    return 'લોન ID: $id...';
  }

  @override
  String get principal => 'મુદ્દલ';

  @override
  String get emiLabel => 'EMI';

  @override
  String get rate => 'દર';

  @override
  String get tenure => 'મુદત';

  @override
  String get months => 'મહિનાઓ';

  @override
  String get markAsPaid => 'ચૂકવેલ તરીકે ચિહ્નિત કરો';

  @override
  String get paid => 'ચૂકવેલ';

  @override
  String get markAllEMIsPaid => 'બધી EMI ચૂકવેલ તરીકે ચિહ્નિત કરો';

  @override
  String markAllPendingEMIsAsPaid(Object count) {
    return 'બધી $count બાકી EMI ચૂકવેલ તરીકે ચિહ્નિત કરો';
  }

  @override
  String markAllEMIsPaidConfirm(Object count) {
    return 'શું તમને ખાતરી છે? આ બધી $count બાકી EMI ચૂકવેલ તરીકે ચિહ્નિત કરશે અને પૂર્ણતા PDF પુનઃજનરેટ કરશે.';
  }

  @override
  String get confirm => 'ખાતરી કરો';

  @override
  String allEMIsMarkedAsPaid(Object count) {
    return 'બધી $count EMI ચૂકવેલ તરીકે ચિહ્નિત થઈ ગઈ! PDF પુનઃજનરેટ થઈ ગયું.';
  }

  @override
  String get loanCompletedSuccessfully =>
      'લોન સફળતાપૂર્વક પૂર્ણ થઈ! PDF આપમેળે જનરેટ થઈ ગયું છે અને PDF દસ્તાવેજોમાં ઉપલબ્ધ છે.';

  @override
  String get emiMarkedAsPaid => 'EMI સફળતાપૂર્વક ચૂકવેલ તરીકે ચિહ્નિત થઈ ગઈ!';

  @override
  String get unknownCustomer => 'અજ્ઞાત ગ્રાહક';

  @override
  String due(Object date) {
    return 'બાકી: $date';
  }

  @override
  String get emiSchedule => 'EMI શેડ્યૂલ';

  @override
  String get searchCustomer => 'ગ્રાહક શોધો';

  @override
  String get searchByNameOrMobile => 'નામ અથવા મોબાઇલ નંબર દ્વારા શોધો';

  @override
  String get filterByCustomer => 'ગ્રાહક દ્વારા ફિલ્ટર કરો (વૈકલ્પિક)';

  @override
  String get allCustomersLabel => 'બધા ગ્રાહકો';

  @override
  String get noEMISchedulesFound => 'કોઈ EMI શેડ્યૂલ મળ્યાં નથી';

  @override
  String get tryAdjustingSearchFilter =>
      'તમારા શોધ અથવા ફિલ્ટર માપદંડ સમાયોજિત કરો';

  @override
  String get allLoanPDFs => 'બધી લોનનાં PDF';

  @override
  String get noLoanCompletionPDFs =>
      'કોઈ લોન પૂર્ણતા PDF મળ્યાં નથી\nલોન સારાંશમાંથી PDF જનરેટ કરો';

  @override
  String customer(Object name) {
    return 'ગ્રાહક: $name';
  }

  @override
  String idLabel(Object value) {
    return 'ID: $value';
  }

  @override
  String get save => 'સાચવો';

  @override
  String get share => 'શેર કરો';

  @override
  String get editPDF => 'PDF સંપાદિત કરો';

  @override
  String get failedToSavePDF =>
      'PDF સાચવવામાં નિષ્ફળ. કૃપા કરીને ફરી પ્રયાસ કરો.';

  @override
  String shareFailed(Object error) {
    return 'શેર કરવામાં નિષ્ફળ: $error';
  }

  @override
  String get storagePermissionRequired => 'સ્ટોરેજ પરવાનગી જરૂરી';

  @override
  String get storagePermissionMessage =>
      'આ એપ્લિકેશનને PDF ડાઉનલોડ ફોલ્ડરમાં સાચવવા માટે સ્ટોરેજ પરવાનગીની જરૂર છે. કૃપા કરીને સેટિંગ્સમાં તેને સક્ષમ કરો.';

  @override
  String get openSettings => 'સેટિંગ્સ ખોલો';

  @override
  String cannotEditInvalidFormat(Object filename) {
    return '\"$filename\" સંપાદિત કરી શકાતું નથી: અમાન્ય PDF ફાઇલનામ ફોર્મેટ';
  }

  @override
  String loanNotFoundCannotEdit(Object loanId) {
    return 'લોન $loanId મળી નથી. PDF સંપાદિત કરી શકાતું નથી.';
  }

  @override
  String navigationError(Object error) {
    return 'નેવિગેશન ભૂલ: $error';
  }

  @override
  String get pdfDeletedSuccessfully => 'PDF સફળતાપૂર્વક કાઢી નાખ્યું';

  @override
  String get fileRemovedFromStorage => 'ફાઇલ સ્ટોરેજમાંથી દૂર કરી';

  @override
  String get dismiss => 'રદ કરો';

  @override
  String get deletePDF => 'PDF કાઢી નાખવું?';

  @override
  String sureDeleteFilename(Object filename) {
    return 'શું તમે ખરેખર \"$filename\" કાઢી નાખવા માંગો છો?';
  }

  @override
  String failedToDelete(Object error) {
    return 'કાઢી નાખવામાં નિષ્ફળ: $error';
  }

  @override
  String get editCustomer => 'ગ્રાહક સંપાદિત કરો';

  @override
  String get personalInfo => 'વ્યક્તિગત માહિતી';

  @override
  String get contactInfo => 'સંપર્ક માહિતી';

  @override
  String get preferences => 'પસંદગીઓ';

  @override
  String get fullName => 'પૂરું નામ';

  @override
  String get nameRequired => 'નામ જરૂરી છે';

  @override
  String get mobileNumberOptional => 'મોબાઇલ નંબર';

  @override
  String get mobileRequired => 'મોબાઇલ જરૂરી છે';

  @override
  String get emailOptional => 'ઇમેઇલ (વૈકલ્પિક)';

  @override
  String get locationOptional => 'સ્થાન (વૈકલ્પિક)';

  @override
  String get receiveSMSNotifications =>
      'EMI ચુકવણીઓ માટે SMS સૂચનાઓ પ્રાપ્ત કરો';

  @override
  String get stayUpdatedOnPayments =>
      'લોન ચુકવણી અને રિમાઇન્ડર્સ વિશે અપડેટ રહો';

  @override
  String get updateCustomer => 'ગ્રાહક અપડેટ કરો';

  @override
  String get updating => 'અપડેટ થઈ રહ્યું છે...';

  @override
  String get customerUpdatedSuccessfully => 'ગ્રાહક સફળતાપૂર્વક અપડેટ થયો!';

  @override
  String get loanAmount => 'લોન રકમ';

  @override
  String get interestRate => 'વ્યાજ દર';

  @override
  String get interestType => 'વ્યાજ પ્રકાર';

  @override
  String get createLoanTitle => 'લોન બનાવો';

  @override
  String get searchCustomerByNameOrMobile => 'નામ અથવા મોબાઇલ નંબર દ્વારા શોધો';

  @override
  String get addFirstCustomer => 'પ્રથમ ગ્રાહક ઉમેરો';

  @override
  String get selectCustomer => 'ગ્રાહક પસંદ કરો';

  @override
  String get continueToOverview => 'ઝાંખી પર ચાલુ રાખો';

  @override
  String loanCreatedFor(Object name) {
    return '$name માટે લોન બનાવી';
  }

  @override
  String amountDate(Object amount, Object date) {
    return 'રકમ: ₹$amount • $date';
  }

  @override
  String get perMonth => '/મહિનો';

  @override
  String get welcomeToFinTech => 'ફિનટેકમાં આપનું સ્વાગત છે';

  @override
  String get yourTrustedPartner =>
      'લોન વ્યવસ્થાપન માટે તમારો વિશ્વસનીય ભાગીદાર';

  @override
  String get trackLoansEMI => 'સરળતાથી લોન અને EMI ટ્રૅક કરો';

  @override
  String get monitorLoanProgress =>
      'તમારી લોનની પ્રગતિ અને EMI શેડ્યૂલનું રીઅલ-ટાઇમમાં નિરીક્ષણ કરો';

  @override
  String get secureReliable => 'સુરક્ષિત અને વિશ્વસનીય';

  @override
  String get dataProtected => 'તમારો ડેટા ઉદ્યોગ-માનક સુરક્ષા સાથે સુરક્ષિત છે';

  @override
  String get secureReliableEfficient => 'સુરક્ષિત • વિશ્વસનીય • કાર્યક્ષમ';

  @override
  String get dashboard => 'ડેશબોર્ડ';

  @override
  String get customers => 'ગ્રાહકો';

  @override
  String get overview => 'ઝાંખી';

  @override
  String get darkMode => 'ડાર્ક મોડ';

  @override
  String get toggleBetweenThemes => 'લાઇટ અને ડાર્ક થીમ વચ્ચે ટૉગલ કરો';

  @override
  String get enableSMSNotifications => 'SMS સૂચનાઓ સક્ષમ કરો';

  @override
  String get sendSMSForEMI => 'EMI ચુકવણી અને રિમાઇન્ડર્સ માટે SMS મોકલો';

  @override
  String get myProfile => 'મારી પ્રોફાઇલ';

  @override
  String get permissionRequired => 'પરવાનગી જરૂરી';

  @override
  String get gallery => 'ગેલેરી';

  @override
  String get camera => 'કેમેરા';

  @override
  String get customerLedger => 'ગ્રાહક ખાતાવહી';

  @override
  String get searchByCustomerNameOrMobile =>
      'ગ્રાહકના નામ અથવા મોબાઇલ દ્વારા શોધો...';

  @override
  String get createYourFirstLoan => 'તમારી પ્રથમ લોન બનાવો';

  @override
  String get loanDataNotFound => 'લોન ડેટા મળ્યો નથી';

  @override
  String get pdfUpdatedSuccessfully => 'PDF સફળતાપૂર્વક અપડેટ થયું!';

  @override
  String errorUpdatingPDF(Object error) {
    return 'PDF અપડેટ કરવામાં ભૂલ: $error';
  }

  @override
  String get cannotSaveDataMissing =>
      'સાચવી શકાતું નથી: લોન અથવા ગ્રાહકનો ડેટા ખૂટે છે.';

  @override
  String get unknown => 'અજ્ઞાત';

  @override
  String get createLoanSubtitle => 'લોન વિગતો સેટ કરો અને EMI ગણતરી કરો';

  @override
  String get enterAmount => 'રકમ દાખલ કરો';

  @override
  String get requiredField => 'જરૂરી';

  @override
  String get invalidAmount => 'અમાન્ય રકમ';

  @override
  String get monthlyInterestRate => 'માસિક વ્યાજ દર (%)';

  @override
  String get exampleInterestRate => 'દા.ત., 1.0';

  @override
  String get invalidRate => 'અમાન્ય દર';

  @override
  String get tenureMonths => 'મુદત (મહિનાઓ)';

  @override
  String get exampleTenure => 'દા.ત., 12';

  @override
  String get invalidTenure => 'અમાન્ય મુદત';

  @override
  String get calculatedEmi => 'ગણતરી કરેલ EMI';

  @override
  String emiPerMonth(Object amount) {
    return '₹$amount પ્રતિ મહિનો';
  }

  @override
  String get noCustomersFound => 'કોઈ ગ્રાહક મળ્યા નથી';

  @override
  String get pleaseSelectCustomer => 'કૃપા કરીને ગ્રાહક પસંદ કરો';

  @override
  String get loanCreatedSuccessfullyTitle =>
      'લોન સફળતાપૂર્વક બનાવી! તમારી લોનની ઝાંખી જુઓ.';

  @override
  String get loanCreatedSuccessfullyMessage =>
      'તમારી લોન બનાવવામાં આવી છે. EMI ટ્રૅક કરવા માટે ઝાંખી પર ચાલુ રાખો.';

  @override
  String get simpleInterest => 'સાદું';

  @override
  String get compoundInterest => 'ચક્રવૃદ્ધિ';

  @override
  String get loanCompletionCertificate => 'લોન પૂર્ણતા પ્રમાણપત્ર';

  @override
  String get lenderDetails => 'ધિરાણકર્તાની વિગતો:';

  @override
  String get loanDetails => 'લોનની વિગતો:';

  @override
  String get emiPaymentSummary => 'EMI ચુકવણી સારાંશ:';

  @override
  String get payAllPendingEMI => 'બધી બાકી EMI ચૂકવો';

  @override
  String get allEmisPaid => 'અભિનંદન! બધી EMI સફળતાપૂર્વક ચૂકવી દેવાઈ છે.';

  @override
  String get certificateConfirmsCompletion =>
      'આ પ્રમાણપત્ર તમારી લોનની પૂર્ણતાની પુષ્ટિ કરે છે.';

  @override
  String generatedOn(Object date) {
    return '$date ના રોજ જનરેટ થયું';
  }

  @override
  String get dueDate => 'અંતિમ તારીખ';

  @override
  String get amount => 'રકમ';

  @override
  String get status => 'સ્થિતિ';

  @override
  String get simple => 'સાદું';

  @override
  String get compound => 'ચક્રવૃદ્ધિ';

  @override
  String get refreshData => 'ડેટા રીફ્રેશ કરો';

  @override
  String get loadingLoanData => 'લોન ડેટા લોડ થઈ રહ્યો છે...';

  @override
  String get enterPrincipalAmount => 'મુદ્દલ રકમ દાખલ કરો';

  @override
  String get annualInterestRate => 'વાર્ષિક વ્યાજ દર';

  @override
  String get loanDurationMonths => 'મહિનાઓમાં લોનની અવધિ';

  @override
  String get selectInterestTypeHint => 'વ્યાજ ગણતરીનો પ્રકાર પસંદ કરો';

  @override
  String get customerFullName => 'ગ્રાહકનું પૂરું નામ';

  @override
  String get tenDigitPhoneNumber => '10 અંકનો ફોન નંબર';

  @override
  String get forNotifications => 'સૂચનાઓ માટે';

  @override
  String get cityOrAddress => 'શહેર અથવા સરનામું';

  @override
  String get saveAndRegeneratePDF => 'સાચવો અને PDF પુનઃજનરેટ કરો';

  @override
  String get regeneratingPDF => 'PDF પુનઃજનરેટ થઈ રહ્યું છે...';

  @override
  String get customerDataNotFound => 'ગ્રાહકનો ડેટા મળ્યો નથી';

  @override
  String get editPDFDetails => 'PDF વિગતો સંપાદિત કરો';

  @override
  String get ledgerOutstanding => 'બાકી';

  @override
  String get ledgerCollected => 'એકત્રિત';

  @override
  String get ledgerStatusReceive => 'તમને મળશે';

  @override
  String get ledgerStatusPay => 'તમે આપશો';

  @override
  String get ledgerStatusSettled => 'સેટલ થઈ ગયું';

  @override
  String get recentTransactions => 'તાજેતરના વ્યવહારો';

  @override
  String moreTransactions(Object count) {
    return '+$count વધુ વ્યવહારો';
  }

  @override
  String get givenAmount => 'આપેલ';

  @override
  String get receivedAmount => 'પ્રાપ્ત';

  @override
  String get today => 'આજે';

  @override
  String get yesterday => 'ગઈકાલે';

  @override
  String get tomorrow => 'આવતીકાલે';

  @override
  String get noCustomersLedger => 'હજુ સુધી કોઈ ગ્રાહક નથી';

  @override
  String get ledgerEmptyMessage =>
      'તમારી ગ્રાહક ખાતાવહી જોવા માટે લોન બનાવીને શરૂ કરો. વ્યવહારો ટ્રૅક કરો અને તમારા વ્યવસાયને કાર્યક્ષમ રીતે સંચાલિત કરો.';

  @override
  String get createFirstLoanLedger => 'તમારી પ્રથમ લોન બનાવો';

  @override
  String get loanDisbursed => 'લોન વિતરિત કરી';

  @override
  String get emiPayment => 'EMI ચુકવણી';

  @override
  String get updateProfile => 'પ્રોફાઇલ અપડેટ કરો';

  @override
  String get saving => 'સાચવી રહ્યા છે...';

  @override
  String get logout => 'લૉગ આઉટ';

  @override
  String get appearance => 'દેખાવ';

  @override
  String get smsNotifications => 'SMS સૂચનાઓ';

  @override
  String get enableSmsNotifications => 'SMS સૂચનાઓ સક્ષમ કરો';

  @override
  String get darkModeToggleSubtitle => 'પ્રકાશ અને ઘાટા થીમ વચ્ચે ટૉગલ કરો';

  @override
  String get smsToggleSubtitle => 'EMI ચૂકવણી અને રિમાઇન્ડર માટે SMS મોકલો';

  @override
  String get loadingPDFs => 'PDF લોડ થઈ રહ્યા છે...';

  @override
  String get completeLoansWillGeneratePDFsHere =>
      'સંપૂર્ણ લોન અહીં PDF જનરેટ કરશે';

  @override
  String pdfCount(int count) {
    return '$count PDF';
  }

  @override
  String get tapPDFToShareViaWhatsApp =>
      'વોટ્સએપ પર શેર કરવા કોઈપણ PDF પર ટેપ કરો';

  @override
  String get saveToDownloads => 'ડાઉનલોડમાં સાચવો';

  @override
  String get shareViaWhatsApp => 'વોટ્સએપ દ્વારા શેર કરો';

  @override
  String get gotIt => 'સમજાયું';

  @override
  String get permanentlyDeleteWarning => 'આ કાયમી રીતે કાઢી નાખશે:';

  @override
  String get actionCannotBeUndone => 'આ ક્રિયા પૂર્વવત્ કરી શકાતી નથી.';

  @override
  String get retry => 'ફરી પ્રયાસ કરો';

  @override
  String get noLanguageMatch => 'તમારી શોધ સાથે મેળ ખાતી કોઈ ભાષા નથી';

  @override
  String get selected => 'પસંદ કરેલ';

  @override
  String get allow => 'પરવાનગી આપો';

  @override
  String get logoutConfirmation => 'શું તમે ખરેખર લોગઆઉટ કરવા માંગો છો?';

  @override
  String get loanManagementProfessional => 'લોન મેનેજમેન્ટ પ્રોફેશનલ';

  @override
  String get accountDetails => 'એકાઉન્ટ વિગતો';
}
