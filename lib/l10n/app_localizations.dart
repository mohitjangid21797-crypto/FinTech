import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_as.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_ne.dart';
import 'app_localizations_or.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('as'),
    Locale('bn'),
    Locale('en'),
    Locale('gu'),
    Locale('hi'),
    Locale('kn'),
    Locale('ml'),
    Locale('mr'),
    Locale('ne'),
    Locale('or'),
    Locale('pa'),
    Locale('ta'),
    Locale('te'),
    Locale('ur'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Loan Manager'**
  String get appTitle;

  /// No description provided for @dashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboardTitle;

  /// No description provided for @keyMetrics.
  ///
  /// In en, this message translates to:
  /// **'Key Metrics'**
  String get keyMetrics;

  /// No description provided for @totalLoans.
  ///
  /// In en, this message translates to:
  /// **'Total Loans'**
  String get totalLoans;

  /// No description provided for @activeLoans.
  ///
  /// In en, this message translates to:
  /// **'Active Loans'**
  String get activeLoans;

  /// No description provided for @totalCustomers.
  ///
  /// In en, this message translates to:
  /// **'Total Customers'**
  String get totalCustomers;

  /// No description provided for @pendingEMIs.
  ///
  /// In en, this message translates to:
  /// **'Pending EMIs'**
  String get pendingEMIs;

  /// No description provided for @totalLoanAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Loan Amount'**
  String get totalLoanAmount;

  /// No description provided for @totalProfit.
  ///
  /// In en, this message translates to:
  /// **'Total Profit'**
  String get totalProfit;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get quickActions;

  /// No description provided for @addCustomer.
  ///
  /// In en, this message translates to:
  /// **'Add Customer'**
  String get addCustomer;

  /// No description provided for @createLoan.
  ///
  /// In en, this message translates to:
  /// **'Create Loan'**
  String get createLoan;

  /// No description provided for @emiLedger.
  ///
  /// In en, this message translates to:
  /// **'EMI Ledger'**
  String get emiLedger;

  /// No description provided for @pdfDocuments.
  ///
  /// In en, this message translates to:
  /// **'PDF Documents'**
  String get pdfDocuments;

  /// No description provided for @recentActivity.
  ///
  /// In en, this message translates to:
  /// **'Recent Activity'**
  String get recentActivity;

  /// No description provided for @noRecentActivity.
  ///
  /// In en, this message translates to:
  /// **'No recent activity'**
  String get noRecentActivity;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @userProfile.
  ///
  /// In en, this message translates to:
  /// **'User Profile'**
  String get userProfile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @languages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get languages;

  /// No description provided for @helloUser.
  ///
  /// In en, this message translates to:
  /// **'Hello, {user}!'**
  String helloUser(Object user);

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back to your dashboard 👋'**
  String get welcomeBack;

  /// No description provided for @exitAppTitle.
  ///
  /// In en, this message translates to:
  /// **'Exit App'**
  String get exitAppTitle;

  /// No description provided for @exitAppMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to exit the app?'**
  String get exitAppMessage;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @exit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exit;

  /// No description provided for @languageSelected.
  ///
  /// In en, this message translates to:
  /// **'{language} language selected'**
  String languageSelected(Object language);

  /// No description provided for @finTech.
  ///
  /// In en, this message translates to:
  /// **'FinTech'**
  String get finTech;

  /// No description provided for @secureLogin.
  ///
  /// In en, this message translates to:
  /// **'Secure Login'**
  String get secureLogin;

  /// No description provided for @mobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobileNumber;

  /// No description provided for @enterMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your mobile number'**
  String get enterMobileNumber;

  /// No description provided for @pleaseEnterMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter your mobile number'**
  String get pleaseEnterMobileNumber;

  /// No description provided for @enterValidMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid 10-digit mobile number'**
  String get enterValidMobileNumber;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterName;

  /// No description provided for @pleaseEnterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get pleaseEnterName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterEmail;

  /// No description provided for @pleaseEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get pleaseEnterEmail;

  /// No description provided for @enterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address'**
  String get enterValidEmail;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @enterLocation.
  ///
  /// In en, this message translates to:
  /// **'Enter your location'**
  String get enterLocation;

  /// No description provided for @pleaseEnterLocation.
  ///
  /// In en, this message translates to:
  /// **'Please enter your location'**
  String get pleaseEnterLocation;

  /// No description provided for @mPin.
  ///
  /// In en, this message translates to:
  /// **'M-PIN'**
  String get mPin;

  /// No description provided for @enterMPin.
  ///
  /// In en, this message translates to:
  /// **'Enter your M-PIN'**
  String get enterMPin;

  /// No description provided for @pleaseEnterMPin.
  ///
  /// In en, this message translates to:
  /// **'Please enter your M-PIN'**
  String get pleaseEnterMPin;

  /// No description provided for @mPinMustBe4To6Digits.
  ///
  /// In en, this message translates to:
  /// **'M-PIN must be 4-6 digits'**
  String get mPinMustBe4To6Digits;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @congratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get congratulations;

  /// No description provided for @loggedInSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'You have logged in successfully'**
  String get loggedInSuccessfully;

  /// No description provided for @allCustomers.
  ///
  /// In en, this message translates to:
  /// **'All Customers'**
  String get allCustomers;

  /// No description provided for @searchCustomers.
  ///
  /// In en, this message translates to:
  /// **'Search customers...'**
  String get searchCustomers;

  /// No description provided for @noCustomersYet.
  ///
  /// In en, this message translates to:
  /// **'No Customers Yet'**
  String get noCustomersYet;

  /// No description provided for @startBuildingCustomerDatabase.
  ///
  /// In en, this message translates to:
  /// **'Start building your customer database by adding your first customer.'**
  String get startBuildingCustomerDatabase;

  /// No description provided for @addYourFirstCustomer.
  ///
  /// In en, this message translates to:
  /// **'Add Your First Customer'**
  String get addYourFirstCustomer;

  /// No description provided for @noResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No Results Found'**
  String get noResultsFound;

  /// No description provided for @tryAdjustingSearchTerms.
  ///
  /// In en, this message translates to:
  /// **'Try adjusting your search terms or check the spelling.'**
  String get tryAdjustingSearchTerms;

  /// No description provided for @deleteCustomer.
  ///
  /// In en, this message translates to:
  /// **'Delete Customer'**
  String get deleteCustomer;

  /// No description provided for @areYouSureDeleteCustomer.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {name}? This action cannot be undone.'**
  String areYouSureDeleteCustomer(Object name);

  /// No description provided for @customerDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'{name} deleted successfully'**
  String customerDeletedSuccessfully(Object name);

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @addCustomerTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Customer'**
  String get addCustomerTitle;

  /// No description provided for @customerDetails.
  ///
  /// In en, this message translates to:
  /// **'Customer Details'**
  String get customerDetails;

  /// No description provided for @mobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get mobile;

  /// No description provided for @pleaseEnterMobile.
  ///
  /// In en, this message translates to:
  /// **'Please enter a mobile number'**
  String get pleaseEnterMobile;

  /// No description provided for @pleaseEnterEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Please enter an email'**
  String get pleaseEnterEmailAddress;

  /// No description provided for @smsConsent.
  ///
  /// In en, this message translates to:
  /// **'I consent to receive SMS notifications for EMI payments'**
  String get smsConsent;

  /// No description provided for @customerAdded.
  ///
  /// In en, this message translates to:
  /// **'Customer Added!'**
  String get customerAdded;

  /// No description provided for @customerAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Customer added successfully\nReady for loan creation!'**
  String get customerAddedSuccessfully;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @pleaseFillAllRequiredFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill all required fields'**
  String get pleaseFillAllRequiredFields;

  /// No description provided for @overviewLoans.
  ///
  /// In en, this message translates to:
  /// **'Overview Loans'**
  String get overviewLoans;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @searchByCustomerMobile.
  ///
  /// In en, this message translates to:
  /// **'Search by Customer Mobile Number'**
  String get searchByCustomerMobile;

  /// No description provided for @noActiveLoans.
  ///
  /// In en, this message translates to:
  /// **'No active loans'**
  String get noActiveLoans;

  /// No description provided for @noCompletedLoans.
  ///
  /// In en, this message translates to:
  /// **'No completed loans'**
  String get noCompletedLoans;

  /// No description provided for @noPendingLoans.
  ///
  /// In en, this message translates to:
  /// **'No pending loans'**
  String get noPendingLoans;

  /// No description provided for @allEMIsPaidSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'All EMIs are paid successfully'**
  String get allEMIsPaidSuccessfully;

  /// No description provided for @moveToPDFDocuments.
  ///
  /// In en, this message translates to:
  /// **'Do you want to move to PDF Documents to see its PDF?'**
  String get moveToPDFDocuments;

  /// No description provided for @later.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get later;

  /// No description provided for @viewPDF.
  ///
  /// In en, this message translates to:
  /// **'View PDF'**
  String get viewPDF;

  /// No description provided for @loanEMIDetails.
  ///
  /// In en, this message translates to:
  /// **'Loan EMI Details'**
  String get loanEMIDetails;

  /// No description provided for @loanID.
  ///
  /// In en, this message translates to:
  /// **'Loan ID: {id}...'**
  String loanID(Object id);

  /// No description provided for @principal.
  ///
  /// In en, this message translates to:
  /// **'Principal'**
  String get principal;

  /// No description provided for @emiLabel.
  ///
  /// In en, this message translates to:
  /// **'EMI'**
  String get emiLabel;

  /// No description provided for @rate.
  ///
  /// In en, this message translates to:
  /// **'Rate'**
  String get rate;

  /// No description provided for @tenure.
  ///
  /// In en, this message translates to:
  /// **'Tenure'**
  String get tenure;

  /// No description provided for @months.
  ///
  /// In en, this message translates to:
  /// **'months'**
  String get months;

  /// No description provided for @markAsPaid.
  ///
  /// In en, this message translates to:
  /// **'Mark as Paid'**
  String get markAsPaid;

  /// No description provided for @paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paid;

  /// No description provided for @markAllEMIsPaid.
  ///
  /// In en, this message translates to:
  /// **'Mark All EMIs Paid'**
  String get markAllEMIsPaid;

  /// No description provided for @markAllPendingEMIsAsPaid.
  ///
  /// In en, this message translates to:
  /// **'Mark All {count} Pending EMIs as Paid'**
  String markAllPendingEMIsAsPaid(Object count);

  /// No description provided for @markAllEMIsPaidConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure? This will mark all {count} pending EMIs as paid and regenerate the completion PDF.'**
  String markAllEMIsPaidConfirm(Object count);

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @allEMIsMarkedAsPaid.
  ///
  /// In en, this message translates to:
  /// **'All {count} EMIs marked as paid! PDF regenerated.'**
  String allEMIsMarkedAsPaid(Object count);

  /// No description provided for @loanCompletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Loan completed successfully! PDF has been auto-generated and is available in PDF Documents.'**
  String get loanCompletedSuccessfully;

  /// No description provided for @emiMarkedAsPaid.
  ///
  /// In en, this message translates to:
  /// **'EMI marked as paid successfully!'**
  String get emiMarkedAsPaid;

  /// No description provided for @unknownCustomer.
  ///
  /// In en, this message translates to:
  /// **'Unknown Customer'**
  String get unknownCustomer;

  /// No description provided for @due.
  ///
  /// In en, this message translates to:
  /// **'Due: {date}'**
  String due(Object date);

  /// No description provided for @emiSchedule.
  ///
  /// In en, this message translates to:
  /// **'EMI Schedule'**
  String get emiSchedule;

  /// No description provided for @searchCustomer.
  ///
  /// In en, this message translates to:
  /// **'Search Customer'**
  String get searchCustomer;

  /// No description provided for @searchByNameOrMobile.
  ///
  /// In en, this message translates to:
  /// **'Search by name or mobile number'**
  String get searchByNameOrMobile;

  /// No description provided for @filterByCustomer.
  ///
  /// In en, this message translates to:
  /// **'Filter by Customer (Optional)'**
  String get filterByCustomer;

  /// No description provided for @allCustomersLabel.
  ///
  /// In en, this message translates to:
  /// **'All Customers'**
  String get allCustomersLabel;

  /// No description provided for @noEMISchedulesFound.
  ///
  /// In en, this message translates to:
  /// **'No EMI schedules found'**
  String get noEMISchedulesFound;

  /// No description provided for @tryAdjustingSearchFilter.
  ///
  /// In en, this message translates to:
  /// **'Try adjusting your search or filter criteria'**
  String get tryAdjustingSearchFilter;

  /// No description provided for @allLoanPDFs.
  ///
  /// In en, this message translates to:
  /// **'All Loan PDFs'**
  String get allLoanPDFs;

  /// No description provided for @noLoanCompletionPDFs.
  ///
  /// In en, this message translates to:
  /// **'No loan completion PDFs found\nGenerate PDFs from loan summaries'**
  String get noLoanCompletionPDFs;

  /// No description provided for @customer.
  ///
  /// In en, this message translates to:
  /// **'Customer: {name}'**
  String customer(Object name);

  /// No description provided for @idLabel.
  ///
  /// In en, this message translates to:
  /// **'ID: {value}'**
  String idLabel(Object value);

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @editPDF.
  ///
  /// In en, this message translates to:
  /// **'Edit PDF'**
  String get editPDF;

  /// No description provided for @failedToSavePDF.
  ///
  /// In en, this message translates to:
  /// **'Failed to save PDF. Please try again.'**
  String get failedToSavePDF;

  /// No description provided for @shareFailed.
  ///
  /// In en, this message translates to:
  /// **'Share failed: {error}'**
  String shareFailed(Object error);

  /// No description provided for @storagePermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Storage Permission Required'**
  String get storagePermissionRequired;

  /// No description provided for @storagePermissionMessage.
  ///
  /// In en, this message translates to:
  /// **'This app needs storage permission to save PDFs to Downloads. Please enable it in Settings.'**
  String get storagePermissionMessage;

  /// No description provided for @openSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get openSettings;

  /// No description provided for @cannotEditInvalidFormat.
  ///
  /// In en, this message translates to:
  /// **'Cannot edit \"{filename}\": Invalid PDF filename format'**
  String cannotEditInvalidFormat(Object filename);

  /// No description provided for @loanNotFoundCannotEdit.
  ///
  /// In en, this message translates to:
  /// **'Loan {loanId} not found. Cannot edit PDF.'**
  String loanNotFoundCannotEdit(Object loanId);

  /// No description provided for @navigationError.
  ///
  /// In en, this message translates to:
  /// **'Navigation error: {error}'**
  String navigationError(Object error);

  /// No description provided for @pdfDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'PDF deleted Successfully'**
  String get pdfDeletedSuccessfully;

  /// No description provided for @fileRemovedFromStorage.
  ///
  /// In en, this message translates to:
  /// **'File removed from storage'**
  String get fileRemovedFromStorage;

  /// No description provided for @dismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get dismiss;

  /// No description provided for @deletePDF.
  ///
  /// In en, this message translates to:
  /// **'Delete PDF?'**
  String get deletePDF;

  /// No description provided for @sureDeleteFilename.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{filename}\"?'**
  String sureDeleteFilename(Object filename);

  /// No description provided for @failedToDelete.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete: {error}'**
  String failedToDelete(Object error);

  /// No description provided for @editCustomer.
  ///
  /// In en, this message translates to:
  /// **'Edit Customer'**
  String get editCustomer;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Info'**
  String get personalInfo;

  /// No description provided for @contactInfo.
  ///
  /// In en, this message translates to:
  /// **'Contact Info'**
  String get contactInfo;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get nameRequired;

  /// No description provided for @mobileNumberOptional.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobileNumberOptional;

  /// No description provided for @mobileRequired.
  ///
  /// In en, this message translates to:
  /// **'Mobile is required'**
  String get mobileRequired;

  /// No description provided for @emailOptional.
  ///
  /// In en, this message translates to:
  /// **'Email (optional)'**
  String get emailOptional;

  /// No description provided for @locationOptional.
  ///
  /// In en, this message translates to:
  /// **'Location (optional)'**
  String get locationOptional;

  /// No description provided for @receiveSMSNotifications.
  ///
  /// In en, this message translates to:
  /// **'Receive SMS notifications for EMI payments'**
  String get receiveSMSNotifications;

  /// No description provided for @stayUpdatedOnPayments.
  ///
  /// In en, this message translates to:
  /// **'Stay updated on loan payments and reminders'**
  String get stayUpdatedOnPayments;

  /// No description provided for @updateCustomer.
  ///
  /// In en, this message translates to:
  /// **'Update Customer'**
  String get updateCustomer;

  /// No description provided for @updating.
  ///
  /// In en, this message translates to:
  /// **'Updating...'**
  String get updating;

  /// No description provided for @customerUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Customer updated successfully!'**
  String get customerUpdatedSuccessfully;

  /// No description provided for @loanAmount.
  ///
  /// In en, this message translates to:
  /// **'Loan Amount'**
  String get loanAmount;

  /// No description provided for @interestRate.
  ///
  /// In en, this message translates to:
  /// **'Interest Rate'**
  String get interestRate;

  /// No description provided for @interestType.
  ///
  /// In en, this message translates to:
  /// **'Interest Type'**
  String get interestType;

  /// No description provided for @createLoanTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Loan'**
  String get createLoanTitle;

  /// No description provided for @searchCustomerByNameOrMobile.
  ///
  /// In en, this message translates to:
  /// **'Search by name or mobile number'**
  String get searchCustomerByNameOrMobile;

  /// No description provided for @addFirstCustomer.
  ///
  /// In en, this message translates to:
  /// **'Add First Customer'**
  String get addFirstCustomer;

  /// No description provided for @selectCustomer.
  ///
  /// In en, this message translates to:
  /// **'Select Customer'**
  String get selectCustomer;

  /// Button label to continue from customer selection to the overview step
  ///
  /// In en, this message translates to:
  /// **'Continue to Overview'**
  String get continueToOverview;

  /// No description provided for @loanCreatedFor.
  ///
  /// In en, this message translates to:
  /// **'Loan created for {name}'**
  String loanCreatedFor(Object name);

  /// No description provided for @amountDate.
  ///
  /// In en, this message translates to:
  /// **'Amount: ₹{amount} • {date}'**
  String amountDate(Object amount, Object date);

  /// No description provided for @perMonth.
  ///
  /// In en, this message translates to:
  /// **'/month'**
  String get perMonth;

  /// No description provided for @welcomeToFinTech.
  ///
  /// In en, this message translates to:
  /// **'Welcome to FinTech'**
  String get welcomeToFinTech;

  /// No description provided for @yourTrustedPartner.
  ///
  /// In en, this message translates to:
  /// **'Your trusted partner for loan management'**
  String get yourTrustedPartner;

  /// No description provided for @trackLoansEMI.
  ///
  /// In en, this message translates to:
  /// **'Track Loans & EMI Easily'**
  String get trackLoansEMI;

  /// No description provided for @monitorLoanProgress.
  ///
  /// In en, this message translates to:
  /// **'Monitor your loan progress and EMI schedules in real-time'**
  String get monitorLoanProgress;

  /// No description provided for @secureReliable.
  ///
  /// In en, this message translates to:
  /// **'Secure & Reliable'**
  String get secureReliable;

  /// No description provided for @dataProtected.
  ///
  /// In en, this message translates to:
  /// **'Your data is protected with industry-standard security'**
  String get dataProtected;

  /// No description provided for @secureReliableEfficient.
  ///
  /// In en, this message translates to:
  /// **'Secure • Reliable • Efficient'**
  String get secureReliableEfficient;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @customers.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customers;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @toggleBetweenThemes.
  ///
  /// In en, this message translates to:
  /// **'Toggle between light and dark theme'**
  String get toggleBetweenThemes;

  /// No description provided for @enableSMSNotifications.
  ///
  /// In en, this message translates to:
  /// **'Enable SMS Notifications'**
  String get enableSMSNotifications;

  /// No description provided for @sendSMSForEMI.
  ///
  /// In en, this message translates to:
  /// **'Send SMS for EMI payments and reminders'**
  String get sendSMSForEMI;

  /// No description provided for @myProfile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get myProfile;

  /// No description provided for @permissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Permission Required'**
  String get permissionRequired;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @customerLedger.
  ///
  /// In en, this message translates to:
  /// **'Customer Ledger'**
  String get customerLedger;

  /// No description provided for @searchByCustomerNameOrMobile.
  ///
  /// In en, this message translates to:
  /// **'Search by customer name or mobile...'**
  String get searchByCustomerNameOrMobile;

  /// No description provided for @createYourFirstLoan.
  ///
  /// In en, this message translates to:
  /// **'Create Your First Loan'**
  String get createYourFirstLoan;

  /// No description provided for @loanDataNotFound.
  ///
  /// In en, this message translates to:
  /// **'Loan data not found'**
  String get loanDataNotFound;

  /// No description provided for @pdfUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'PDF updated successfully!'**
  String get pdfUpdatedSuccessfully;

  /// No description provided for @errorUpdatingPDF.
  ///
  /// In en, this message translates to:
  /// **'Error updating PDF: {error}'**
  String errorUpdatingPDF(Object error);

  /// No description provided for @cannotSaveDataMissing.
  ///
  /// In en, this message translates to:
  /// **'Cannot save: Loan or customer data missing.'**
  String get cannotSaveDataMissing;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @createLoanSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Set up loan details and calculate EMI'**
  String get createLoanSubtitle;

  /// No description provided for @enterAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter amount'**
  String get enterAmount;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get requiredField;

  /// No description provided for @invalidAmount.
  ///
  /// In en, this message translates to:
  /// **'Invalid amount'**
  String get invalidAmount;

  /// No description provided for @monthlyInterestRate.
  ///
  /// In en, this message translates to:
  /// **'Monthly Interest Rate (%)'**
  String get monthlyInterestRate;

  /// No description provided for @exampleInterestRate.
  ///
  /// In en, this message translates to:
  /// **'e.g., 1.0'**
  String get exampleInterestRate;

  /// No description provided for @invalidRate.
  ///
  /// In en, this message translates to:
  /// **'Invalid rate'**
  String get invalidRate;

  /// No description provided for @tenureMonths.
  ///
  /// In en, this message translates to:
  /// **'Tenure (Months)'**
  String get tenureMonths;

  /// No description provided for @exampleTenure.
  ///
  /// In en, this message translates to:
  /// **'e.g., 12'**
  String get exampleTenure;

  /// No description provided for @invalidTenure.
  ///
  /// In en, this message translates to:
  /// **'Invalid tenure'**
  String get invalidTenure;

  /// No description provided for @calculatedEmi.
  ///
  /// In en, this message translates to:
  /// **'Calculated EMI'**
  String get calculatedEmi;

  /// No description provided for @emiPerMonth.
  ///
  /// In en, this message translates to:
  /// **'₹{amount} per month'**
  String emiPerMonth(Object amount);

  /// No description provided for @noCustomersFound.
  ///
  /// In en, this message translates to:
  /// **'No customers found'**
  String get noCustomersFound;

  /// No description provided for @pleaseSelectCustomer.
  ///
  /// In en, this message translates to:
  /// **'Please select a customer'**
  String get pleaseSelectCustomer;

  /// No description provided for @loanCreatedSuccessfullyTitle.
  ///
  /// In en, this message translates to:
  /// **'Loan Created Successfully! View your loans overview.'**
  String get loanCreatedSuccessfullyTitle;

  /// No description provided for @loanCreatedSuccessfullyMessage.
  ///
  /// In en, this message translates to:
  /// **'Your loan has been created. Continue to overview to track EMIs.'**
  String get loanCreatedSuccessfullyMessage;

  /// No description provided for @simpleInterest.
  ///
  /// In en, this message translates to:
  /// **'Simple'**
  String get simpleInterest;

  /// No description provided for @compoundInterest.
  ///
  /// In en, this message translates to:
  /// **'Compound'**
  String get compoundInterest;

  /// No description provided for @loanCompletionCertificate.
  ///
  /// In en, this message translates to:
  /// **'Loan Completion Certificate'**
  String get loanCompletionCertificate;

  /// No description provided for @lenderDetails.
  ///
  /// In en, this message translates to:
  /// **'Lender Details:'**
  String get lenderDetails;

  /// No description provided for @loanDetails.
  ///
  /// In en, this message translates to:
  /// **'Loan Details:'**
  String get loanDetails;

  /// No description provided for @emiPaymentSummary.
  ///
  /// In en, this message translates to:
  /// **'EMI Payment Summary:'**
  String get emiPaymentSummary;

  /// No description provided for @payAllPendingEMI.
  ///
  /// In en, this message translates to:
  /// **'Pay All Pending EMI'**
  String get payAllPendingEMI;

  /// No description provided for @allEmisPaid.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! All EMIs have been successfully paid.'**
  String get allEmisPaid;

  /// No description provided for @certificateConfirmsCompletion.
  ///
  /// In en, this message translates to:
  /// **'This certificate confirms the completion of your loan.'**
  String get certificateConfirmsCompletion;

  /// No description provided for @generatedOn.
  ///
  /// In en, this message translates to:
  /// **'Generated on {date}'**
  String generatedOn(Object date);

  /// No description provided for @dueDate.
  ///
  /// In en, this message translates to:
  /// **'Due Date'**
  String get dueDate;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @simple.
  ///
  /// In en, this message translates to:
  /// **'Simple'**
  String get simple;

  /// No description provided for @compound.
  ///
  /// In en, this message translates to:
  /// **'Compound'**
  String get compound;

  /// No description provided for @refreshData.
  ///
  /// In en, this message translates to:
  /// **'Refresh Data'**
  String get refreshData;

  /// No description provided for @loadingLoanData.
  ///
  /// In en, this message translates to:
  /// **'Loading loan data...'**
  String get loadingLoanData;

  /// No description provided for @enterPrincipalAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter principal amount'**
  String get enterPrincipalAmount;

  /// No description provided for @annualInterestRate.
  ///
  /// In en, this message translates to:
  /// **'Annual interest rate'**
  String get annualInterestRate;

  /// No description provided for @loanDurationMonths.
  ///
  /// In en, this message translates to:
  /// **'Loan duration in months'**
  String get loanDurationMonths;

  /// No description provided for @selectInterestTypeHint.
  ///
  /// In en, this message translates to:
  /// **'Select interest calculation type'**
  String get selectInterestTypeHint;

  /// No description provided for @customerFullName.
  ///
  /// In en, this message translates to:
  /// **'Customer full name'**
  String get customerFullName;

  /// No description provided for @tenDigitPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'10 digit phone number'**
  String get tenDigitPhoneNumber;

  /// No description provided for @forNotifications.
  ///
  /// In en, this message translates to:
  /// **'For notifications'**
  String get forNotifications;

  /// No description provided for @cityOrAddress.
  ///
  /// In en, this message translates to:
  /// **'City or address'**
  String get cityOrAddress;

  /// No description provided for @saveAndRegeneratePDF.
  ///
  /// In en, this message translates to:
  /// **'Save & Regenerate PDF'**
  String get saveAndRegeneratePDF;

  /// No description provided for @regeneratingPDF.
  ///
  /// In en, this message translates to:
  /// **'Regenerating PDF...'**
  String get regeneratingPDF;

  /// No description provided for @customerDataNotFound.
  ///
  /// In en, this message translates to:
  /// **'Customer data not found'**
  String get customerDataNotFound;

  /// No description provided for @editPDFDetails.
  ///
  /// In en, this message translates to:
  /// **'Edit PDF Details'**
  String get editPDFDetails;

  /// No description provided for @ledgerOutstanding.
  ///
  /// In en, this message translates to:
  /// **'Outstanding'**
  String get ledgerOutstanding;

  /// No description provided for @ledgerCollected.
  ///
  /// In en, this message translates to:
  /// **'Collected'**
  String get ledgerCollected;

  /// No description provided for @ledgerStatusReceive.
  ///
  /// In en, this message translates to:
  /// **'You will get'**
  String get ledgerStatusReceive;

  /// No description provided for @ledgerStatusPay.
  ///
  /// In en, this message translates to:
  /// **'You will give'**
  String get ledgerStatusPay;

  /// No description provided for @ledgerStatusSettled.
  ///
  /// In en, this message translates to:
  /// **'Settled'**
  String get ledgerStatusSettled;

  /// No description provided for @recentTransactions.
  ///
  /// In en, this message translates to:
  /// **'Recent Transactions'**
  String get recentTransactions;

  /// No description provided for @moreTransactions.
  ///
  /// In en, this message translates to:
  /// **'+{count} more transactions'**
  String moreTransactions(Object count);

  /// No description provided for @givenAmount.
  ///
  /// In en, this message translates to:
  /// **'Given'**
  String get givenAmount;

  /// No description provided for @receivedAmount.
  ///
  /// In en, this message translates to:
  /// **'Received'**
  String get receivedAmount;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @tomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get tomorrow;

  /// No description provided for @noCustomersLedger.
  ///
  /// In en, this message translates to:
  /// **'No Customers Yet'**
  String get noCustomersLedger;

  /// No description provided for @ledgerEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Start by creating loans to see your customer ledger. Track transactions and manage your business efficiently.'**
  String get ledgerEmptyMessage;

  /// No description provided for @createFirstLoanLedger.
  ///
  /// In en, this message translates to:
  /// **'Create Your First Loan'**
  String get createFirstLoanLedger;

  /// No description provided for @loanDisbursed.
  ///
  /// In en, this message translates to:
  /// **'Loan Disbursed'**
  String get loanDisbursed;

  /// No description provided for @emiPayment.
  ///
  /// In en, this message translates to:
  /// **'EMI Payment'**
  String get emiPayment;

  /// No description provided for @updateProfile.
  ///
  /// In en, this message translates to:
  /// **'Update Profile'**
  String get updateProfile;

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get saving;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @smsNotifications.
  ///
  /// In en, this message translates to:
  /// **'SMS Notifications'**
  String get smsNotifications;

  /// No description provided for @enableSmsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Enable SMS Notifications'**
  String get enableSmsNotifications;

  /// No description provided for @darkModeToggleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Toggle between light and dark theme'**
  String get darkModeToggleSubtitle;

  /// No description provided for @smsToggleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Send SMS for EMI payments and reminders'**
  String get smsToggleSubtitle;

  /// No description provided for @loadingPDFs.
  ///
  /// In en, this message translates to:
  /// **'Loading PDFs...'**
  String get loadingPDFs;

  /// No description provided for @completeLoansWillGeneratePDFsHere.
  ///
  /// In en, this message translates to:
  /// **'Complete loans will generate PDFs here'**
  String get completeLoansWillGeneratePDFsHere;

  /// No description provided for @pdfCount.
  ///
  /// In en, this message translates to:
  /// **'{count} PDFs'**
  String pdfCount(int count);

  /// No description provided for @tapPDFToShareViaWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'Tap any PDF to share via WhatsApp'**
  String get tapPDFToShareViaWhatsApp;

  /// No description provided for @saveToDownloads.
  ///
  /// In en, this message translates to:
  /// **'Save to Downloads'**
  String get saveToDownloads;

  /// No description provided for @shareViaWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'Share via WhatsApp'**
  String get shareViaWhatsApp;

  /// No description provided for @gotIt.
  ///
  /// In en, this message translates to:
  /// **'Got it!'**
  String get gotIt;

  /// No description provided for @permanentlyDeleteWarning.
  ///
  /// In en, this message translates to:
  /// **'This will permanently delete:'**
  String get permanentlyDeleteWarning;

  /// No description provided for @actionCannotBeUndone.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone.'**
  String get actionCannotBeUndone;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @noLanguageMatch.
  ///
  /// In en, this message translates to:
  /// **'No language matches your search'**
  String get noLanguageMatch;

  /// No description provided for @selected.
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get selected;

  /// No description provided for @allow.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get allow;

  /// No description provided for @logoutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logoutConfirmation;

  /// No description provided for @loanManagementProfessional.
  ///
  /// In en, this message translates to:
  /// **'Loan Management Professional'**
  String get loanManagementProfessional;

  /// No description provided for @accountDetails.
  ///
  /// In en, this message translates to:
  /// **'Account Details'**
  String get accountDetails;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'as',
    'bn',
    'en',
    'gu',
    'hi',
    'kn',
    'ml',
    'mr',
    'ne',
    'or',
    'pa',
    'ta',
    'te',
    'ur',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'as':
      return AppLocalizationsAs();
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
    case 'gu':
      return AppLocalizationsGu();
    case 'hi':
      return AppLocalizationsHi();
    case 'kn':
      return AppLocalizationsKn();
    case 'ml':
      return AppLocalizationsMl();
    case 'mr':
      return AppLocalizationsMr();
    case 'ne':
      return AppLocalizationsNe();
    case 'or':
      return AppLocalizationsOr();
    case 'pa':
      return AppLocalizationsPa();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
