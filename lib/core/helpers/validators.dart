class Validators {
  static String? emailValidator(String? value) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    if (!emailRegex.hasMatch(value)) {
      return 'Email is invalid';
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  static String? fullNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full Name is required';
    }
    return null;
  }

  static String? confirmPasswordValidator(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required';
    }
    if (value != password) {
      return 'Confirm Password must match Password';
    }
    return null;
  }
}
