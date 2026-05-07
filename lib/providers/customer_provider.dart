import 'package:flutter/foundation.dart';
import '../models/customer.dart';
import '../services/customer_service.dart';

class CustomerProvider with ChangeNotifier {
  final CustomerService _customerService = CustomerService();
  List<Customer> _customers = [];

  List<Customer> get customers => _customers;

  CustomerProvider() {
    loadCustomers();
  }

  void loadCustomers() {
    _customers = _customerService.getCustomers();
    notifyListeners();
  }

  void addCustomer(Customer customer) {
    _customerService.addCustomer(customer);
    loadCustomers();
  }

  void updateCustomer(String id, Customer updatedCustomer) {
    _customerService.updateCustomer(id, updatedCustomer);
    loadCustomers();
  }

  void deleteCustomer(String id) {
    _customerService.deleteCustomer(id);
    loadCustomers();
  }

  Customer? getCustomerById(String id) {
    return _customerService.getCustomerById(id);
  }
}
