// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) =>
      "${Intl.plural(count, zero: 'No reviews', one: '${count} review', other: '${count} reviews')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "add_review": MessageLookupByLibrary.simpleMessage("Add Your Review"),
    "add_to_cart": MessageLookupByLibrary.simpleMessage("Add To Cart"),
    "cart": MessageLookupByLibrary.simpleMessage("Cart"),
    "color": MessageLookupByLibrary.simpleMessage("Color"),
    "confirm_password": MessageLookupByLibrary.simpleMessage(
      "Confirm Password",
    ),
    "confirm_password_hint": MessageLookupByLibrary.simpleMessage(
      "Confirm your password",
    ),
    "create_account": MessageLookupByLibrary.simpleMessage("Create Account"),
    "discount": MessageLookupByLibrary.simpleMessage("Discount"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "email_hint": MessageLookupByLibrary.simpleMessage("Enter your email"),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "featured_products": MessageLookupByLibrary.simpleMessage(
      "Featured Products",
    ),
    "forgot_password": MessageLookupByLibrary.simpleMessage("Forgot Password?"),
    "forgot_password_subtitle": MessageLookupByLibrary.simpleMessage(
      "Enter your email to reset your password",
    ),
    "full_name": MessageLookupByLibrary.simpleMessage("Full Name"),
    "full_name_hint": MessageLookupByLibrary.simpleMessage(
      "Enter your full name",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "login_welcome_message": MessageLookupByLibrary.simpleMessage(
      "Welcome back!",
    ),
    "login_welcome_subtitle": MessageLookupByLibrary.simpleMessage(
      "Login to continue your journey",
    ),
    "my_cart": MessageLookupByLibrary.simpleMessage("My Cart"),
    "no_account": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account? ",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("Ok"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "password_hint": MessageLookupByLibrary.simpleMessage(
      "Enter your password",
    ),
    "proceed_to_checkout": MessageLookupByLibrary.simpleMessage(
      "Proceed To Checkout",
    ),
    "product_description": MessageLookupByLibrary.simpleMessage(
      "Product Description",
    ),
    "product_reviews": MessageLookupByLibrary.simpleMessage("Customer Reviews"),
    "register": MessageLookupByLibrary.simpleMessage("Register"),
    "reset_password": MessageLookupByLibrary.simpleMessage("Reset Password"),
    "review": m0,
    "review_hint_text": MessageLookupByLibrary.simpleMessage(
      "Share your thoughts about this product...",
    ),
    "search_hint": MessageLookupByLibrary.simpleMessage(
      "Search for products...",
    ),
    "see_all_reviews": MessageLookupByLibrary.simpleMessage("See All Reviews"),
    "shipping": MessageLookupByLibrary.simpleMessage("Shipping"),
    "shop_by_category": MessageLookupByLibrary.simpleMessage(
      "Shop By Category",
    ),
    "size": MessageLookupByLibrary.simpleMessage("Size"),
    "submit_review": MessageLookupByLibrary.simpleMessage("Submit Review"),
    "subtotal": MessageLookupByLibrary.simpleMessage("Subtotal"),
    "tax": MessageLookupByLibrary.simpleMessage("Tax"),
    "total": MessageLookupByLibrary.simpleMessage("Total"),
  };
}
