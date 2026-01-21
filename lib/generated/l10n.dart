// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Search for products...`
  String get search_hint {
    return Intl.message(
      'Search for products...',
      name: 'search_hint',
      desc: '',
      args: [],
    );
  }

  /// `Shop By Category`
  String get shop_by_category {
    return Intl.message(
      'Shop By Category',
      name: 'shop_by_category',
      desc: '',
      args: [],
    );
  }

  /// `Featured Products`
  String get featured_products {
    return Intl.message(
      'Featured Products',
      name: 'featured_products',
      desc: '',
      args: [],
    );
  }

  /// `Add To Cart`
  String get add_to_cart {
    return Intl.message('Add To Cart', name: 'add_to_cart', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Welcome back!`
  String get login_welcome_message {
    return Intl.message(
      'Welcome back!',
      name: 'login_welcome_message',
      desc: '',
      args: [],
    );
  }

  /// `Login to continue your journey`
  String get login_welcome_subtitle {
    return Intl.message(
      'Login to continue your journey',
      name: 'login_welcome_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Enter your email`
  String get email_hint {
    return Intl.message(
      'Enter your email',
      name: 'email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Enter your password`
  String get password_hint {
    return Intl.message(
      'Enter your password',
      name: 'password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get no_account {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'no_account',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message('Full Name', name: 'full_name', desc: '', args: []);
  }

  /// `Enter your full name`
  String get full_name_hint {
    return Intl.message(
      'Enter your full name',
      name: 'full_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your password`
  String get confirm_password_hint {
    return Intl.message(
      'Confirm your password',
      name: 'confirm_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email to reset your password`
  String get forgot_password_subtitle {
    return Intl.message(
      'Enter your email to reset your password',
      name: 'forgot_password_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `My Cart`
  String get my_cart {
    return Intl.message('My Cart', name: 'my_cart', desc: '', args: []);
  }

  /// `Color`
  String get color {
    return Intl.message('Color', name: 'color', desc: '', args: []);
  }

  /// `Size`
  String get size {
    return Intl.message('Size', name: 'size', desc: '', args: []);
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message('Subtotal', name: 'subtotal', desc: '', args: []);
  }

  /// `Shipping`
  String get shipping {
    return Intl.message('Shipping', name: 'shipping', desc: '', args: []);
  }

  /// `Tax`
  String get tax {
    return Intl.message('Tax', name: 'tax', desc: '', args: []);
  }

  /// `Discount`
  String get discount {
    return Intl.message('Discount', name: 'discount', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Proceed To Checkout`
  String get proceed_to_checkout {
    return Intl.message(
      'Proceed To Checkout',
      name: 'proceed_to_checkout',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =0{No reviews} =1{{count} review} other{{count} reviews}}`
  String review(num count) {
    return Intl.plural(
      count,
      zero: 'No reviews',
      one: '$count review',
      other: '$count reviews',
      name: 'review',
      desc: '',
      args: [count],
    );
  }

  /// `Product Description`
  String get product_description {
    return Intl.message(
      'Product Description',
      name: 'product_description',
      desc: '',
      args: [],
    );
  }

  /// `Customer Reviews`
  String get product_reviews {
    return Intl.message(
      'Customer Reviews',
      name: 'product_reviews',
      desc: '',
      args: [],
    );
  }

  /// `Add Your Review`
  String get add_review {
    return Intl.message(
      'Add Your Review',
      name: 'add_review',
      desc: '',
      args: [],
    );
  }

  /// `Share your thoughts about this product...`
  String get review_hint_text {
    return Intl.message(
      'Share your thoughts about this product...',
      name: 'review_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Submit Review`
  String get submit_review {
    return Intl.message(
      'Submit Review',
      name: 'submit_review',
      desc: '',
      args: [],
    );
  }

  /// `See All Reviews`
  String get see_all_reviews {
    return Intl.message(
      'See All Reviews',
      name: 'see_all_reviews',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Ok`
  String get ok {
    return Intl.message('Ok', name: 'ok', desc: '', args: []);
  }

  /// `If an account with this email exists, you will receive a verification email.`
  String get sign_up_success_message {
    return Intl.message(
      'If an account with this email exists, you will receive a verification email.',
      name: 'sign_up_success_message',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter New Password`
  String get enter_new_password {
    return Intl.message(
      'Enter New Password',
      name: 'enter_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password`
  String get enter_new_password_hint {
    return Intl.message(
      'Enter your new password',
      name: 'enter_new_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirm_new_password {
    return Intl.message(
      'Confirm New Password',
      name: 'confirm_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your new password`
  String get confirm_new_password_hint {
    return Intl.message(
      'Confirm your new password',
      name: 'confirm_new_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password reset successfully.`
  String get reset_password_success_message {
    return Intl.message(
      'Password reset successfully.',
      name: 'reset_password_success_message',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Please check your email for a link to reset your password. The link is valid for a limited time.`
  String get check_email_for_reset_link_message {
    return Intl.message(
      'Please check your email for a link to reset your password. The link is valid for a limited time.',
      name: 'check_email_for_reset_link_message',
      desc: '',
      args: [],
    );
  }

  /// `Password reset successfully.`
  String get password_reset_success {
    return Intl.message(
      'Password reset successfully.',
      name: 'password_reset_success',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Order History`
  String get order_history {
    return Intl.message(
      'Order History',
      name: 'order_history',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get sign_out {
    return Intl.message('Sign Out', name: 'sign_out', desc: '', args: []);
  }

  /// `Saved Addresses`
  String get saved_addresses {
    return Intl.message(
      'Saved Addresses',
      name: 'saved_addresses',
      desc: '',
      args: [],
    );
  }

  /// `Wishlist`
  String get wishlist {
    return Intl.message('Wishlist', name: 'wishlist', desc: '', args: []);
  }

  /// `Payment Methods`
  String get payment_methods {
    return Intl.message(
      'Payment Methods',
      name: 'payment_methods',
      desc: '',
      args: [],
    );
  }

  /// `My Addresses`
  String get my_addresses {
    return Intl.message(
      'My Addresses',
      name: 'my_addresses',
      desc: '',
      args: [],
    );
  }

  /// `Default`
  String get default_ {
    return Intl.message('Default', name: 'default_', desc: '', args: []);
  }

  /// `Set as Default`
  String get set_as_default {
    return Intl.message(
      'Set as Default',
      name: 'set_as_default',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Add New Address`
  String get add_new_address {
    return Intl.message(
      'Add New Address',
      name: 'add_new_address',
      desc: '',
      args: [],
    );
  }

  /// `LABEL AS`
  String get label_as {
    return Intl.message('LABEL AS', name: 'label_as', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Work`
  String get work {
    return Intl.message('Work', name: 'work', desc: '', args: []);
  }

  /// `Other`
  String get other {
    return Intl.message('Other', name: 'other', desc: '', args: []);
  }

  /// `Contact Info`
  String get contact_info {
    return Intl.message(
      'Contact Info',
      name: 'contact_info',
      desc: '',
      args: [],
    );
  }

  /// `Address Details`
  String get address_details {
    return Intl.message(
      'Address Details',
      name: 'address_details',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Street Address`
  String get street_address {
    return Intl.message(
      'Street Address',
      name: 'street_address',
      desc: '',
      args: [],
    );
  }

  /// `Apt. Suite, etc. (Optional)`
  String get apt_suite_etc {
    return Intl.message(
      'Apt. Suite, etc. (Optional)',
      name: 'apt_suite_etc',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Save Address`
  String get save_address {
    return Intl.message(
      'Save Address',
      name: 'save_address',
      desc: '',
      args: [],
    );
  }

  /// `Set as default address`
  String get set_as_default_address {
    return Intl.message(
      'Set as default address',
      name: 'set_as_default_address',
      desc: '',
      args: [],
    );
  }

  /// `Use this address for checkout`
  String get use_this_address_for_checkout {
    return Intl.message(
      'Use this address for checkout',
      name: 'use_this_address_for_checkout',
      desc: '',
      args: [],
    );
  }

  /// `Edit Address`
  String get edit_address {
    return Intl.message(
      'Edit Address',
      name: 'edit_address',
      desc: '',
      args: [],
    );
  }

  /// `Card Holder`
  String get card_holder {
    return Intl.message('Card Holder', name: 'card_holder', desc: '', args: []);
  }

  /// `Expires`
  String get expires {
    return Intl.message('Expires', name: 'expires', desc: '', args: []);
  }

  /// `Add Payment Method`
  String get add_payment_method {
    return Intl.message(
      'Add Payment Method',
      name: 'add_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Save Card`
  String get save_card {
    return Intl.message('Save Card', name: 'save_card', desc: '', args: []);
  }

  /// `Card Number`
  String get card_number {
    return Intl.message('Card Number', name: 'card_number', desc: '', args: []);
  }

  /// `Card Holder Name`
  String get card_holder_name {
    return Intl.message(
      'Card Holder Name',
      name: 'card_holder_name',
      desc: '',
      args: [],
    );
  }

  /// `Expiry Date`
  String get expiry_date {
    return Intl.message('Expiry Date', name: 'expiry_date', desc: '', args: []);
  }

  /// `CVV / CVC`
  String get cvv_cvc {
    return Intl.message('CVV / CVC', name: 'cvv_cvc', desc: '', args: []);
  }

  /// `Set as default payment method`
  String get set_as_default_payment_method {
    return Intl.message(
      'Set as default payment method',
      name: 'set_as_default_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Use this payment method for checkout`
  String get use_this_payment_method_for_checkout {
    return Intl.message(
      'Use this payment method for checkout',
      name: 'use_this_payment_method_for_checkout',
      desc: '',
      args: [],
    );
  }

  /// `Your payment info is stored securely`
  String get your_payment_info_is_stored_securely {
    return Intl.message(
      'Your payment info is stored securely',
      name: 'your_payment_info_is_stored_securely',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Account Information`
  String get account_information {
    return Intl.message(
      'Account Information',
      name: 'account_information',
      desc: '',
      args: [],
    );
  }

  /// `Personal Details`
  String get personal_details {
    return Intl.message(
      'Personal Details',
      name: 'personal_details',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get my_orders {
    return Intl.message('My Orders', name: 'my_orders', desc: '', args: []);
  }

  /// `Quick Access`
  String get quick_access {
    return Intl.message(
      'Quick Access',
      name: 'quick_access',
      desc: '',
      args: [],
    );
  }

  /// `Security`
  String get security {
    return Intl.message('Security', name: 'security', desc: '', args: []);
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Member Since`
  String get member_since {
    return Intl.message(
      'Member Since',
      name: 'member_since',
      desc: '',
      args: [],
    );
  }

  /// `Account Status`
  String get account_status {
    return Intl.message(
      'Account Status',
      name: 'account_status',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load profile`
  String get failed_to_load_profile {
    return Intl.message(
      'Failed to load profile',
      name: 'failed_to_load_profile',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `E-Commerce App`
  String get app_name {
    return Intl.message('E-Commerce App', name: 'app_name', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
