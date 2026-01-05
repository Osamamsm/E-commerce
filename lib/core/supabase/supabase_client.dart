import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@module
abstract class SupabaseClientProvider {
  @lazySingleton
  SupabaseClient get client => Supabase.instance.client;
}
