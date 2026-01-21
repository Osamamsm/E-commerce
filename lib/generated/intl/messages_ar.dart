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
    "account": MessageLookupByLibrary.simpleMessage("الحساب"),
    "account_information": MessageLookupByLibrary.simpleMessage(
      "معلومات الحساب",
    ),
    "account_status": MessageLookupByLibrary.simpleMessage("حالة الحساب"),
    "add_new_address": MessageLookupByLibrary.simpleMessage("أضف عنوان جديد"),
    "add_payment_method": MessageLookupByLibrary.simpleMessage("أضف طريقة دفع"),
    "add_review": MessageLookupByLibrary.simpleMessage("أضف رأيك"),
    "add_to_cart": MessageLookupByLibrary.simpleMessage("أضف إلى العربة"),
    "address_details": MessageLookupByLibrary.simpleMessage("تفاصيل العنوان"),
    "app_name": MessageLookupByLibrary.simpleMessage("E-Commerce App"),
    "apt_suite_etc": MessageLookupByLibrary.simpleMessage("المنزل/الشقة/الخ"),
    "card_holder": MessageLookupByLibrary.simpleMessage("حامل البطاقة"),
    "card_holder_name": MessageLookupByLibrary.simpleMessage(
      "اسم حامل البطاقة",
    ),
    "card_number": MessageLookupByLibrary.simpleMessage("رقم البطاقة"),
    "cart": MessageLookupByLibrary.simpleMessage("العربة"),
    "change_password": MessageLookupByLibrary.simpleMessage(
      "تغيير كلمه المرور",
    ),
    "city": MessageLookupByLibrary.simpleMessage("المدينة"),
    "color": MessageLookupByLibrary.simpleMessage("اللون"),
    "confirm_password": MessageLookupByLibrary.simpleMessage(
      "تأكيد كلمه المرور",
    ),
    "confirm_password_hint": MessageLookupByLibrary.simpleMessage(
      "أدخل تأكيد كلمه المرور",
    ),
    "contact_info": MessageLookupByLibrary.simpleMessage("معلومات الاتصال"),
    "create_account": MessageLookupByLibrary.simpleMessage("إنشاء حساب"),
    "cvv_cvc": MessageLookupByLibrary.simpleMessage("CVV / CVC"),
    "default_": MessageLookupByLibrary.simpleMessage("الافتراضي"),
    "delete": MessageLookupByLibrary.simpleMessage("حذف"),
    "discount": MessageLookupByLibrary.simpleMessage("الخصم"),
    "edit": MessageLookupByLibrary.simpleMessage("تعديل"),
    "edit_address": MessageLookupByLibrary.simpleMessage("تعديل العنوان"),
    "edit_profile": MessageLookupByLibrary.simpleMessage("تعديل الملف الشخصي"),
    "email": MessageLookupByLibrary.simpleMessage("البريد الالكتروني"),
    "email_hint": MessageLookupByLibrary.simpleMessage(
      "أدخل البريد الالكتروني",
    ),
    "expires": MessageLookupByLibrary.simpleMessage("تاريخ الانتهاء"),
    "expiry_date": MessageLookupByLibrary.simpleMessage("تاريخ الانتهاء"),
    "failed_to_load_profile": MessageLookupByLibrary.simpleMessage(
      "فشل في تحميل الملف الشخصي",
    ),
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
    "home": MessageLookupByLibrary.simpleMessage("المنزل"),
    "label_as": MessageLookupByLibrary.simpleMessage("التصنيف كـ"),
    "login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
    "login_welcome_message": MessageLookupByLibrary.simpleMessage(
      "مرحبا بعودتك!",
    ),
    "login_welcome_subtitle": MessageLookupByLibrary.simpleMessage(
      "سجّل الدخول لمتابعة رحلتك",
    ),
    "member_since": MessageLookupByLibrary.simpleMessage("عضو منذ"),
    "my_addresses": MessageLookupByLibrary.simpleMessage("عناويني"),
    "my_cart": MessageLookupByLibrary.simpleMessage("عربتي"),
    "my_orders": MessageLookupByLibrary.simpleMessage("طلباتي"),
    "no_account": MessageLookupByLibrary.simpleMessage("ليس لديك حساب؟"),
    "order_history": MessageLookupByLibrary.simpleMessage("تاريخ الطلبات"),
    "other": MessageLookupByLibrary.simpleMessage("اخرى"),
    "password": MessageLookupByLibrary.simpleMessage("كلمه المرور"),
    "password_hint": MessageLookupByLibrary.simpleMessage("أدخل كلمه المرور"),
    "payment_methods": MessageLookupByLibrary.simpleMessage("طرق الدفع"),
    "personal_details": MessageLookupByLibrary.simpleMessage(
      "التفاصيل الشخصية",
    ),
    "phone_number": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
    "proceed_to_checkout": MessageLookupByLibrary.simpleMessage(
      "الانتقال للدفع",
    ),
    "product_description": MessageLookupByLibrary.simpleMessage("وصف المنتج"),
    "product_reviews": MessageLookupByLibrary.simpleMessage("اراء العملاء"),
    "profile": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
    "quick_access": MessageLookupByLibrary.simpleMessage("الوصول السريع"),
    "register": MessageLookupByLibrary.simpleMessage("سجل الآن"),
    "reset_password": MessageLookupByLibrary.simpleMessage(
      "إعادة تعيين كلمه المرور",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("إعادة المحاولة"),
    "review": m0,
    "review_hint_text": MessageLookupByLibrary.simpleMessage(
      "شارك ارائك حول هذا المنتج",
    ),
    "save": MessageLookupByLibrary.simpleMessage("حفظ"),
    "save_address": MessageLookupByLibrary.simpleMessage("حفظ العنوان"),
    "save_card": MessageLookupByLibrary.simpleMessage("حفظ البطاقة"),
    "saved_addresses": MessageLookupByLibrary.simpleMessage(
      "العناوين المحفوظة",
    ),
    "search_hint": MessageLookupByLibrary.simpleMessage("بحث عن المنتجات..."),
    "security": MessageLookupByLibrary.simpleMessage("الامان"),
    "see_all_reviews": MessageLookupByLibrary.simpleMessage("شاهد جميع الاراء"),
    "set_as_default": MessageLookupByLibrary.simpleMessage("تعيين كافتراضي"),
    "set_as_default_address": MessageLookupByLibrary.simpleMessage(
      "تعيين كافتراضي",
    ),
    "set_as_default_payment_method": MessageLookupByLibrary.simpleMessage(
      "تعيين كافتراضي",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("الاعدادات"),
    "shipping": MessageLookupByLibrary.simpleMessage("الشحن"),
    "shop_by_category": MessageLookupByLibrary.simpleMessage("تسوق حسب الفئة"),
    "sign_out": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
    "size": MessageLookupByLibrary.simpleMessage("الحجم"),
    "street_address": MessageLookupByLibrary.simpleMessage("العنوان"),
    "submit_review": MessageLookupByLibrary.simpleMessage("ارسال رأيك"),
    "subtotal": MessageLookupByLibrary.simpleMessage("الإجمالي"),
    "tax": MessageLookupByLibrary.simpleMessage("الضريبة"),
    "total": MessageLookupByLibrary.simpleMessage("الإجمالي"),
    "use_this_address_for_checkout": MessageLookupByLibrary.simpleMessage(
      "استخدم هذا العنوان لإتمام عملية الشراء",
    ),
    "use_this_payment_method_for_checkout":
        MessageLookupByLibrary.simpleMessage(
          "استخدم طريقة الدفع هذه لإتمام عملية الشراء",
        ),
    "wishlist": MessageLookupByLibrary.simpleMessage("المفضلة"),
    "work": MessageLookupByLibrary.simpleMessage("العمل"),
    "your_payment_info_is_stored_securely":
        MessageLookupByLibrary.simpleMessage(
          "معلومات الدفع الخاصة بك محفوظة بأمان",
        ),
  };
}
