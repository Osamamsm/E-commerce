// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(count) =>
      "${Intl.plural(count, zero: 'لا مراجعات', one: '${count} مراجعة', two: '${count} مراجعتان', few: '${count} مراجعات', many: '${count} مراجعة', other: '${count} مراجعة')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "add_review": MessageLookupByLibrary.simpleMessage("أضف رأيك"),
    "add_to_cart": MessageLookupByLibrary.simpleMessage("أضف إلى العربة"),
    "cart": MessageLookupByLibrary.simpleMessage("العربة"),
    "color": MessageLookupByLibrary.simpleMessage("اللون"),
    "confirm_password": MessageLookupByLibrary.simpleMessage(
      "تأكيد كلمه المرور",
    ),
    "confirm_password_hint": MessageLookupByLibrary.simpleMessage(
      "أدخل تأكيد كلمه المرور",
    ),
    "create_account": MessageLookupByLibrary.simpleMessage("إنشاء حساب"),
    "discount": MessageLookupByLibrary.simpleMessage("الخصم"),
    "email": MessageLookupByLibrary.simpleMessage("البريد الالكتروني"),
    "email_hint": MessageLookupByLibrary.simpleMessage(
      "أدخل البريد الالكتروني",
    ),
    "error": MessageLookupByLibrary.simpleMessage("خطأ"),
    "featured_products": MessageLookupByLibrary.simpleMessage(
      "المنتجات المميزة",
    ),
    "forgot_password": MessageLookupByLibrary.simpleMessage(
      " هل نسيت كلمه المرور؟",
    ),
    "forgot_password_subtitle": MessageLookupByLibrary.simpleMessage(
      "أدخل البريد الالكتروني لاستعادة كلمه المرور",
    ),
    "full_name": MessageLookupByLibrary.simpleMessage("الاسم الكامل"),
    "full_name_hint": MessageLookupByLibrary.simpleMessage("أدخل الاسم الكامل"),
    "login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
    "login_welcome_message": MessageLookupByLibrary.simpleMessage(
      "مرحبا بعودتك!",
    ),
    "login_welcome_subtitle": MessageLookupByLibrary.simpleMessage(
      "سجّل الدخول لمتابعة رحلتك",
    ),
    "my_cart": MessageLookupByLibrary.simpleMessage("عربتي"),
    "no_account": MessageLookupByLibrary.simpleMessage("ليس لديك حساب؟"),
    "ok": MessageLookupByLibrary.simpleMessage("حسنا"),
    "password": MessageLookupByLibrary.simpleMessage("كلمه المرور"),
    "password_hint": MessageLookupByLibrary.simpleMessage("أدخل كلمه المرور"),
    "proceed_to_checkout": MessageLookupByLibrary.simpleMessage(
      "الانتقال للدفع",
    ),
    "product_description": MessageLookupByLibrary.simpleMessage("وصف المنتج"),
    "product_reviews": MessageLookupByLibrary.simpleMessage("اراء العملاء"),
    "register": MessageLookupByLibrary.simpleMessage("سجل الآن"),
    "reset_password": MessageLookupByLibrary.simpleMessage(
      "إعادة تعيين كلمه المرور",
    ),
    "review": m0,
    "review_hint_text": MessageLookupByLibrary.simpleMessage(
      "شارك ارائك حول هذا المنتج",
    ),
    "search_hint": MessageLookupByLibrary.simpleMessage("بحث عن المنتجات..."),
    "see_all_reviews": MessageLookupByLibrary.simpleMessage("شاهد جميع الاراء"),
    "shipping": MessageLookupByLibrary.simpleMessage("الشحن"),
    "shop_by_category": MessageLookupByLibrary.simpleMessage("تسوق حسب الفئة"),
    "size": MessageLookupByLibrary.simpleMessage("الحجم"),
    "submit_review": MessageLookupByLibrary.simpleMessage("ارسال رأيك"),
    "subtotal": MessageLookupByLibrary.simpleMessage("الإجمالي"),
    "tax": MessageLookupByLibrary.simpleMessage("الضريبة"),
    "total": MessageLookupByLibrary.simpleMessage("الإجمالي"),
  };
}
