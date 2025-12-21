import '../models/customer.dart';

class CustomerService {
  // In a real app, this would interact with a database or API
  static final List<Customer> _customers = [];

  // Add a new customer
  void addCustomer(Customer customer) {
    _customers.add(customer);
  }

  // Get all customers
  List<Customer> getCustomers() {
    return _customers;
  }

  // Get a customer by ID
  Customer? getCustomerById(String id) {
    return _customers.firstWhere((customer) => customer.id == id);
  }

  // Update a customer
  void updateCustomer(String id, Customer updatedCustomer) {
    final index = _customers.indexWhere((customer) => customer.id == id);
    if (index != -1) {
      _customers[index] = updatedCustomer;
    }
  }

  // Delete a customer
  void deleteCustomer(String id) {
    _customers.removeWhere((customer) => customer.id == id);
  }

  // Get a customer by mobile number
  Customer? getCustomerByMobile(String mobile) {
    return _customers.firstWhere((customer) => customer.mobile == mobile);
  }
}
