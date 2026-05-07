import 'loan_service.dart';
import 'customer_service.dart';

/// Universal service reload helper - fixes stale data across all services
class AppServices {
  /// Reload ALL services from storage (call before critical operations)
  static Future<void> reloadAll() async {
    await LoanService.reloadData();
    await CustomerService.reloadData();
  }

  /// App bootstrap - init all services
  static Future<void> initAll() async {
    await LoanService.init();
    await CustomerService.init();
  }
}
