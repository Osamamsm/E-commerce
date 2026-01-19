
//TODO: replace this validators with stripe built-in validators
class PaymentValidators {
  static String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Card number is required';
    }

    // Remove spaces and dashes
    final cardNumber = value.replaceAll(RegExp(r'[\s-]'), '');

    // Check if it contains only digits
    if (!RegExp(r'^\d+$').hasMatch(cardNumber)) {
      return 'Card number must contain only digits';
    }

    // Check length (most cards are 13-19 digits)
    if (cardNumber.length < 13 || cardNumber.length > 19) {
      return 'Card number must be between 13-19 digits';
    }

    // Luhn algorithm validation
    if (!_luhnCheck(cardNumber)) {
      return 'Invalid card number';
    }

    return null;
  }

  // Card holder name validation
  static String? validateCardHolderName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Card holder name is required';
    }

    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }

    // Check if it contains only letters and spaces
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Name must contain only letters';
    }

    return null;
  }

  // Expiry date validation (MM/YY format)
  static String? validateExpiryDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Expiry date is required';
    }

    // Remove slash if present
    final expiry = value.replaceAll('/', '');

    // Check format
    if (expiry.length != 4) {
      return 'Format must be MM/YY';
    }

    if (!RegExp(r'^\d{4}$').hasMatch(expiry)) {
      return 'Invalid expiry date';
    }

    final month = int.tryParse(expiry.substring(0, 2));
    final year = int.tryParse(expiry.substring(2, 4));

    if (month == null || year == null) {
      return 'Invalid expiry date';
    }

    if (month < 1 || month > 12) {
      return 'Invalid month';
    }

    // Check if card is expired
    final now = DateTime.now();
    final currentYear = now.year % 100; // Get last 2 digits
    final currentMonth = now.month;

    if (year < currentYear || (year == currentYear && month < currentMonth)) {
      return 'Card has expired';
    }

    return null;
  }

  // CVV validation
  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return 'CVV is required';
    }

    if (!RegExp(r'^\d{3,4}$').hasMatch(value)) {
      return 'CVV must be 3 or 4 digits';
    }

    return null;
  }

  // Luhn algorithm for card number validation
  static bool _luhnCheck(String cardNumber) {
    int sum = 0;
    bool alternate = false;

    for (int i = cardNumber.length - 1; i >= 0; i--) {
      int digit = int.parse(cardNumber[i]);

      if (alternate) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }

      sum += digit;
      alternate = !alternate;
    }

    return sum % 10 == 0;
  }

  // Get card type from card number
  static String getCardType(String cardNumber) {
    final number = cardNumber.replaceAll(RegExp(r'[\s-]'), '');

    if (number.isEmpty) return 'unknown';

    // Visa
    if (RegExp(r'^4').hasMatch(number)) {
      return 'visa';
    }

    // Mastercard
    if (RegExp(r'^5[1-5]').hasMatch(number) ||
        RegExp(r'^2[2-7]').hasMatch(number)) {
      return 'mastercard';
    }

    // American Express
    if (RegExp(r'^3[47]').hasMatch(number)) {
      return 'amex';
    }

    // Discover
    if (RegExp(r'^6(?:011|5)').hasMatch(number)) {
      return 'discover';
    }

    return 'unknown';
  }
}