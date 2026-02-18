import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:flutter/material.dart';

ImageProvider resolveUserAvatarImage({File? pickedImage, String? avatarUrl}) {
  if (pickedImage != null) {
    return FileImage(pickedImage);
  } else if (avatarUrl != null) {
    return CachedNetworkImageProvider(avatarUrl);
  } else {
    return CachedNetworkImageProvider(
      'https://cdn-icons-png.flaticon.com/512/149/149071.png',
    );
  }
}

bool _containsArabic(String text) {
  final arabicRegex = RegExp(r'[\u0600-\u06FF]');
  return arabicRegex.hasMatch(text);
}

bool _isArabicAddress(AddressEntity address) {
  final combined =
      '${address.governorate} ${address.city} ${address.district} ${address.street} ${address.building} ${address.floor} ${address.label}';
  return _containsArabic(combined);
}

// ------------------------------------------------------------
// 🧠 Multi-line formatted address (UI Friendly)
// ------------------------------------------------------------
String getFormattedAddress({required AddressEntity address}) {
  final isArabic = _isArabicAddress(address);

  final line1 = _cleanLine([
    address.district,
    address.street,
  ], separator: isArabic ? '، ' : ', ');

  final line2 = _cleanLine([
    isArabic ? 'عمارة ${address.building}' : 'Bldg ${address.building}',
    isArabic ? 'دور ${address.floor}' : 'Floor ${address.floor}',
    isArabic
        ? 'شقة ${address.apartmentNumber}'
        : 'Apt ${address.apartmentNumber}',
  ], separator: isArabic ? '، ' : ', ');

  final line3 = _cleanLine([
    address.city,
    address.governorate,
  ], separator: isArabic ? '، ' : ', ');

  final line4 =
      address.additionalNotes != null &&
          address.additionalNotes!.trim().isNotEmpty
      ? address.additionalNotes!.trim()
      : null;

  final lines = [
    if (line1 != null) line1,
    if (line2 != null) line2,
    if (line3 != null) line3,
    if (line4 != null) line4,
  ];

  final formattedAddress = lines.join('\n');

  // Apply Unicode direction wrapping to avoid RTL/LTR mixing bugs
  if (isArabic) {
    return '\u202B$formattedAddress\u202C'; // RTL
  } else {
    return '\u202A$formattedAddress\u202C'; // LTR
  }
}

// ------------------------------------------------------------
// 🧹 Helper to remove empty values
// ------------------------------------------------------------
String? _cleanLine(List<String?> parts, {required String separator}) {
  final cleaned = parts
      .where((e) => e != null && e.trim().isNotEmpty)
      .map((e) => e!.trim())
      .toList();

  if (cleaned.isEmpty) return null;

  return cleaned.join(separator);
}
