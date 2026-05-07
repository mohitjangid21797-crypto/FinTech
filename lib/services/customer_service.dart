import '../models/customer.dart';
import 'data_storage_service.dart';

class CustomerService {
  // In a real app, this would interact with a database or API
  static List<Customer> _customers = [];

  static Future<void> init() async {
    _customers = await DataStorageService.loadListFromJson(
      'customers.json',
      Customer.fromJson,
    );
  }

  /// Force reload data from storage - fixes stale data issue
  static Future<void> reloadData() async {
    await init();
  }

  Future<bool> _save() async {
    return await DataStorageService.saveListToJson(
      'customers.json',
      _customers,
      (customer) => customer.toJson(),
    );
  }

  // Add a new customer
  Future<void> addCustomer(Customer customer) async {
    _customers.add(customer);
    await _save();
  }

  Future<void> updateCustomer(String id, Customer updatedCustomer) async {
    final index = _customers.indexWhere((customer) => customer.id == id);
    if (index != -1) {
      _customers[index] = updatedCustomer;
      await _save();
    }
  }

  Future<void> deleteCustomer(String id) async {
    _customers.removeWhere((customer) => customer.id == id);
    await _save();
  }

  // Get all customers
  List<Customer> getCustomers() {
    return _customers;
  }

  // Get a customer by ID
  Customer? getCustomerById(String id) {
    try {
      return _customers.firstWhere((customer) => customer.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get a customer by mobile number
  Customer? getCustomerByMobile(String mobile) {
    try {
      return _customers.firstWhere((customer) => customer.mobile == mobile);
    } catch (e) {
      return null;
    }
  }
}
